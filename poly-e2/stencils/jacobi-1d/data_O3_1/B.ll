; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
define internal fastcc void @init_array(i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

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
  %scevgep6 = getelementptr double, double* %B, i64 %wide.trip.count
  %bound0 = icmp ugt double* %scevgep6, %A
  %bound1 = icmp ugt double* %scevgep, %B
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %conv1, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind8 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next9, %vector.body ]
  %1 = sitofp <2 x i32> %vec.ind8 to <2 x double>
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
  %vec.ind.next9 = add <2 x i32> %vec.ind8, <i32 2, i32 2>
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
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %cmp5 = icmp sgt i32 %tsteps, 0
  br i1 %cmp5, label %for.cond1.preheader.lr.ph, label %for.end35

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp21 = icmp sgt i32 %sub, 1
  br i1 %cmp21, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %tsteps, -1
  %xtraiter96 = and i32 %tsteps, 7
  %lcmp.mod97 = icmp eq i32 %xtraiter96, 0
  br i1 %lcmp.mod97, label %for.cond1.preheader.prol.loopexit, label %for.cond1.preheader.prol.preheader

for.cond1.preheader.prol.preheader:               ; preds = %for.cond1.preheader.preheader
  br label %for.cond1.preheader.prol

for.cond1.preheader.prol:                         ; preds = %for.cond1.preheader.prol, %for.cond1.preheader.prol.preheader
  %t.06.prol = phi i32 [ %inc34.prol, %for.cond1.preheader.prol ], [ 0, %for.cond1.preheader.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond1.preheader.prol ], [ %xtraiter96, %for.cond1.preheader.prol.preheader ]
  %inc34.prol = add nuw nsw i32 %t.06.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond1.preheader.prol.loopexit.unr-lcssa, label %for.cond1.preheader.prol, !llvm.loop !10

for.cond1.preheader.prol.loopexit.unr-lcssa:      ; preds = %for.cond1.preheader.prol
  br label %for.cond1.preheader.prol.loopexit

for.cond1.preheader.prol.loopexit:                ; preds = %for.cond1.preheader.preheader, %for.cond1.preheader.prol.loopexit.unr-lcssa
  %t.06.unr = phi i32 [ 0, %for.cond1.preheader.preheader ], [ %inc34.prol, %for.cond1.preheader.prol.loopexit.unr-lcssa ]
  %1 = icmp ult i32 %0, 7
  br i1 %1, label %for.end35.loopexit95, label %for.cond1.preheader.preheader.new

for.cond1.preheader.preheader.new:                ; preds = %for.cond1.preheader.prol.loopexit
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %2 = add i32 %n, -2
  %3 = add i32 %n, -3
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %4 = icmp eq i32 %3, 0
  %xtraiter13 = and i32 %2, 1
  %lcmp.mod14 = icmp eq i32 %xtraiter13, 0
  %5 = icmp eq i32 %3, 0
  %wide.trip.count12.1 = zext i32 %sub to i64
  %arrayidx21.us.prol = getelementptr inbounds double, double* %B, i64 1
  %arrayidx25.us.prol = getelementptr inbounds double, double* %B, i64 2
  %arrayidx29.us.prol = getelementptr inbounds double, double* %A, i64 1
  %wide.trip.count.1 = zext i32 %sub to i64
  %arrayidx6.us.prol = getelementptr inbounds double, double* %A, i64 1
  %arrayidx9.us.prol = getelementptr inbounds double, double* %A, i64 2
  %arrayidx12.us.prol = getelementptr inbounds double, double* %B, i64 1
  %6 = add nsw i64 %wide.trip.count12.1, -2
  %scevgep32 = getelementptr double, double* %A, i64 2
  %7 = add nsw i64 %wide.trip.count12.1, -2
  %scevgep35 = getelementptr double, double* %B, i64 -1
  %scevgep38 = getelementptr double, double* %B, i64 3
  %8 = add nsw i64 %wide.trip.count12.1, -2
  %scevgep59 = getelementptr double, double* %B, i64 2
  %9 = add nsw i64 %wide.trip.count12.1, -2
  %scevgep62 = getelementptr double, double* %A, i64 -1
  %scevgep65 = getelementptr double, double* %A, i64 3
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc33.us, %for.cond1.preheader.us.preheader
  %t.06.us = phi i32 [ %inc34.us, %for.inc33.us ], [ 0, %for.cond1.preheader.us.preheader ]
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
  %min.iters.check51 = icmp ult i64 %15, 2
  br i1 %min.iters.check51, label %for.body3.us.preheader94, label %min.iters.checked52

for.body3.us.preheader94:                         ; preds = %middle.block49, %vector.memcheck72, %min.iters.checked52, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck72 ], [ %indvars.iv.unr.ph, %min.iters.checked52 ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ], [ %ind.end77, %middle.block49 ]
  br label %for.body3.us

min.iters.checked52:                              ; preds = %for.body3.us.preheader
  %n.mod.vf53 = and i64 %15, 1
  %n.vec54 = sub i64 %15, %n.mod.vf53
  %cmp.zero55 = icmp eq i64 %n.vec54, 0
  br i1 %cmp.zero55, label %for.body3.us.preheader94, label %vector.memcheck72

vector.memcheck72:                                ; preds = %min.iters.checked52
  %scevgep57 = getelementptr double, double* %B, i64 %indvars.iv.unr.ph
  %16 = sub nsw i64 %9, %indvars.iv.unr.ph
  %17 = and i64 %16, -2
  %18 = add nsw i64 %indvars.iv.unr.ph, %17
  %scevgep60 = getelementptr double, double* %scevgep59, i64 %18
  %scevgep63 = getelementptr double, double* %scevgep62, i64 %indvars.iv.unr.ph
  %scevgep66 = getelementptr double, double* %scevgep65, i64 %18
  %bound068 = icmp ult double* %scevgep57, %scevgep66
  %bound169 = icmp ult double* %scevgep63, %scevgep60
  %memcheck.conflict71 = and i1 %bound068, %bound169
  %19 = add nuw nsw i64 %indvars.iv.unr.ph, 2
  %20 = shl nuw i64 %14, 1
  %21 = add i64 %19, %20
  %22 = shl nuw nsw i64 %n.mod.vf53, 1
  %ind.end77 = sub i64 %21, %22
  br i1 %memcheck.conflict71, label %for.body3.us.preheader94, label %vector.body48.preheader

vector.body48.preheader:                          ; preds = %vector.memcheck72
  br label %vector.body48

vector.body48:                                    ; preds = %vector.body48.preheader, %vector.body48
  %index74 = phi i64 [ %index.next75, %vector.body48 ], [ 0, %vector.body48.preheader ]
  %23 = shl i64 %index74, 1
  %offset.idx79 = or i64 %indvars.iv.unr.ph, %23
  %24 = add nsw i64 %offset.idx79, -1
  %25 = getelementptr inbounds double, double* %A, i64 %24
  %26 = bitcast double* %25 to <4 x double>*
  %wide.vec83 = load <4 x double>, <4 x double>* %26, align 8, !alias.scope !12
  %strided.vec84 = shufflevector <4 x double> %wide.vec83, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec85 = shufflevector <4 x double> %wide.vec83, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %27 = fadd <2 x double> %strided.vec84, %strided.vec85
  %28 = add nuw nsw i64 %offset.idx79, 1
  %29 = getelementptr inbounds double, double* %A, i64 %28
  %30 = getelementptr double, double* %29, i64 -1
  %31 = bitcast double* %30 to <4 x double>*
  %wide.vec86 = load <4 x double>, <4 x double>* %31, align 8, !alias.scope !12
  %strided.vec88 = shufflevector <4 x double> %wide.vec86, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %32 = fadd <2 x double> %27, %strided.vec88
  %33 = fmul <2 x double> %32, <double 3.333300e-01, double 3.333300e-01>
  %34 = bitcast double* %29 to <4 x double>*
  %wide.vec89 = load <4 x double>, <4 x double>* %34, align 8, !alias.scope !12
  %strided.vec91 = shufflevector <4 x double> %wide.vec89, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %35 = fadd <4 x double> %wide.vec86, %wide.vec89
  %36 = shufflevector <4 x double> %35, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %37 = fadd <2 x double> %36, %strided.vec91
  %38 = fmul <2 x double> %37, <double 3.333300e-01, double 3.333300e-01>
  %39 = getelementptr inbounds double, double* %B, i64 %28
  %40 = getelementptr double, double* %39, i64 -1
  %41 = bitcast double* %40 to <4 x double>*
  %interleaved.vec92 = shufflevector <2 x double> %33, <2 x double> %38, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec92, <4 x double>* %41, align 8, !alias.scope !15, !noalias !12
  %index.next75 = add i64 %index74, 2
  %42 = icmp eq i64 %index.next75, %n.vec54
  br i1 %42, label %middle.block49, label %vector.body48, !llvm.loop !17

middle.block49:                                   ; preds = %vector.body48
  %cmp.n78 = icmp eq i64 %n.mod.vf53, 0
  br i1 %cmp.n78, label %for.body16.us.preheader, label %for.body3.us.preheader94

for.inc33.us.loopexit:                            ; preds = %for.body16.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.inc33.us.loopexit, %middle.block, %for.body16.us.prol.loopexit
  %inc34.us = add nuw nsw i32 %t.06.us, 1
  %exitcond = icmp eq i32 %inc34.us, %tsteps
  br i1 %exitcond, label %for.end35.loopexit, label %for.cond1.preheader.us

for.body16.us:                                    ; preds = %for.body16.us.preheader93, %for.body16.us
  %indvars.iv9 = phi i64 [ %indvars.iv.next10.1, %for.body16.us ], [ %indvars.iv9.ph, %for.body16.us.preheader93 ]
  %43 = add nsw i64 %indvars.iv9, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %43
  %44 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv9
  %45 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %44, %45
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next10
  %46 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %46
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv9
  store double %mul27.us, double* %arrayidx29.us, align 8
  %arrayidx19.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv9
  %47 = load double, double* %arrayidx19.us.1, align 8
  %arrayidx21.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next10
  %48 = load double, double* %arrayidx21.us.1, align 8
  %add22.us.1 = fadd double %47, %48
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %arrayidx25.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next10.1
  %49 = load double, double* %arrayidx25.us.1, align 8
  %add26.us.1 = fadd double %add22.us.1, %49
  %mul27.us.1 = fmul double %add26.us.1, 3.333300e-01
  %arrayidx29.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next10
  store double %mul27.us.1, double* %arrayidx29.us.1, align 8
  %exitcond.116 = icmp eq i64 %indvars.iv.next10.1, %wide.trip.count12.1
  br i1 %exitcond.116, label %for.inc33.us.loopexit, label %for.body16.us, !llvm.loop !18

for.body3.us:                                     ; preds = %for.body3.us.preheader94, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader94 ]
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

for.body16.us.preheader:                          ; preds = %for.body16.us.preheader.loopexit, %for.body3.us.prol.loopexit, %middle.block49
  br i1 %lcmp.mod14, label %for.body16.us.prol.loopexit, label %for.body16.us.prol

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
  %indvars.iv9.unr.ph = phi i64 [ 2, %for.body16.us.prol ], [ 1, %for.body16.us.preheader ]
  br i1 %5, label %for.inc33.us, label %for.body16.us.preheader28

for.body16.us.preheader28:                        ; preds = %for.body16.us.prol.loopexit
  %60 = sub nsw i64 %6, %indvars.iv9.unr.ph
  %61 = lshr i64 %60, 1
  %62 = add nuw i64 %61, 1
  %min.iters.check = icmp ult i64 %62, 2
  br i1 %min.iters.check, label %for.body16.us.preheader93, label %min.iters.checked

for.body16.us.preheader93:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body16.us.preheader28
  %indvars.iv9.ph = phi i64 [ %indvars.iv9.unr.ph, %vector.memcheck ], [ %indvars.iv9.unr.ph, %min.iters.checked ], [ %indvars.iv9.unr.ph, %for.body16.us.preheader28 ], [ %ind.end, %middle.block ]
  br label %for.body16.us

min.iters.checked:                                ; preds = %for.body16.us.preheader28
  %n.mod.vf = and i64 %62, 1
  %n.vec = sub i64 %62, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body16.us.preheader93, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %A, i64 %indvars.iv9.unr.ph
  %63 = sub nsw i64 %7, %indvars.iv9.unr.ph
  %64 = and i64 %63, -2
  %65 = add nsw i64 %indvars.iv9.unr.ph, %64
  %scevgep33 = getelementptr double, double* %scevgep32, i64 %65
  %scevgep36 = getelementptr double, double* %scevgep35, i64 %indvars.iv9.unr.ph
  %scevgep39 = getelementptr double, double* %scevgep38, i64 %65
  %bound0 = icmp ult double* %scevgep, %scevgep39
  %bound1 = icmp ult double* %scevgep36, %scevgep33
  %memcheck.conflict = and i1 %bound0, %bound1
  %66 = add nuw nsw i64 %indvars.iv9.unr.ph, 2
  %67 = shl nuw i64 %61, 1
  %68 = add i64 %66, %67
  %69 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %68, %69
  br i1 %memcheck.conflict, label %for.body16.us.preheader93, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %70 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv9.unr.ph, %70
  %71 = add nsw i64 %offset.idx, -1
  %72 = getelementptr inbounds double, double* %B, i64 %71
  %73 = bitcast double* %72 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %73, align 8, !alias.scope !20
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec41 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %74 = fadd <2 x double> %strided.vec, %strided.vec41
  %75 = add nuw nsw i64 %offset.idx, 1
  %76 = getelementptr inbounds double, double* %B, i64 %75
  %77 = getelementptr double, double* %76, i64 -1
  %78 = bitcast double* %77 to <4 x double>*
  %wide.vec42 = load <4 x double>, <4 x double>* %78, align 8, !alias.scope !20
  %strided.vec44 = shufflevector <4 x double> %wide.vec42, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %79 = fadd <2 x double> %74, %strided.vec44
  %80 = fmul <2 x double> %79, <double 3.333300e-01, double 3.333300e-01>
  %81 = bitcast double* %76 to <4 x double>*
  %wide.vec45 = load <4 x double>, <4 x double>* %81, align 8, !alias.scope !20
  %strided.vec47 = shufflevector <4 x double> %wide.vec45, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %82 = fadd <4 x double> %wide.vec42, %wide.vec45
  %83 = shufflevector <4 x double> %82, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %84 = fadd <2 x double> %83, %strided.vec47
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
  br i1 %cmp.n, label %for.inc33.us, label %for.body16.us.preheader93

for.cond1.preheader:                              ; preds = %for.cond1.preheader, %for.cond1.preheader.preheader.new
  %t.06 = phi i32 [ %t.06.unr, %for.cond1.preheader.preheader.new ], [ %inc34.7, %for.cond1.preheader ]
  %inc34.7 = add nsw i32 %t.06, 8
  %exitcond24.7 = icmp eq i32 %inc34.7, %tsteps
  br i1 %exitcond24.7, label %for.end35.loopexit95.unr-lcssa, label %for.cond1.preheader

for.end35.loopexit:                               ; preds = %for.inc33.us
  br label %for.end35

for.end35.loopexit95.unr-lcssa:                   ; preds = %for.cond1.preheader
  br label %for.end35.loopexit95

for.end35.loopexit95:                             ; preds = %for.cond1.preheader.prol.loopexit, %for.end35.loopexit95.unr-lcssa
  br label %for.end35

for.end35:                                        ; preds = %for.end35.loopexit95, %for.end35.loopexit, %entry
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

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

if.end:                                           ; preds = %if.then, %for.body
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

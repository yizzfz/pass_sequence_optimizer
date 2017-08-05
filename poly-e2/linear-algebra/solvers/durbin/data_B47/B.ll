; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay1 = bitcast i8* %call to double*
  tail call fastcc void @init_array(double* %arraydecay1)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay33 = bitcast i8* %call1 to double*
  tail call fastcc void @kernel_durbin(double* %arraydecay1, double* %arraydecay33)
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
  %1 = bitcast i8* %call1 to double*
  tail call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %r) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next.4, %for.body ]
  %0 = sub nuw nsw i64 2001, %indvars.iv
  %1 = trunc i64 %0 to i32
  %conv = sitofp i32 %1 to double
  %arrayidx = getelementptr inbounds double, double* %r, i64 %indvars.iv
  %2 = bitcast double* %arrayidx to <2 x double>*
  %3 = sub i64 2000, %indvars.iv
  %4 = trunc i64 %3 to i32
  %conv.1 = sitofp i32 %4 to double
  %5 = insertelement <2 x double> undef, double %conv, i32 0
  %6 = insertelement <2 x double> %5, double %conv.1, i32 1
  store <2 x double> %6, <2 x double>* %2, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %7 = sub i64 1999, %indvars.iv
  %8 = trunc i64 %7 to i32
  %conv.2 = sitofp i32 %8 to double
  %arrayidx.2 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.1
  %9 = bitcast double* %arrayidx.2 to <2 x double>*
  %10 = sub i64 1998, %indvars.iv
  %11 = trunc i64 %10 to i32
  %conv.3 = sitofp i32 %11 to double
  %12 = insertelement <2 x double> undef, double %conv.2, i32 0
  %13 = insertelement <2 x double> %12, double %conv.3, i32 1
  store <2 x double> %13, <2 x double>* %9, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %14 = sub i64 1997, %indvars.iv
  %15 = trunc i64 %14 to i32
  %conv.4 = sitofp i32 %15 to double
  %arrayidx.4 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(double* nocapture readonly %r, double* nocapture %y) unnamed_addr #2 {
entry:
  %z = alloca [2000 x double], align 16
  %0 = load double, double* %r, align 8
  %sub = fsub double -0.000000e+00, %0
  store double %sub, double* %y, align 8
  %1 = load double, double* %r, align 8
  %sub3 = fsub double -0.000000e+00, %1
  %2 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 0
  %3 = ptrtoint double* %y to i64
  %4 = bitcast double* %y to i8*
  %5 = bitcast [2000 x double]* %z to i8*
  %6 = bitcast double* %y to i8*
  %7 = bitcast [2000 x double]* %z to i8*
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc47.for.inc.lr.ph_crit_edge, %entry
  %indvar52 = phi i64 [ %indvar.next53, %for.inc47.for.inc.lr.ph_crit_edge ], [ 0, %entry ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc47.for.inc.lr.ph_crit_edge ], [ 1, %entry ]
  %indvar = phi i64 [ %indvar.next51, %for.inc47.for.inc.lr.ph_crit_edge ], [ 0, %entry ]
  %alpha.014 = phi double [ %div, %for.inc47.for.inc.lr.ph_crit_edge ], [ %sub3, %entry ]
  %beta.013 = phi double [ %mul5, %for.inc47.for.inc.lr.ph_crit_edge ], [ 1.000000e+00, %entry ]
  %8 = add i64 %indvar52, -1
  %9 = add i64 %indvar, 1
  %10 = shl i64 %indvar, 3
  %11 = add nuw nsw i64 %10, 8
  %mul = fmul double %alpha.014, %alpha.014
  %sub4 = fsub double 1.000000e+00, %mul
  %mul5 = fmul double %beta.013, %sub4
  %12 = add nsw i64 %indvars.iv34, -1
  %xtraiter = and i64 %9, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %sum.07.prol = phi double [ %add.prol, %for.inc.prol ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.prol ], [ %xtraiter, %for.inc.prol.preheader ]
  %13 = sub nsw i64 %12, %indvars.iv.prol
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %13
  %14 = load double, double* %arrayidx11.prol, align 8
  %arrayidx13.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %15 = load double, double* %arrayidx13.prol, align 8
  %mul14.prol = fmul double %14, %15
  %add.prol = fadd double %sum.07.prol, %mul14.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !1

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next.prol, %for.inc.prol.loopexit.loopexit ]
  %sum.07.unr = phi double [ 0.000000e+00, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %16 = icmp ult i64 %indvar, 3
  br i1 %16, label %for.inc32.lr.ph, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ %indvars.iv.unr, %for.inc.preheader ]
  %sum.07 = phi double [ %add.3, %for.inc ], [ %sum.07.unr, %for.inc.preheader ]
  %arrayidx13 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %17 = bitcast double* %arrayidx13 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = sub nsw i64 %12, %indvars.iv.next
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %18
  %19 = bitcast double* %arrayidx11.1 to <2 x double>*
  %20 = load <2 x double>, <2 x double>* %19, align 8
  %21 = load <2 x double>, <2 x double>* %17, align 8
  %mul14.v.i0 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %mul14 = fmul <2 x double> %mul14.v.i0, %21
  %mul14.v.r1 = extractelement <2 x double> %mul14, i32 0
  %mul14.v.r2 = extractelement <2 x double> %mul14, i32 1
  %add = fadd double %sum.07, %mul14.v.r1
  %add.1 = fadd double %add, %mul14.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx13.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %22 = bitcast double* %arrayidx13.2 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %23 = sub nsw i64 %12, %indvars.iv.next.2
  %arrayidx11.3 = getelementptr inbounds double, double* %r, i64 %23
  %24 = bitcast double* %arrayidx11.3 to <2 x double>*
  %25 = load <2 x double>, <2 x double>* %24, align 8
  %26 = load <2 x double>, <2 x double>* %22, align 8
  %mul14.2.v.i0 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %mul14.2 = fmul <2 x double> %mul14.2.v.i0, %26
  %mul14.2.v.r1 = extractelement <2 x double> %mul14.2, i32 0
  %mul14.2.v.r2 = extractelement <2 x double> %mul14.2, i32 1
  %add.2 = fadd double %add.1, %mul14.2.v.r1
  %add.3 = fadd double %add.2, %mul14.2.v.r2
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv34
  br i1 %exitcond.3, label %for.inc32.lr.ph.loopexit, label %for.inc

for.inc32.lr.ph.loopexit:                         ; preds = %for.inc
  br label %for.inc32.lr.ph

for.inc32.lr.ph:                                  ; preds = %for.inc32.lr.ph.loopexit, %for.inc.prol.loopexit
  %sum.0.lcssa = phi double [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.inc32.lr.ph.loopexit ]
  %arrayidx16 = getelementptr inbounds double, double* %r, i64 %indvars.iv34
  %27 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %sum.0.lcssa, %27
  %sub18 = fsub double -0.000000e+00, %add17
  %div = fdiv double %sub18, %mul5
  %28 = add nsw i64 %indvars.iv34, -1
  %29 = and i64 %indvar, 1
  %lcmp.mod40 = icmp eq i64 %29, 0
  br i1 %lcmp.mod40, label %for.inc32.prol, label %for.inc32.prol.loopexit

for.inc32.prol:                                   ; preds = %for.inc32.lr.ph
  %30 = load double, double* %y, align 8
  %sunkaddr43 = shl i64 %indvars.iv34, 3
  %sunkaddr44 = add i64 %3, %sunkaddr43
  %sunkaddr45 = add i64 %sunkaddr44, -8
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to double*
  %31 = load double, double* %sunkaddr46, align 8
  %mul28.prol = fmul double %div, %31
  %add29.prol = fadd double %30, %mul28.prol
  store double %add29.prol, double* %2, align 16
  br label %for.inc32.prol.loopexit

for.inc32.prol.loopexit:                          ; preds = %for.inc32.lr.ph, %for.inc32.prol
  %indvars.iv19.unr.ph = phi i64 [ 1, %for.inc32.prol ], [ 0, %for.inc32.lr.ph ]
  %32 = icmp eq i64 %indvar, 0
  br i1 %32, label %for.inc47.thread, label %for.inc32.preheader

for.inc32.preheader:                              ; preds = %for.inc32.prol.loopexit
  %33 = sub i64 %8, %indvars.iv19.unr.ph
  %34 = lshr i64 %33, 1
  %35 = add nuw i64 %34, 1
  %min.iters.check = icmp ult i64 %35, 2
  br i1 %min.iters.check, label %for.inc32.preheader1, label %min.iters.checked

for.inc32.preheader1:                             ; preds = %middle.block, %min.iters.checked, %for.inc32.preheader
  %indvars.iv19.ph = phi i64 [ %indvars.iv19.unr.ph, %min.iters.checked ], [ %indvars.iv19.unr.ph, %for.inc32.preheader ], [ %ind.end, %middle.block ]
  %36 = insertelement <2 x double> undef, double %div, i32 0
  %mul28.v.i0.2 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc32

min.iters.checked:                                ; preds = %for.inc32.preheader
  %n.mod.vf = and i64 %35, 1
  %n.vec = sub i64 %35, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %37 = or i64 %indvars.iv19.unr.ph, 2
  %38 = shl nuw i64 %34, 1
  %39 = add i64 %37, %38
  %40 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %39, %40
  br i1 %cmp.zero, label %for.inc32.preheader1, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert59 = insertelement <2 x double> undef, double %div, i32 0
  %broadcast.splat60 = shufflevector <2 x double> %broadcast.splatinsert59, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %41 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv19.unr.ph, %41
  %42 = getelementptr inbounds double, double* %y, i64 %offset.idx
  %43 = bitcast double* %42 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %43, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec54 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %44 = sub nsw i64 %28, %offset.idx
  %45 = getelementptr inbounds double, double* %y, i64 %44
  %46 = getelementptr double, double* %45, i64 -3
  %47 = bitcast double* %46 to <4 x double>*
  %wide.vec55 = load <4 x double>, <4 x double>* %47, align 8
  %strided.vec56 = shufflevector <4 x double> %wide.vec55, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x double> %strided.vec56, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %strided.vec57 = shufflevector <4 x double> %wide.vec55, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %reverse58 = shufflevector <2 x double> %strided.vec57, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %48 = fmul <2 x double> %broadcast.splat60, %reverse58
  %49 = fadd <2 x double> %strided.vec, %48
  %50 = add nuw nsw i64 %offset.idx, 1
  %51 = fmul <2 x double> %broadcast.splat60, %reverse
  %52 = fadd <2 x double> %strided.vec54, %51
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %50
  %54 = getelementptr double, double* %53, i64 -1
  %55 = bitcast double* %54 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %49, <2 x double> %52, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %55, align 8
  %index.next = add i64 %index, 2
  %56 = icmp eq i64 %index.next, %n.vec
  br i1 %56, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc47, label %for.inc32.preheader1

for.inc47.thread:                                 ; preds = %for.inc32.prol.loopexit
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* nonnull %5, i64 %11, i32 8, i1 false)
  %arrayidx4648 = getelementptr inbounds double, double* %y, i64 %indvars.iv34
  store double %div, double* %arrayidx4648, align 8
  br label %for.inc47.for.inc.lr.ph_crit_edge

for.inc32:                                        ; preds = %for.inc32.preheader1, %for.inc32
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.1, %for.inc32 ], [ %indvars.iv19.ph, %for.inc32.preheader1 ]
  %arrayidx23 = getelementptr inbounds double, double* %y, i64 %indvars.iv19
  %57 = bitcast double* %arrayidx23 to <2 x double>*
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv19
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %58 = load <2 x double>, <2 x double>* %57, align 8
  %59 = sub nsw i64 %28, %indvars.iv.next20
  %arrayidx27.1 = getelementptr inbounds double, double* %y, i64 %59
  %60 = bitcast double* %arrayidx27.1 to <2 x double>*
  %61 = load <2 x double>, <2 x double>* %60, align 8
  %mul28.1 = fmul <2 x double> %mul28.v.i0.2, %61
  %add29.v.i1 = shufflevector <2 x double> %mul28.1, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %add29 = fadd <2 x double> %58, %add29.v.i1
  %62 = bitcast double* %arrayidx31 to <2 x double>*
  store <2 x double> %add29, <2 x double>* %62, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  %exitcond25.1 = icmp eq i64 %indvars.iv.next20.1, %indvars.iv34
  br i1 %exitcond25.1, label %for.inc47.loopexit, label %for.inc32, !llvm.loop !6

for.inc47.loopexit:                               ; preds = %for.inc32
  br label %for.inc47

for.inc47:                                        ; preds = %for.inc47.loopexit, %middle.block
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* nonnull %7, i64 %11, i32 8, i1 false)
  %arrayidx46 = getelementptr inbounds double, double* %y, i64 %indvars.iv34
  store double %div, double* %arrayidx46, align 8
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond38 = icmp eq i64 %indvar.next, 1999
  br i1 %exitcond38, label %for.end49, label %for.inc47.for.inc.lr.ph_crit_edge

for.inc47.for.inc.lr.ph_crit_edge:                ; preds = %for.inc47.thread, %for.inc47
  %indvar.next51 = phi i64 [ 1, %for.inc47.thread ], [ %indvar.next, %for.inc47 ]
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %indvar.next53 = add i64 %indvar52, 1
  br label %for.inc.lr.ph

for.end49:                                        ; preds = %for.inc47
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}

; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
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
  tail call fastcc void @init_array(i32 2000, double* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay3 = bitcast i8* %call1 to double*
  tail call fastcc void @kernel_durbin(i32 2000, double* %arraydecay, double* %arraydecay3)
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %r) unnamed_addr #2 {
entry:
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %add = add nsw i32 %n, 1
  %0 = add i32 %n, -1
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body.prol.loopexit, label %for.body.prol.preheader

for.body.prol.preheader:                          ; preds = %for.body.lr.ph
  br label %for.body.prol

for.body.prol:                                    ; preds = %for.body.prol.preheader, %for.body.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body.prol ], [ 0, %for.body.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body.prol ], [ %xtraiter, %for.body.prol.preheader ]
  %1 = trunc i64 %indvars.iv.prol to i32
  %sub.prol = sub i32 %add, %1
  %conv.prol = sitofp i32 %sub.prol to double
  %arrayidx.prol = getelementptr inbounds double, double* %r, i64 %indvars.iv.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body.prol.loopexit.loopexit, label %for.body.prol, !llvm.loop !1

for.body.prol.loopexit.loopexit:                  ; preds = %for.body.prol
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.prol.loopexit.loopexit, %for.body.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next.prol, %for.body.prol.loopexit.loopexit ]
  %2 = icmp ult i32 %0, 3
  br i1 %2, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.prol.loopexit
  %wide.trip.count.3 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body ], [ %indvars.iv.unr, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %sub = sub i32 %add, %3
  %conv = sitofp i32 %sub to double
  %arrayidx = getelementptr inbounds double, double* %r, i64 %indvars.iv
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = trunc i64 %indvars.iv.next to i32
  %sub.1 = sub i32 %add, %4
  %conv.1 = sitofp i32 %sub.1 to double
  %arrayidx.1 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %5 = trunc i64 %indvars.iv.next.1 to i32
  %sub.2 = sub i32 %add, %5
  %conv.2 = sitofp i32 %sub.2 to double
  %arrayidx.2 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %6 = trunc i64 %indvars.iv.next.2 to i32
  %sub.3 = sub i32 %add, %6
  %conv.3 = sitofp i32 %sub.3 to double
  %arrayidx.3 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body.prol.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32 %n, double* nocapture readonly %r, double* nocapture %y) unnamed_addr #2 {
entry:
  %y29 = bitcast double* %y to i8*
  %z = alloca [2000 x double], align 16
  %z30 = bitcast [2000 x double]* %z to i8*
  %0 = load double, double* %r, align 8
  %sub = fsub double -0.000000e+00, %0
  store double %sub, double* %y, align 8
  %cmp8 = icmp sgt i32 %n, 1
  br i1 %cmp8, label %for.body.preheader, label %for.end49

for.body.preheader:                               ; preds = %entry
  %1 = load double, double* %r, align 8
  %sub3 = fsub double -0.000000e+00, %1
  %2 = add i32 %n, -1
  %arrayidx31.prol = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 0
  %wide.trip.count37 = zext i32 %2 to i64
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.body.preheader, %for.end44
  %indvars.iv33 = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next34, %for.end44 ]
  %indvar31 = phi i64 [ 0, %for.body.preheader ], [ %indvar.next32, %for.end44 ]
  %indvar = phi i32 [ 0, %for.body.preheader ], [ %indvar.next, %for.end44 ]
  %alpha.010 = phi double [ %sub3, %for.body.preheader ], [ %div, %for.end44 ]
  %beta.09 = phi double [ 1.000000e+00, %for.body.preheader ], [ %mul5, %for.end44 ]
  %3 = add i64 %indvar31, -1
  %4 = shl i64 %indvar31, 3
  %5 = add nuw nsw i64 %4, 8
  %mul = fmul double %alpha.010, %alpha.010
  %sub4 = fsub double 1.000000e+00, %mul
  %mul5 = fmul double %beta.09, %sub4
  %6 = add nuw nsw i32 %indvar, 1
  %7 = add nsw i64 %indvars.iv33, -1
  %xtraiter = and i32 %6, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %sum.02.prol = phi double [ %add.prol, %for.inc.prol ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.prol ], [ %xtraiter, %for.inc.prol.preheader ]
  %8 = sub nsw i64 %7, %indvars.iv.prol
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %8
  %9 = load double, double* %arrayidx11.prol, align 8
  %arrayidx13.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %10 = load double, double* %arrayidx13.prol, align 8
  %mul14.prol = fmul double %9, %10
  %add.prol = fadd double %sum.02.prol, %mul14.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !3

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next.prol, %for.inc.prol.loopexit.loopexit ]
  %sum.02.unr = phi double [ 0.000000e+00, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %11 = icmp ult i32 %indvar, 3
  br i1 %11, label %for.body21.lr.ph, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ %indvars.iv.unr, %for.inc.preheader ]
  %sum.02 = phi double [ %add.3, %for.inc ], [ %sum.02.unr, %for.inc.preheader ]
  %12 = sub nsw i64 %7, %indvars.iv
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %12
  %13 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %14 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %13, %14
  %add = fadd double %sum.02, %mul14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = sub nsw i64 %7, %indvars.iv.next
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %15
  %16 = load double, double* %arrayidx11.1, align 8
  %arrayidx13.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next
  %17 = load double, double* %arrayidx13.1, align 8
  %mul14.1 = fmul double %16, %17
  %add.1 = fadd double %add, %mul14.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %18 = sub nsw i64 %7, %indvars.iv.next.1
  %arrayidx11.2 = getelementptr inbounds double, double* %r, i64 %18
  %19 = load double, double* %arrayidx11.2, align 8
  %arrayidx13.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %20 = load double, double* %arrayidx13.2, align 8
  %mul14.2 = fmul double %19, %20
  %add.2 = fadd double %add.1, %mul14.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %21 = sub nsw i64 %7, %indvars.iv.next.2
  %arrayidx11.3 = getelementptr inbounds double, double* %r, i64 %21
  %22 = load double, double* %arrayidx11.3, align 8
  %arrayidx13.3 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.2
  %23 = load double, double* %arrayidx13.3, align 8
  %mul14.3 = fmul double %22, %23
  %add.3 = fadd double %add.2, %mul14.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv33
  br i1 %exitcond.3, label %for.body21.lr.ph.loopexit, label %for.inc

for.body21.lr.ph.loopexit:                        ; preds = %for.inc
  br label %for.body21.lr.ph

for.body21.lr.ph:                                 ; preds = %for.body21.lr.ph.loopexit, %for.inc.prol.loopexit
  %add.lcssa = phi double [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.body21.lr.ph.loopexit ]
  %arrayidx16 = getelementptr inbounds double, double* %r, i64 %indvars.iv33
  %24 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %add.lcssa, %24
  %sub18 = fsub double -0.000000e+00, %add17
  %div = fdiv double %sub18, %mul5
  %25 = add nsw i64 %indvars.iv33, -1
  %26 = and i32 %indvar, 1
  %lcmp.mod22 = icmp eq i32 %26, 0
  br i1 %lcmp.mod22, label %for.body21.prol, label %for.body21.prol.loopexit

for.body21.prol:                                  ; preds = %for.body21.lr.ph
  %27 = load double, double* %y, align 8
  %arrayidx27.prol = getelementptr inbounds double, double* %y, i64 %25
  %28 = load double, double* %arrayidx27.prol, align 8
  %mul28.prol = fmul double %div, %28
  %add29.prol = fadd double %27, %mul28.prol
  store double %add29.prol, double* %arrayidx31.prol, align 16
  br label %for.body21.prol.loopexit

for.body21.prol.loopexit:                         ; preds = %for.body21.prol, %for.body21.lr.ph
  %indvars.iv15.unr.ph = phi i64 [ 1, %for.body21.prol ], [ 0, %for.body21.lr.ph ]
  %29 = icmp eq i32 %indvar, 0
  br i1 %29, label %for.end44, label %for.body21.preheader

for.body21.preheader:                             ; preds = %for.body21.prol.loopexit
  %30 = sub i64 %3, %indvars.iv15.unr.ph
  %31 = lshr i64 %30, 1
  %32 = add nuw i64 %31, 1
  %min.iters.check = icmp ult i64 %32, 2
  br i1 %min.iters.check, label %for.body21.preheader45, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body21.preheader
  %n.mod.vf = and i64 %32, 1
  %n.vec = sub i64 %32, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %33 = or i64 %indvars.iv15.unr.ph, 2
  %34 = shl nuw i64 %31, 1
  %35 = add i64 %33, %34
  %36 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %35, %36
  br i1 %cmp.zero, label %for.body21.preheader45, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert43 = insertelement <2 x double> undef, double %div, i32 0
  %broadcast.splat44 = shufflevector <2 x double> %broadcast.splatinsert43, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %37 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv15.unr.ph, %37
  %38 = getelementptr inbounds double, double* %y, i64 %offset.idx
  %39 = bitcast double* %38 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %39, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec38 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %40 = sub nsw i64 %25, %offset.idx
  %41 = getelementptr inbounds double, double* %y, i64 %40
  %42 = getelementptr double, double* %41, i64 -3
  %43 = bitcast double* %42 to <4 x double>*
  %wide.vec39 = load <4 x double>, <4 x double>* %43, align 8
  %strided.vec40 = shufflevector <4 x double> %wide.vec39, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x double> %strided.vec40, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %strided.vec41 = shufflevector <4 x double> %wide.vec39, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %reverse42 = shufflevector <2 x double> %strided.vec41, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %44 = fmul <2 x double> %broadcast.splat44, %reverse42
  %45 = fadd <2 x double> %strided.vec, %44
  %46 = add nuw nsw i64 %offset.idx, 1
  %47 = fmul <2 x double> %broadcast.splat44, %reverse
  %48 = fadd <2 x double> %strided.vec38, %47
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %46
  %50 = getelementptr double, double* %49, i64 -1
  %51 = bitcast double* %50 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %45, <2 x double> %48, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %51, align 8
  %index.next = add i64 %index, 2
  %52 = icmp eq i64 %index.next, %n.vec
  br i1 %52, label %middle.block, label %vector.body, !llvm.loop !4

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.end44, label %for.body21.preheader45

for.body21.preheader45:                           ; preds = %middle.block, %min.iters.checked, %for.body21.preheader
  %indvars.iv15.ph = phi i64 [ %indvars.iv15.unr.ph, %min.iters.checked ], [ %indvars.iv15.unr.ph, %for.body21.preheader ], [ %ind.end, %middle.block ]
  br label %for.body21

for.body21:                                       ; preds = %for.body21.preheader45, %for.body21
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %for.body21 ], [ %indvars.iv15.ph, %for.body21.preheader45 ]
  %arrayidx23 = getelementptr inbounds double, double* %y, i64 %indvars.iv15
  %53 = load double, double* %arrayidx23, align 8
  %54 = sub nsw i64 %25, %indvars.iv15
  %arrayidx27 = getelementptr inbounds double, double* %y, i64 %54
  %55 = load double, double* %arrayidx27, align 8
  %mul28 = fmul double %div, %55
  %add29 = fadd double %53, %mul28
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv15
  store double %add29, double* %arrayidx31, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %arrayidx23.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next16
  %56 = load double, double* %arrayidx23.1, align 8
  %57 = sub nsw i64 %25, %indvars.iv.next16
  %arrayidx27.1 = getelementptr inbounds double, double* %y, i64 %57
  %58 = load double, double* %arrayidx27.1, align 8
  %mul28.1 = fmul double %div, %58
  %add29.1 = fadd double %56, %mul28.1
  %arrayidx31.1 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv.next16
  store double %add29.1, double* %arrayidx31.1, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next16.1, %indvars.iv33
  br i1 %exitcond.1, label %for.end44.loopexit, label %for.body21, !llvm.loop !7

for.end44.loopexit:                               ; preds = %for.body21
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %middle.block, %for.body21.prol.loopexit
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %y29, i8* nonnull %z30, i64 %5, i32 8, i1 false)
  %arrayidx46 = getelementptr inbounds double, double* %y, i64 %indvars.iv33
  store double %div, double* %arrayidx46, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvar.next32 = add nuw nsw i64 %indvar31, 1
  %exitcond = icmp eq i64 %indvar.next32, %wide.trip.count37
  br i1 %exitcond, label %for.end49.loopexit, label %for.inc.lr.ph

for.end49.loopexit:                               ; preds = %for.end44
  br label %for.end49

for.end49:                                        ; preds = %for.end49.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}

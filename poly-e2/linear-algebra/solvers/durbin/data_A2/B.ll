; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  tail call void @init_array(i32 2000, double* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay2 = bitcast i8* %call to double*
  %arraydecay3 = bitcast i8* %call1 to double*
  tail call void @kernel_durbin(i32 2000, double* %arraydecay2, double* %arraydecay3)
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
  tail call void @print_array(i32 2000, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %n, double* %r) #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %entry
  %add = add nsw i32 %n, 1
  %0 = add i32 %n, -1
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.prol ], [ %xtraiter, %for.inc.prol.preheader ]
  %1 = trunc i64 %indvars.iv.prol to i32
  %sub.prol = sub i32 %add, %1
  %conv.prol = sitofp i32 %sub.prol to double
  %arrayidx.prol = getelementptr inbounds double, double* %r, i64 %indvars.iv.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !1

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next.prol, %for.inc.prol.loopexit.loopexit ]
  %2 = icmp ult i32 %0, 3
  br i1 %2, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  %wide.trip.count.3 = zext i32 %n to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ %indvars.iv.unr, %for.inc.preheader ]
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
  br i1 %exitcond.3, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_durbin(i32 %n, double* %r, double* %y) #2 {
entry:
  %z = alloca [2000 x double], align 16
  %0 = load double, double* %r, align 8
  %sub = fsub double -0.000000e+00, %0
  store double %sub, double* %y, align 8
  %cmp32 = icmp sgt i32 %n, 1
  br i1 %cmp32, label %for.body.preheader, label %for.end49

for.body.preheader:                               ; preds = %entry
  %1 = load double, double* %r, align 8
  %sub3 = fsub double -0.000000e+00, %1
  %2 = add i32 %n, -1
  %wide.trip.count61 = zext i32 %2 to i64
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.body.preheader, %for.inc47
  %indvars.iv57 = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next58, %for.inc47 ]
  %indvar55 = phi i64 [ 0, %for.body.preheader ], [ %indvar.next56, %for.inc47 ]
  %indvar = phi i32 [ 0, %for.body.preheader ], [ %indvar.next, %for.inc47 ]
  %3 = phi double [ %sub3, %for.body.preheader ], [ %div, %for.inc47 ]
  %beta.033 = phi double [ 1.000000e+00, %for.body.preheader ], [ %mul5, %for.inc47 ]
  %4 = add i64 %indvar55, -1
  %5 = shl i64 %indvar55, 3
  %6 = add nuw nsw i64 %5, 8
  %mul = fmul double %3, %3
  %sub4 = fsub double 1.000000e+00, %mul
  %mul5 = fmul double %beta.033, %sub4
  %7 = add nuw nsw i32 %indvar, 1
  %8 = add nsw i64 %indvars.iv57, -1
  %xtraiter = and i32 %7, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %sum.026.prol = phi double [ %add.prol, %for.inc.prol ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.prol ], [ %xtraiter, %for.inc.prol.preheader ]
  %9 = sub nsw i64 %8, %indvars.iv.prol
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %9
  %10 = load double, double* %arrayidx11.prol, align 8
  %arrayidx13.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %11 = load double, double* %arrayidx13.prol, align 8
  %mul14.prol = fmul double %10, %11
  %add.prol = fadd double %sum.026.prol, %mul14.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !3

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next.prol, %for.inc.prol.loopexit.loopexit ]
  %sum.026.unr = phi double [ 0.000000e+00, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %12 = icmp ult i32 %indvar, 3
  br i1 %12, label %for.inc32.lr.ph, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ %indvars.iv.unr, %for.inc.preheader ]
  %sum.026 = phi double [ %add.3, %for.inc ], [ %sum.026.unr, %for.inc.preheader ]
  %13 = sub nsw i64 %8, %indvars.iv
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %13
  %14 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %15 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %14, %15
  %add = fadd double %sum.026, %mul14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = sub nsw i64 %8, %indvars.iv.next
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %16
  %17 = load double, double* %arrayidx11.1, align 8
  %arrayidx13.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx13.1, align 8
  %mul14.1 = fmul double %17, %18
  %add.1 = fadd double %add, %mul14.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %19 = sub nsw i64 %8, %indvars.iv.next.1
  %arrayidx11.2 = getelementptr inbounds double, double* %r, i64 %19
  %20 = load double, double* %arrayidx11.2, align 8
  %arrayidx13.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %21 = load double, double* %arrayidx13.2, align 8
  %mul14.2 = fmul double %20, %21
  %add.2 = fadd double %add.1, %mul14.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %22 = sub nsw i64 %8, %indvars.iv.next.2
  %arrayidx11.3 = getelementptr inbounds double, double* %r, i64 %22
  %23 = load double, double* %arrayidx11.3, align 8
  %arrayidx13.3 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.2
  %24 = load double, double* %arrayidx13.3, align 8
  %mul14.3 = fmul double %23, %24
  %add.3 = fadd double %add.2, %mul14.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv57
  br i1 %exitcond.3, label %for.inc32.lr.ph.loopexit, label %for.inc

for.inc32.lr.ph.loopexit:                         ; preds = %for.inc
  br label %for.inc32.lr.ph

for.inc32.lr.ph:                                  ; preds = %for.inc32.lr.ph.loopexit, %for.inc.prol.loopexit
  %add.lcssa = phi double [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.inc32.lr.ph.loopexit ]
  %arrayidx16 = getelementptr inbounds double, double* %r, i64 %indvars.iv57
  %25 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %add.lcssa, %25
  %sub18 = fsub double -0.000000e+00, %add17
  %div = fdiv double %sub18, %mul5
  %26 = add nsw i64 %indvars.iv57, -1
  %27 = and i32 %indvar, 1
  %lcmp.mod46 = icmp eq i32 %27, 0
  br i1 %lcmp.mod46, label %for.inc32.prol, label %for.inc32.prol.loopexit

for.inc32.prol:                                   ; preds = %for.inc32.lr.ph
  %28 = bitcast [2000 x double]* %z to double*
  %29 = load double, double* %y, align 8
  %sunkaddr = ptrtoint double* %y to i64
  %sunkaddr71 = mul i64 %indvars.iv57, 8
  %sunkaddr72 = add i64 %sunkaddr, %sunkaddr71
  %sunkaddr73 = add i64 %sunkaddr72, -8
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to double*
  %30 = load double, double* %sunkaddr74, align 8
  %mul28.prol = fmul double %div, %30
  %add29.prol = fadd double %29, %mul28.prol
  store double %add29.prol, double* %28, align 16
  br label %for.inc32.prol.loopexit

for.inc32.prol.loopexit:                          ; preds = %for.inc32.prol, %for.inc32.lr.ph
  %indvars.iv39.unr.ph = phi i64 [ 1, %for.inc32.prol ], [ 0, %for.inc32.lr.ph ]
  %31 = icmp eq i32 %indvar, 0
  br i1 %31, label %for.inc47, label %for.inc32.preheader

for.inc32.preheader:                              ; preds = %for.inc32.prol.loopexit
  %32 = sub i64 %4, %indvars.iv39.unr.ph
  %33 = lshr i64 %32, 1
  %34 = add nuw i64 %33, 1
  %min.iters.check = icmp ult i64 %34, 2
  br i1 %min.iters.check, label %for.inc32.preheader69, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc32.preheader
  %n.mod.vf = and i64 %34, 1
  %n.vec = sub i64 %34, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %35 = or i64 %indvars.iv39.unr.ph, 2
  %36 = shl nuw i64 %33, 1
  %37 = add i64 %35, %36
  %38 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %37, %38
  br i1 %cmp.zero, label %for.inc32.preheader69, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert67 = insertelement <2 x double> undef, double %div, i32 0
  %broadcast.splat68 = shufflevector <2 x double> %broadcast.splatinsert67, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %39 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv39.unr.ph, %39
  %40 = getelementptr inbounds double, double* %y, i64 %offset.idx
  %41 = bitcast double* %40 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %41, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec62 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %42 = sub nsw i64 %26, %offset.idx
  %43 = getelementptr inbounds double, double* %y, i64 %42
  %44 = getelementptr double, double* %43, i64 -3
  %45 = bitcast double* %44 to <4 x double>*
  %wide.vec63 = load <4 x double>, <4 x double>* %45, align 8
  %strided.vec64 = shufflevector <4 x double> %wide.vec63, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x double> %strided.vec64, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %strided.vec65 = shufflevector <4 x double> %wide.vec63, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %reverse66 = shufflevector <2 x double> %strided.vec65, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %46 = fmul <2 x double> %broadcast.splat68, %reverse66
  %47 = fadd <2 x double> %strided.vec, %46
  %48 = add nuw nsw i64 %offset.idx, 1
  %49 = fmul <2 x double> %broadcast.splat68, %reverse
  %50 = fadd <2 x double> %strided.vec62, %49
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %48
  %52 = getelementptr double, double* %51, i64 -1
  %53 = bitcast double* %52 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %47, <2 x double> %50, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %53, align 8
  %index.next = add i64 %index, 2
  %54 = icmp eq i64 %index.next, %n.vec
  br i1 %54, label %middle.block, label %vector.body, !llvm.loop !4

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc47, label %for.inc32.preheader69

for.inc32.preheader69:                            ; preds = %middle.block, %min.iters.checked, %for.inc32.preheader
  %indvars.iv39.ph = phi i64 [ %indvars.iv39.unr.ph, %min.iters.checked ], [ %indvars.iv39.unr.ph, %for.inc32.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.preheader69, %for.inc32
  %indvars.iv39 = phi i64 [ %indvars.iv.next40.1, %for.inc32 ], [ %indvars.iv39.ph, %for.inc32.preheader69 ]
  %arrayidx23 = getelementptr inbounds double, double* %y, i64 %indvars.iv39
  %55 = load double, double* %arrayidx23, align 8
  %56 = sub nsw i64 %26, %indvars.iv39
  %arrayidx27 = getelementptr inbounds double, double* %y, i64 %56
  %57 = load double, double* %arrayidx27, align 8
  %mul28 = fmul double %div, %57
  %add29 = fadd double %55, %mul28
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv39
  store double %add29, double* %arrayidx31, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %arrayidx23.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next40
  %58 = load double, double* %arrayidx23.1, align 8
  %59 = sub nsw i64 %26, %indvars.iv.next40
  %arrayidx27.1 = getelementptr inbounds double, double* %y, i64 %59
  %60 = load double, double* %arrayidx27.1, align 8
  %mul28.1 = fmul double %div, %60
  %add29.1 = fadd double %58, %mul28.1
  %arrayidx31.1 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv.next40
  store double %add29.1, double* %arrayidx31.1, align 8
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next40.1, %indvars.iv57
  br i1 %exitcond.1, label %for.inc47.loopexit, label %for.inc32, !llvm.loop !7

for.inc47.loopexit:                               ; preds = %for.inc32
  br label %for.inc47

for.inc47:                                        ; preds = %for.inc47.loopexit, %middle.block, %for.inc32.prol.loopexit
  %61 = bitcast [2000 x double]* %z to i8*
  %62 = bitcast double* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %62, i8* nonnull %61, i64 %6, i32 8, i1 false)
  %arrayidx46 = getelementptr inbounds double, double* %y, i64 %indvars.iv57
  store double %div, double* %arrayidx46, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvar.next56 = add nuw nsw i64 %indvar55, 1
  %exitcond = icmp eq i64 %indvar.next56, %wide.trip.count61
  br i1 %exitcond, label %for.end49.loopexit, label %for.inc.lr.ph

for.end49.loopexit:                               ; preds = %for.inc47
  br label %for.end49

for.end49:                                        ; preds = %for.end49.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, double* %y) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #7 = { cold nounwind }

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

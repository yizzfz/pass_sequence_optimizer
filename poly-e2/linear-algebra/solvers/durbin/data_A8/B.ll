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
  %1 = bitcast i8* %call1 to double*
  tail call fastcc void @print_array(i32 2000, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %r) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next.4, %for.body ]
  %0 = sub nuw nsw i64 2001, %indvars.iv
  %1 = trunc i64 %0 to i32
  %conv = sitofp i32 %1 to double
  %arrayidx = getelementptr inbounds double, double* %r, i64 %indvars.iv
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = sub i64 2000, %indvars.iv
  %3 = trunc i64 %2 to i32
  %conv.1 = sitofp i32 %3 to double
  %arrayidx.1 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %4 = sub i64 1999, %indvars.iv
  %5 = trunc i64 %4 to i32
  %conv.2 = sitofp i32 %5 to double
  %arrayidx.2 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %6 = sub i64 1998, %indvars.iv
  %7 = trunc i64 %6 to i32
  %conv.3 = sitofp i32 %7 to double
  %arrayidx.3 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %8 = sub i64 1997, %indvars.iv
  %9 = trunc i64 %8 to i32
  %conv.4 = sitofp i32 %9 to double
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
define internal fastcc void @kernel_durbin(i32 %n, double* nocapture readonly %r, double* %y) unnamed_addr #2 {
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
  br label %for.body8.lr.ph

for.body8.lr.ph:                                  ; preds = %entry, %for.end44
  %indvars.iv23 = phi i64 [ 1, %entry ], [ %indvars.iv.next24, %for.end44 ]
  %indvar = phi i64 [ 0, %entry ], [ %11, %for.end44 ]
  %6 = phi double [ %sub3, %entry ], [ %div, %for.end44 ]
  %7 = phi double [ 1.000000e+00, %entry ], [ %mul5, %for.end44 ]
  %8 = add i64 %indvar, -1
  %9 = shl i64 %indvar, 3
  %10 = add nuw nsw i64 %9, 8
  %mul = fmul double %6, %6
  %sub4 = fsub double 1.000000e+00, %mul
  %mul5 = fmul double %7, %sub4
  %11 = add i64 %indvar, 1
  %12 = add nsw i64 %indvars.iv23, -1
  %xtraiter = and i64 %11, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body8.prol.loopexit, label %for.body8.prol.preheader

for.body8.prol.preheader:                         ; preds = %for.body8.lr.ph
  br label %for.body8.prol

for.body8.prol:                                   ; preds = %for.body8.prol.preheader, %for.body8.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body8.prol ], [ 0, %for.body8.prol.preheader ]
  %13 = phi double [ %add.prol, %for.body8.prol ], [ 0.000000e+00, %for.body8.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body8.prol ], [ %xtraiter, %for.body8.prol.preheader ]
  %14 = sub nsw i64 %12, %indvars.iv.prol
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %14
  %15 = load double, double* %arrayidx11.prol, align 8
  %arrayidx13.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %16 = load double, double* %arrayidx13.prol, align 8
  %mul14.prol = fmul double %15, %16
  %add.prol = fadd double %13, %mul14.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body8.prol.loopexit.loopexit, label %for.body8.prol, !llvm.loop !1

for.body8.prol.loopexit.loopexit:                 ; preds = %for.body8.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.prol.loopexit.loopexit, %for.body8.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body8.lr.ph ], [ %indvars.iv.next.prol, %for.body8.prol.loopexit.loopexit ]
  %.unr = phi double [ 0.000000e+00, %for.body8.lr.ph ], [ %add.prol, %for.body8.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.body8.lr.ph ], [ %add.prol, %for.body8.prol.loopexit.loopexit ]
  %17 = icmp ult i64 %indvar, 3
  br i1 %17, label %for.body21.lr.ph, label %for.body8.preheader

for.body8.preheader:                              ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader, %for.body8
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body8 ], [ %indvars.iv.unr, %for.body8.preheader ]
  %18 = phi double [ %add.3, %for.body8 ], [ %.unr, %for.body8.preheader ]
  %19 = sub nsw i64 %12, %indvars.iv
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %19
  %20 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %21 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %20, %21
  %add = fadd double %18, %mul14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %22 = sub nsw i64 %12, %indvars.iv.next
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %22
  %23 = load double, double* %arrayidx11.1, align 8
  %arrayidx13.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next
  %24 = load double, double* %arrayidx13.1, align 8
  %mul14.1 = fmul double %23, %24
  %add.1 = fadd double %add, %mul14.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %25 = sub nsw i64 %12, %indvars.iv.next.1
  %arrayidx11.2 = getelementptr inbounds double, double* %r, i64 %25
  %26 = load double, double* %arrayidx11.2, align 8
  %arrayidx13.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %27 = load double, double* %arrayidx13.2, align 8
  %mul14.2 = fmul double %26, %27
  %add.2 = fadd double %add.1, %mul14.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %28 = sub nsw i64 %12, %indvars.iv.next.2
  %arrayidx11.3 = getelementptr inbounds double, double* %r, i64 %28
  %29 = load double, double* %arrayidx11.3, align 8
  %arrayidx13.3 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.2
  %30 = load double, double* %arrayidx13.3, align 8
  %mul14.3 = fmul double %29, %30
  %add.3 = fadd double %add.2, %mul14.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv23
  br i1 %exitcond.3, label %for.body21.lr.ph.loopexit, label %for.body8

for.body21.lr.ph.loopexit:                        ; preds = %for.body8
  br label %for.body21.lr.ph

for.body21.lr.ph:                                 ; preds = %for.body21.lr.ph.loopexit, %for.body8.prol.loopexit
  %.lcssa = phi double [ %add.lcssa.unr, %for.body8.prol.loopexit ], [ %add.3, %for.body21.lr.ph.loopexit ]
  %arrayidx16 = getelementptr inbounds double, double* %r, i64 %indvars.iv23
  %31 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %.lcssa, %31
  %sub18 = fsub double -0.000000e+00, %add17
  %div = fdiv double %sub18, %mul5
  %32 = and i64 %indvar, 1
  %lcmp.mod29 = icmp eq i64 %32, 0
  br i1 %lcmp.mod29, label %for.body21.prol, label %for.body21.prol.loopexit

for.body21.prol:                                  ; preds = %for.body21.lr.ph
  %33 = load double, double* %y, align 8
  %sunkaddr30 = shl i64 %indvars.iv23, 3
  %sunkaddr31 = add i64 %3, %sunkaddr30
  %sunkaddr32 = add i64 %sunkaddr31, -8
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to double*
  %34 = load double, double* %sunkaddr33, align 8
  %mul28.prol = fmul double %div, %34
  %add29.prol = fadd double %33, %mul28.prol
  store double %add29.prol, double* %2, align 16
  br label %for.body21.prol.loopexit

for.body21.prol.loopexit:                         ; preds = %for.body21.prol, %for.body21.lr.ph
  %indvars.iv8.unr.ph = phi i64 [ 1, %for.body21.prol ], [ 0, %for.body21.lr.ph ]
  %35 = icmp eq i64 %indvar, 0
  br i1 %35, label %for.end44, label %for.body21.preheader

for.body21.preheader:                             ; preds = %for.body21.prol.loopexit
  %36 = sub i64 %8, %indvars.iv8.unr.ph
  %37 = lshr i64 %36, 1
  %38 = add nuw i64 %37, 1
  %min.iters.check = icmp ult i64 %38, 2
  br i1 %min.iters.check, label %for.body21.preheader43, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body21.preheader
  %n.mod.vf = and i64 %38, 1
  %n.vec = sub i64 %38, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %39 = or i64 %indvars.iv8.unr.ph, 2
  %40 = shl nuw i64 %37, 1
  %41 = add i64 %39, %40
  %42 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %41, %42
  br i1 %cmp.zero, label %for.body21.preheader43, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert40 = insertelement <2 x double> undef, double %div, i32 0
  %broadcast.splat41 = shufflevector <2 x double> %broadcast.splatinsert40, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %43 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv8.unr.ph, %43
  %44 = getelementptr inbounds double, double* %y, i64 %offset.idx
  %45 = bitcast double* %44 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %45, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec35 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %46 = sub nsw i64 %12, %offset.idx
  %47 = getelementptr inbounds double, double* %y, i64 %46
  %48 = getelementptr double, double* %47, i64 -3
  %49 = bitcast double* %48 to <4 x double>*
  %wide.vec36 = load <4 x double>, <4 x double>* %49, align 8
  %strided.vec37 = shufflevector <4 x double> %wide.vec36, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x double> %strided.vec37, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %strided.vec38 = shufflevector <4 x double> %wide.vec36, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %reverse39 = shufflevector <2 x double> %strided.vec38, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %50 = fmul <2 x double> %broadcast.splat41, %reverse39
  %51 = fadd <2 x double> %strided.vec, %50
  %52 = add nuw nsw i64 %offset.idx, 1
  %53 = fmul <2 x double> %broadcast.splat41, %reverse
  %54 = fadd <2 x double> %strided.vec35, %53
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %52
  %56 = getelementptr double, double* %55, i64 -1
  %57 = bitcast double* %56 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %51, <2 x double> %54, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %57, align 8
  %index.next = add i64 %index, 2
  %58 = icmp eq i64 %index.next, %n.vec
  br i1 %58, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.end44, label %for.body21.preheader43

for.body21.preheader43:                           ; preds = %middle.block, %min.iters.checked, %for.body21.preheader
  %indvars.iv8.ph = phi i64 [ %indvars.iv8.unr.ph, %min.iters.checked ], [ %indvars.iv8.unr.ph, %for.body21.preheader ], [ %ind.end, %middle.block ]
  br label %for.body21

for.body21:                                       ; preds = %for.body21.preheader43, %for.body21
  %indvars.iv8 = phi i64 [ %indvars.iv.next9.1, %for.body21 ], [ %indvars.iv8.ph, %for.body21.preheader43 ]
  %arrayidx23 = getelementptr inbounds double, double* %y, i64 %indvars.iv8
  %59 = load double, double* %arrayidx23, align 8
  %60 = sub nsw i64 %12, %indvars.iv8
  %arrayidx27 = getelementptr inbounds double, double* %y, i64 %60
  %61 = load double, double* %arrayidx27, align 8
  %mul28 = fmul double %div, %61
  %add29 = fadd double %59, %mul28
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv8
  store double %add29, double* %arrayidx31, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %arrayidx23.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next9
  %62 = load double, double* %arrayidx23.1, align 8
  %63 = sub nsw i64 %12, %indvars.iv.next9
  %arrayidx27.1 = getelementptr inbounds double, double* %y, i64 %63
  %64 = load double, double* %arrayidx27.1, align 8
  %mul28.1 = fmul double %div, %64
  %add29.1 = fadd double %62, %mul28.1
  %arrayidx31.1 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv.next9
  store double %add29.1, double* %arrayidx31.1, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, 2
  %exitcond14.1 = icmp eq i64 %indvars.iv.next9.1, %indvars.iv23
  br i1 %exitcond14.1, label %for.end44.loopexit, label %for.body21, !llvm.loop !6

for.end44.loopexit:                               ; preds = %for.body21
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %middle.block, %for.body21.prol.loopexit
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* nonnull %5, i64 %10, i32 8, i1 false)
  %arrayidx46 = getelementptr inbounds double, double* %y, i64 %indvars.iv23
  store double %div, double* %arrayidx46, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27 = icmp eq i64 %11, 1999
  br i1 %exitcond27, label %for.end49, label %for.body8.lr.ph

for.end49:                                        ; preds = %for.end44
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
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}

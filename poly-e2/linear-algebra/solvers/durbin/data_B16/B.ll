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
  %arraydecay32 = bitcast i8* %call1 to double*
  tail call fastcc void @kernel_durbin(double* %arraydecay1, double* %arraydecay32)
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
  %1 = bitcast i8* %call1 to double*
  tail call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %r) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body.for.body_crit_edge, %entry
  %indvars.iv2 = phi i64 [ 0, %entry ], [ %indvars.iv.next.4, %for.body.for.body_crit_edge ]
  %0 = sub nuw nsw i64 2001, %indvars.iv2
  %1 = trunc i64 %0 to i32
  %conv = sitofp i32 %1 to double
  %arrayidx = getelementptr inbounds double, double* %r, i64 %indvars.iv2
  %2 = bitcast double* %arrayidx to <2 x double>*
  %3 = sub i64 2000, %indvars.iv2
  %4 = trunc i64 %3 to i32
  %conv.1 = sitofp i32 %4 to double
  %5 = insertelement <2 x double> undef, double %conv, i32 0
  %6 = insertelement <2 x double> %5, double %conv.1, i32 1
  store <2 x double> %6, <2 x double>* %2, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv2, 2
  %7 = sub i64 1999, %indvars.iv2
  %8 = trunc i64 %7 to i32
  %conv.2 = sitofp i32 %8 to double
  %arrayidx.2 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.1
  %9 = bitcast double* %arrayidx.2 to <2 x double>*
  %10 = sub i64 1998, %indvars.iv2
  %11 = trunc i64 %10 to i32
  %conv.3 = sitofp i32 %11 to double
  %12 = insertelement <2 x double> undef, double %conv.2, i32 0
  %13 = insertelement <2 x double> %12, double %conv.3, i32 1
  store <2 x double> %13, <2 x double>* %9, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv2, 4
  %14 = sub i64 1997, %indvars.iv2
  %15 = trunc i64 %14 to i32
  %conv.4 = sitofp i32 %15 to double
  %arrayidx.4 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv2, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.end, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  br label %for.body

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
  br label %for.body

for.body:                                         ; preds = %for.end44.for.body_crit_edge, %entry
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %for.end44.for.body_crit_edge ]
  %alpha.027 = phi double [ %sub3, %entry ], [ %div, %for.end44.for.body_crit_edge ]
  %beta.026 = phi double [ 1.000000e+00, %entry ], [ %mul5, %for.end44.for.body_crit_edge ]
  %indvars.iv1925 = phi i64 [ 1, %entry ], [ %indvars.iv.next20, %for.end44.for.body_crit_edge ]
  %6 = add i64 %indvar, -1
  %7 = add i64 %indvar, 1
  %8 = shl i64 %indvar, 3
  %9 = add nuw nsw i64 %8, 8
  %mul = fmul double %alpha.027, %alpha.027
  %10 = add nsw i64 %indvars.iv1925, -1
  %xtraiter = and i64 %7, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body.for.body8.prol.loopexit_crit_edge, label %for.body.for.body8.prol_crit_edge

for.body.for.body8.prol_crit_edge:                ; preds = %for.body
  br label %for.body8.prol

for.body.for.body8.prol.loopexit_crit_edge:       ; preds = %for.body
  br label %for.body8.prol.loopexit

for.body8.prol:                                   ; preds = %for.body8.prol.for.body8.prol_crit_edge, %for.body.for.body8.prol_crit_edge
  %sum.022.prol = phi double [ %add.prol, %for.body8.prol.for.body8.prol_crit_edge ], [ 0.000000e+00, %for.body.for.body8.prol_crit_edge ]
  %indvars.iv21.prol = phi i64 [ %indvars.iv.next.prol, %for.body8.prol.for.body8.prol_crit_edge ], [ 0, %for.body.for.body8.prol_crit_edge ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body8.prol.for.body8.prol_crit_edge ], [ %xtraiter, %for.body.for.body8.prol_crit_edge ]
  %11 = sub nsw i64 %10, %indvars.iv21.prol
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %11
  %12 = load double, double* %arrayidx11.prol, align 8
  %arrayidx13.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv21.prol
  %13 = load double, double* %arrayidx13.prol, align 8
  %mul14.prol = fmul double %12, %13
  %add.prol = fadd double %sum.022.prol, %mul14.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv21.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body8.prol.for.body8.prol.loopexit_crit_edge, label %for.body8.prol.for.body8.prol_crit_edge, !llvm.loop !1

for.body8.prol.for.body8.prol_crit_edge:          ; preds = %for.body8.prol
  br label %for.body8.prol

for.body8.prol.for.body8.prol.loopexit_crit_edge: ; preds = %for.body8.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.prol.for.body8.prol.loopexit_crit_edge, %for.body.for.body8.prol.loopexit_crit_edge
  %add.lcssa.unr = phi double [ undef, %for.body.for.body8.prol.loopexit_crit_edge ], [ %add.prol, %for.body8.prol.for.body8.prol.loopexit_crit_edge ]
  %sum.022.unr = phi double [ 0.000000e+00, %for.body.for.body8.prol.loopexit_crit_edge ], [ %add.prol, %for.body8.prol.for.body8.prol.loopexit_crit_edge ]
  %indvars.iv21.unr = phi i64 [ 0, %for.body.for.body8.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %for.body8.prol.for.body8.prol.loopexit_crit_edge ]
  %14 = icmp ult i64 %indvar, 3
  br i1 %14, label %for.body8.prol.loopexit.for.end_crit_edge, label %for.body8.prol.loopexit.for.body8_crit_edge

for.body8.prol.loopexit.for.body8_crit_edge:      ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8.prol.loopexit.for.end_crit_edge:        ; preds = %for.body8.prol.loopexit
  br label %for.end

for.body8:                                        ; preds = %for.body8.for.body8_crit_edge, %for.body8.prol.loopexit.for.body8_crit_edge
  %sum.022 = phi double [ %add.3, %for.body8.for.body8_crit_edge ], [ %sum.022.unr, %for.body8.prol.loopexit.for.body8_crit_edge ]
  %indvars.iv21 = phi i64 [ %indvars.iv.next.3, %for.body8.for.body8_crit_edge ], [ %indvars.iv21.unr, %for.body8.prol.loopexit.for.body8_crit_edge ]
  %arrayidx13 = getelementptr inbounds double, double* %y, i64 %indvars.iv21
  %15 = bitcast double* %arrayidx13 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv21, 1
  %16 = sub nsw i64 %10, %indvars.iv.next
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %16
  %17 = bitcast double* %arrayidx11.1 to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %19 = load <2 x double>, <2 x double>* %15, align 8
  %mul14.v.i0 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %mul14 = fmul <2 x double> %mul14.v.i0, %19
  %mul14.v.r1 = extractelement <2 x double> %mul14, i32 0
  %mul14.v.r2 = extractelement <2 x double> %mul14, i32 1
  %add = fadd double %sum.022, %mul14.v.r1
  %add.1 = fadd double %add, %mul14.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv21, 2
  %arrayidx13.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %20 = bitcast double* %arrayidx13.2 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv21, 3
  %21 = sub nsw i64 %10, %indvars.iv.next.2
  %arrayidx11.3 = getelementptr inbounds double, double* %r, i64 %21
  %22 = bitcast double* %arrayidx11.3 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %24 = load <2 x double>, <2 x double>* %20, align 8
  %mul14.2.v.i0 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %mul14.2 = fmul <2 x double> %mul14.2.v.i0, %24
  %mul14.2.v.r1 = extractelement <2 x double> %mul14.2, i32 0
  %mul14.2.v.r2 = extractelement <2 x double> %mul14.2, i32 1
  %add.2 = fadd double %add.1, %mul14.2.v.r1
  %add.3 = fadd double %add.2, %mul14.2.v.r2
  %indvars.iv.next.3 = add nsw i64 %indvars.iv21, 4
  %exitcond.3 = icmp eq i64 %indvars.iv1925, %indvars.iv.next.3
  br i1 %exitcond.3, label %for.body8.for.end_crit_edge, label %for.body8.for.body8_crit_edge

for.body8.for.body8_crit_edge:                    ; preds = %for.body8
  br label %for.body8

for.body8.for.end_crit_edge:                      ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.body8.for.end_crit_edge, %for.body8.prol.loopexit.for.end_crit_edge
  %add.lcssa = phi double [ %add.lcssa.unr, %for.body8.prol.loopexit.for.end_crit_edge ], [ %add.3, %for.body8.for.end_crit_edge ]
  %sub4 = fsub double 1.000000e+00, %mul
  %mul5 = fmul double %beta.026, %sub4
  %arrayidx16 = getelementptr inbounds double, double* %r, i64 %indvars.iv1925
  %25 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %add.lcssa, %25
  %sub18 = fsub double -0.000000e+00, %add17
  %div = fdiv double %sub18, %mul5
  %26 = and i64 %indvar, 1
  %lcmp.mod32 = icmp eq i64 %26, 0
  br i1 %lcmp.mod32, label %for.body21.prol, label %for.end.for.body21.prol.loopexit_crit_edge

for.end.for.body21.prol.loopexit_crit_edge:       ; preds = %for.end
  br label %for.body21.prol.loopexit

for.body21.prol:                                  ; preds = %for.end
  %27 = load double, double* %y, align 8
  %sunkaddr33 = shl i64 %indvars.iv1925, 3
  %sunkaddr34 = add i64 %3, %sunkaddr33
  %sunkaddr35 = add i64 %sunkaddr34, -8
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to double*
  %28 = load double, double* %sunkaddr36, align 8
  %mul28.prol = fmul double %div, %28
  %add29.prol = fadd double %27, %mul28.prol
  store double %add29.prol, double* %2, align 16
  br label %for.body21.prol.loopexit

for.body21.prol.loopexit:                         ; preds = %for.end.for.body21.prol.loopexit_crit_edge, %for.body21.prol
  %indvars.iv523.unr.ph = phi i64 [ 1, %for.body21.prol ], [ 0, %for.end.for.body21.prol.loopexit_crit_edge ]
  %29 = icmp eq i64 %indvar, 0
  br i1 %29, label %for.body21.prol.loopexit.for.end44_crit_edge, label %for.body21.preheader

for.body21.prol.loopexit.for.end44_crit_edge:     ; preds = %for.body21.prol.loopexit
  br label %for.end44

for.body21.preheader:                             ; preds = %for.body21.prol.loopexit
  %30 = sub i64 %6, %indvars.iv523.unr.ph
  %31 = lshr i64 %30, 1
  %32 = add nuw i64 %31, 1
  %min.iters.check = icmp ult i64 %32, 2
  br i1 %min.iters.check, label %for.body21.preheader.for.body21_crit_edge, label %min.iters.checked

for.body21.preheader.for.body21_crit_edge:        ; preds = %for.body21.preheader
  br label %for.body21.preheader1

min.iters.checked:                                ; preds = %for.body21.preheader
  %n.mod.vf = and i64 %32, 1
  %n.vec = sub i64 %32, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %33 = or i64 %indvars.iv523.unr.ph, 2
  %34 = shl nuw i64 %31, 1
  %35 = add i64 %33, %34
  %36 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %35, %36
  br i1 %cmp.zero, label %min.iters.checked.for.body21_crit_edge, label %vector.ph

min.iters.checked.for.body21_crit_edge:           ; preds = %min.iters.checked
  br label %for.body21.preheader1

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert43 = insertelement <2 x double> undef, double %div, i32 0
  %broadcast.splat44 = shufflevector <2 x double> %broadcast.splatinsert43, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %37 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv523.unr.ph, %37
  %38 = getelementptr inbounds double, double* %y, i64 %offset.idx
  %39 = bitcast double* %38 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %39, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec38 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %40 = sub nsw i64 %10, %offset.idx
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
  br i1 %52, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block.for.end44_crit_edge, label %middle.block.for.body21_crit_edge

middle.block.for.body21_crit_edge:                ; preds = %middle.block
  br label %for.body21.preheader1

for.body21.preheader1:                            ; preds = %for.body21.preheader.for.body21_crit_edge, %min.iters.checked.for.body21_crit_edge, %middle.block.for.body21_crit_edge
  %indvars.iv523.ph = phi i64 [ %indvars.iv523.unr.ph, %min.iters.checked.for.body21_crit_edge ], [ %indvars.iv523.unr.ph, %for.body21.preheader.for.body21_crit_edge ], [ %ind.end, %middle.block.for.body21_crit_edge ]
  %53 = insertelement <2 x double> undef, double %div, i32 0
  %mul28.v.i0.2 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body21

middle.block.for.end44_crit_edge:                 ; preds = %middle.block
  br label %for.end44

for.body21:                                       ; preds = %for.body21.preheader1, %for.body21.for.body21_crit_edge
  %indvars.iv523 = phi i64 [ %indvars.iv.next6.1, %for.body21.for.body21_crit_edge ], [ %indvars.iv523.ph, %for.body21.preheader1 ]
  %arrayidx23 = getelementptr inbounds double, double* %y, i64 %indvars.iv523
  %54 = bitcast double* %arrayidx23 to <2 x double>*
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %indvars.iv523
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv523, 1
  %55 = load <2 x double>, <2 x double>* %54, align 8
  %56 = sub nsw i64 %10, %indvars.iv.next6
  %arrayidx27.1 = getelementptr inbounds double, double* %y, i64 %56
  %57 = bitcast double* %arrayidx27.1 to <2 x double>*
  %58 = load <2 x double>, <2 x double>* %57, align 8
  %mul28.1 = fmul <2 x double> %mul28.v.i0.2, %58
  %add29.v.i1 = shufflevector <2 x double> %mul28.1, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %add29 = fadd <2 x double> %55, %add29.v.i1
  %59 = bitcast double* %arrayidx31 to <2 x double>*
  store <2 x double> %add29, <2 x double>* %59, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv523, 2
  %exitcond12.1 = icmp eq i64 %indvars.iv1925, %indvars.iv.next6.1
  br i1 %exitcond12.1, label %for.body21.for.end44_crit_edge, label %for.body21.for.body21_crit_edge, !llvm.loop !6

for.body21.for.body21_crit_edge:                  ; preds = %for.body21
  br label %for.body21

for.body21.for.end44_crit_edge:                   ; preds = %for.body21
  br label %for.end44

for.end44:                                        ; preds = %for.body21.for.end44_crit_edge, %middle.block.for.end44_crit_edge, %for.body21.prol.loopexit.for.end44_crit_edge
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* nonnull %5, i64 %9, i32 8, i1 false)
  %arrayidx46 = getelementptr inbounds double, double* %y, i64 %indvars.iv1925
  store double %div, double* %arrayidx46, align 8
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond30 = icmp eq i64 %indvar.next, 1999
  br i1 %exitcond30, label %for.end49, label %for.end44.for.body_crit_edge

for.end44.for.body_crit_edge:                     ; preds = %for.end44
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1925, 1
  br label %for.body

for.end49:                                        ; preds = %for.end44
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end.for.body_crit_edge, %entry
  %indvars.iv1 = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end.for.body_crit_edge ]
  %3 = trunc i64 %indvars.iv1 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.if.end_crit_edge

for.body.if.end_crit_edge:                        ; preds = %for.body
  br label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv1
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %if.end.for.body_crit_edge

if.end.for.body_crit_edge:                        ; preds = %if.end
  br label %for.body

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

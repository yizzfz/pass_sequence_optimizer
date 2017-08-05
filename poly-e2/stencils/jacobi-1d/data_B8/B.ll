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
  %0 = sext i32 %n to i64
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %min.iters.check = icmp eq i32 %n, 1
  br i1 %min.iters.check, label %for.inc.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc.lr.ph
  %n.vec = and i64 %0, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.inc.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %A, i64 %0
  %scevgep11 = getelementptr double, double* %B, i64 %0
  %bound0 = icmp ugt double* %scevgep11, %A
  %bound1 = icmp ugt double* %scevgep, %B
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.inc.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %conv1, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind13 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next14, %vector.body ]
  %1 = sitofp <2 x i32> %vec.ind13 to <2 x double>
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
  %vec.ind.next14 = add <2 x i32> %vec.ind13, <i32 2, i32 2>
  %10 = icmp eq i64 %index.next, %n.vec
  br i1 %10, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %0, %n.vec
  br i1 %cmp.n, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.inc.lr.ph
  %indvars.iv7.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.inc.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv7 = phi i64 [ %indvars.iv.next, %for.inc ], [ %indvars.iv7.ph, %for.inc.preheader ]
  %11 = trunc i64 %indvars.iv7 to i32
  %conv = sitofp i32 %11 to double
  %add = fadd double %conv, 2.000000e+00
  %div = fdiv double %add, %conv1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv7
  store double %div, double* %arrayidx, align 8
  %add3 = fadd double %conv, 3.000000e+00
  %div5 = fdiv double %add3, %conv1
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv7
  store double %div5, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %0
  br i1 %exitcond, label %for.end.loopexit, label %for.inc, !llvm.loop !9

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp23 = icmp sgt i32 %tsteps, 0
  br i1 %cmp23, label %for.cond1.preheader.lr.ph, label %for.end35

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = add i32 %n, -1
  %1 = sext i32 %0 to i64
  %cmp219 = icmp sgt i32 %0, 1
  br i1 %cmp219, label %for.cond1.preheader.us.preheader, label %for.end35

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %2 = add nsw i64 %1, -2
  %3 = and i64 %1, 1
  %lcmp.mod = icmp ne i64 %3, 0
  %4 = icmp eq i64 %2, 0
  %arrayidx21.us.prol = getelementptr inbounds double, double* %B, i64 1
  %arrayidx25.us.prol = getelementptr double, double* %B, i64 2
  %arrayidx29.us.prol = getelementptr inbounds double, double* %A, i64 1
  %arrayidx9.us.prol = getelementptr double, double* %A, i64 2
  %scevgep104 = getelementptr double, double* %B, i64 -1
  %scevgep107 = getelementptr double, double* %B, i64 3
  %scevgep149 = getelementptr double, double* %A, i64 -1
  %scevgep152 = getelementptr double, double* %A, i64 3
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc33.us, %for.cond1.preheader.us.preheader
  %storemerge24.us = phi i32 [ %inc34.us, %for.inc33.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.cond1.preheader.us
  %5 = load double, double* %A, align 8
  %6 = load double, double* %arrayidx29.us.prol, align 8
  %add.us.prol = fadd double %5, %6
  %7 = load double, double* %arrayidx9.us.prol, align 8
  %add10.us.prol = fadd double %add.us.prol, %7
  %mul.us.prol = fmul double %add10.us.prol, 3.333300e-01
  store double %mul.us.prol, double* %arrayidx21.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.cond1.preheader.us
  %indvars.iv20.us.unr.ph = phi i64 [ 2, %for.inc.us.prol ], [ 1, %for.cond1.preheader.us ]
  br i1 %4, label %for.inc30.us.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %8 = sub nsw i64 %2, %indvars.iv20.us.unr.ph
  %9 = lshr i64 %8, 1
  %10 = add nuw i64 %9, 1
  %min.iters.check138 = icmp ult i64 %10, 2
  br i1 %min.iters.check138, label %for.inc.us.preheader182, label %min.iters.checked139

for.inc.us.preheader182:                          ; preds = %middle.block136, %vector.memcheck159, %min.iters.checked139, %for.inc.us.preheader
  %indvars.iv20.us.ph = phi i64 [ %indvars.iv20.us.unr.ph, %vector.memcheck159 ], [ %indvars.iv20.us.unr.ph, %min.iters.checked139 ], [ %indvars.iv20.us.unr.ph, %for.inc.us.preheader ], [ %ind.end164, %middle.block136 ]
  br label %for.inc.us

min.iters.checked139:                             ; preds = %for.inc.us.preheader
  %n.mod.vf140 = and i64 %10, 1
  %n.vec141 = sub i64 %10, %n.mod.vf140
  %cmp.zero142 = icmp eq i64 %n.vec141, 0
  br i1 %cmp.zero142, label %for.inc.us.preheader182, label %vector.memcheck159

vector.memcheck159:                               ; preds = %min.iters.checked139
  %scevgep144 = getelementptr double, double* %B, i64 %indvars.iv20.us.unr.ph
  %11 = shl nuw i64 %9, 1
  %12 = add i64 %indvars.iv20.us.unr.ph, %11
  %scevgep147 = getelementptr double, double* %arrayidx25.us.prol, i64 %12
  %scevgep150 = getelementptr double, double* %scevgep149, i64 %indvars.iv20.us.unr.ph
  %scevgep153 = getelementptr double, double* %scevgep152, i64 %12
  %bound0155 = icmp ult double* %scevgep144, %scevgep153
  %bound1156 = icmp ult double* %scevgep150, %scevgep147
  %found.conflict157 = and i1 %bound0155, %bound1156
  %13 = add nuw nsw i64 %indvars.iv20.us.unr.ph, 2
  %14 = add i64 %13, %11
  %15 = shl nuw nsw i64 %n.mod.vf140, 1
  %ind.end164 = sub i64 %14, %15
  br i1 %found.conflict157, label %for.inc.us.preheader182, label %vector.body135.preheader

vector.body135.preheader:                         ; preds = %vector.memcheck159
  br label %vector.body135

vector.body135:                                   ; preds = %vector.body135.preheader, %vector.body135
  %index161 = phi i64 [ %index.next162, %vector.body135 ], [ 0, %vector.body135.preheader ]
  %16 = shl i64 %index161, 1
  %offset.idx166 = or i64 %indvars.iv20.us.unr.ph, %16
  %17 = add nsw i64 %offset.idx166, -1
  %18 = getelementptr inbounds double, double* %A, i64 %17
  %19 = bitcast double* %18 to <4 x double>*
  %wide.vec170 = load <4 x double>, <4 x double>* %19, align 8, !alias.scope !10
  %strided.vec171 = shufflevector <4 x double> %wide.vec170, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec172 = shufflevector <4 x double> %wide.vec170, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %20 = fadd <2 x double> %strided.vec171, %strided.vec172
  %21 = add nuw nsw i64 %offset.idx166, 1
  %22 = getelementptr inbounds double, double* %A, i64 %21
  %23 = getelementptr double, double* %22, i64 -1
  %24 = bitcast double* %23 to <4 x double>*
  %wide.vec173 = load <4 x double>, <4 x double>* %24, align 8, !alias.scope !10
  %strided.vec175 = shufflevector <4 x double> %wide.vec173, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %25 = fadd <2 x double> %20, %strided.vec175
  %26 = fmul <2 x double> %25, <double 3.333300e-01, double 3.333300e-01>
  %27 = bitcast double* %22 to <4 x double>*
  %wide.vec176 = load <4 x double>, <4 x double>* %27, align 8, !alias.scope !10
  %strided.vec178 = shufflevector <4 x double> %wide.vec176, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %28 = fadd <4 x double> %wide.vec173, %wide.vec176
  %29 = shufflevector <4 x double> %28, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %30 = fadd <2 x double> %29, %strided.vec178
  %31 = fmul <2 x double> %30, <double 3.333300e-01, double 3.333300e-01>
  %32 = getelementptr inbounds double, double* %B, i64 %21
  %33 = getelementptr double, double* %32, i64 -1
  %34 = bitcast double* %33 to <4 x double>*
  %interleaved.vec179 = shufflevector <2 x double> %26, <2 x double> %31, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec179, <4 x double>* %34, align 8, !alias.scope !13, !noalias !10
  %index.next162 = add i64 %index161, 2
  %35 = icmp eq i64 %index.next162, %n.vec141
  br i1 %35, label %middle.block136, label %vector.body135, !llvm.loop !15

middle.block136:                                  ; preds = %vector.body135
  %cmp.n165 = icmp eq i64 %n.mod.vf140, 0
  br i1 %cmp.n165, label %for.inc30.us.preheader, label %for.inc.us.preheader182

for.inc33.us.loopexit:                            ; preds = %for.inc30.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.inc33.us.loopexit, %middle.block91, %for.inc30.us.prol.loopexit
  %inc34.us = add nuw nsw i32 %storemerge24.us, 1
  %exitcond60 = icmp eq i32 %inc34.us, %tsteps
  br i1 %exitcond60, label %for.end35.loopexit, label %for.cond1.preheader.us

for.inc30.us:                                     ; preds = %for.inc30.us.preheader181, %for.inc30.us
  %indvars.iv1622.us = phi i64 [ %indvars.iv.next17.us.1, %for.inc30.us ], [ %indvars.iv1622.us.ph, %for.inc30.us.preheader181 ]
  %36 = add nsw i64 %indvars.iv1622.us, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %36
  %37 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv1622.us
  %38 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %37, %38
  %indvars.iv.next17.us = add nuw nsw i64 %indvars.iv1622.us, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next17.us
  %39 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %39
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv1622.us
  store double %mul27.us, double* %arrayidx29.us, align 8
  %40 = load double, double* %arrayidx21.us, align 8
  %41 = load double, double* %arrayidx25.us, align 8
  %add22.us.1 = fadd double %40, %41
  %indvars.iv.next17.us.1 = add nsw i64 %indvars.iv1622.us, 2
  %arrayidx25.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next17.us.1
  %42 = load double, double* %arrayidx25.us.1, align 8
  %add26.us.1 = fadd double %add22.us.1, %42
  %mul27.us.1 = fmul double %add26.us.1, 3.333300e-01
  %arrayidx29.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next17.us
  store double %mul27.us.1, double* %arrayidx29.us.1, align 8
  %exitcond59.1 = icmp eq i64 %indvars.iv.next17.us.1, %1
  br i1 %exitcond59.1, label %for.inc33.us.loopexit, label %for.inc30.us, !llvm.loop !16

for.inc.us:                                       ; preds = %for.inc.us.preheader182, %for.inc.us
  %indvars.iv20.us = phi i64 [ %indvars.iv.next.us.1, %for.inc.us ], [ %indvars.iv20.us.ph, %for.inc.us.preheader182 ]
  %43 = add nsw i64 %indvars.iv20.us, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %43
  %44 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv20.us
  %45 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %44, %45
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv20.us, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.us
  %46 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %46
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv20.us
  store double %mul.us, double* %arrayidx12.us, align 8
  %47 = load double, double* %arrayidx6.us, align 8
  %48 = load double, double* %arrayidx9.us, align 8
  %add.us.1 = fadd double %47, %48
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv20.us, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.us.1
  %49 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %49
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next.us
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %1
  br i1 %exitcond.1, label %for.inc30.us.preheader.loopexit, label %for.inc.us, !llvm.loop !17

for.inc30.us.preheader.loopexit:                  ; preds = %for.inc.us
  br label %for.inc30.us.preheader

for.inc30.us.preheader:                           ; preds = %for.inc30.us.preheader.loopexit, %for.inc.us.prol.loopexit, %middle.block136
  br i1 %lcmp.mod, label %for.inc30.us.prol.loopexit, label %for.inc30.us.prol

for.inc30.us.prol:                                ; preds = %for.inc30.us.preheader
  %50 = load double, double* %B, align 8
  %51 = load double, double* %arrayidx21.us.prol, align 8
  %add22.us.prol = fadd double %50, %51
  %52 = load double, double* %arrayidx25.us.prol, align 8
  %add26.us.prol = fadd double %add22.us.prol, %52
  %mul27.us.prol = fmul double %add26.us.prol, 3.333300e-01
  store double %mul27.us.prol, double* %arrayidx29.us.prol, align 8
  br label %for.inc30.us.prol.loopexit

for.inc30.us.prol.loopexit:                       ; preds = %for.inc30.us.prol, %for.inc30.us.preheader
  %indvars.iv1622.us.unr.ph = phi i64 [ 2, %for.inc30.us.prol ], [ 1, %for.inc30.us.preheader ]
  br i1 %4, label %for.inc33.us, label %for.inc30.us.preheader71

for.inc30.us.preheader71:                         ; preds = %for.inc30.us.prol.loopexit
  %53 = sub nsw i64 %2, %indvars.iv1622.us.unr.ph
  %54 = lshr i64 %53, 1
  %55 = add nuw i64 %54, 1
  %min.iters.check93 = icmp ult i64 %55, 2
  br i1 %min.iters.check93, label %for.inc30.us.preheader181, label %min.iters.checked94

for.inc30.us.preheader181:                        ; preds = %middle.block91, %vector.memcheck114, %min.iters.checked94, %for.inc30.us.preheader71
  %indvars.iv1622.us.ph = phi i64 [ %indvars.iv1622.us.unr.ph, %vector.memcheck114 ], [ %indvars.iv1622.us.unr.ph, %min.iters.checked94 ], [ %indvars.iv1622.us.unr.ph, %for.inc30.us.preheader71 ], [ %ind.end119, %middle.block91 ]
  br label %for.inc30.us

min.iters.checked94:                              ; preds = %for.inc30.us.preheader71
  %n.mod.vf95 = and i64 %55, 1
  %n.vec96 = sub i64 %55, %n.mod.vf95
  %cmp.zero97 = icmp eq i64 %n.vec96, 0
  br i1 %cmp.zero97, label %for.inc30.us.preheader181, label %vector.memcheck114

vector.memcheck114:                               ; preds = %min.iters.checked94
  %scevgep99 = getelementptr double, double* %A, i64 %indvars.iv1622.us.unr.ph
  %56 = shl nuw i64 %54, 1
  %57 = add i64 %indvars.iv1622.us.unr.ph, %56
  %scevgep102 = getelementptr double, double* %arrayidx9.us.prol, i64 %57
  %scevgep105 = getelementptr double, double* %scevgep104, i64 %indvars.iv1622.us.unr.ph
  %scevgep108 = getelementptr double, double* %scevgep107, i64 %57
  %bound0110 = icmp ult double* %scevgep99, %scevgep108
  %bound1111 = icmp ult double* %scevgep105, %scevgep102
  %found.conflict112 = and i1 %bound0110, %bound1111
  %58 = add nuw nsw i64 %indvars.iv1622.us.unr.ph, 2
  %59 = add i64 %58, %56
  %60 = shl nuw nsw i64 %n.mod.vf95, 1
  %ind.end119 = sub i64 %59, %60
  br i1 %found.conflict112, label %for.inc30.us.preheader181, label %vector.body90.preheader

vector.body90.preheader:                          ; preds = %vector.memcheck114
  br label %vector.body90

vector.body90:                                    ; preds = %vector.body90.preheader, %vector.body90
  %index116 = phi i64 [ %index.next117, %vector.body90 ], [ 0, %vector.body90.preheader ]
  %61 = shl i64 %index116, 1
  %offset.idx121 = or i64 %indvars.iv1622.us.unr.ph, %61
  %62 = add nsw i64 %offset.idx121, -1
  %63 = getelementptr inbounds double, double* %B, i64 %62
  %64 = bitcast double* %63 to <4 x double>*
  %wide.vec125 = load <4 x double>, <4 x double>* %64, align 8, !alias.scope !18
  %strided.vec126 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec127 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %65 = fadd <2 x double> %strided.vec126, %strided.vec127
  %66 = add nuw nsw i64 %offset.idx121, 1
  %67 = getelementptr inbounds double, double* %B, i64 %66
  %68 = getelementptr double, double* %67, i64 -1
  %69 = bitcast double* %68 to <4 x double>*
  %wide.vec128 = load <4 x double>, <4 x double>* %69, align 8, !alias.scope !18
  %strided.vec130 = shufflevector <4 x double> %wide.vec128, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %70 = fadd <2 x double> %65, %strided.vec130
  %71 = fmul <2 x double> %70, <double 3.333300e-01, double 3.333300e-01>
  %72 = bitcast double* %67 to <4 x double>*
  %wide.vec131 = load <4 x double>, <4 x double>* %72, align 8, !alias.scope !18
  %strided.vec133 = shufflevector <4 x double> %wide.vec131, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %73 = fadd <4 x double> %wide.vec128, %wide.vec131
  %74 = shufflevector <4 x double> %73, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %75 = fadd <2 x double> %74, %strided.vec133
  %76 = fmul <2 x double> %75, <double 3.333300e-01, double 3.333300e-01>
  %77 = getelementptr inbounds double, double* %A, i64 %66
  %78 = getelementptr double, double* %77, i64 -1
  %79 = bitcast double* %78 to <4 x double>*
  %interleaved.vec134 = shufflevector <2 x double> %71, <2 x double> %76, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec134, <4 x double>* %79, align 8, !alias.scope !21, !noalias !18
  %index.next117 = add i64 %index116, 2
  %80 = icmp eq i64 %index.next117, %n.vec96
  br i1 %80, label %middle.block91, label %vector.body90, !llvm.loop !23

middle.block91:                                   ; preds = %vector.body90
  %cmp.n120 = icmp eq i64 %n.mod.vf95, 0
  br i1 %cmp.n120, label %for.inc33.us, label %for.inc30.us.preheader181

for.end35.loopexit:                               ; preds = %for.inc33.us
  br label %for.end35

for.end35:                                        ; preds = %for.end35.loopexit, %for.cond1.preheader.lr.ph, %entry
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
  %3 = sext i32 %n to i64
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %indvars.iv4 = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.preheader ]
  %4 = trunc i64 %indvars.iv4 to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv4
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
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
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = distinct !{!17, !7, !8}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !7, !8}

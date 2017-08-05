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
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = zext i32 %n to i64
  %min.iters.check = icmp eq i32 %n, 1
  br i1 %min.iters.check, label %for.inc.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc.lr.ph
  %1 = and i32 %n, 1
  %n.mod.vf = zext i32 %1 to i64
  %n.vec = sub nsw i64 %0, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.inc.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %A, i64 %0
  %scevgep12 = getelementptr double, double* %B, i64 %0
  %bound0 = icmp ugt double* %scevgep12, %A
  %bound1 = icmp ugt double* %scevgep, %B
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.inc.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %conv1, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind14 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next15, %vector.body ]
  %2 = sitofp <2 x i32> %vec.ind14 to <2 x double>
  %3 = fadd <2 x double> %2, <double 2.000000e+00, double 2.000000e+00>
  %4 = fdiv <2 x double> %3, %broadcast.splat
  %5 = getelementptr inbounds double, double* %A, i64 %index
  %6 = bitcast double* %5 to <2 x double>*
  store <2 x double> %4, <2 x double>* %6, align 8, !alias.scope !1, !noalias !4
  %7 = fadd <2 x double> %2, <double 3.000000e+00, double 3.000000e+00>
  %8 = fdiv <2 x double> %7, %broadcast.splat
  %9 = getelementptr inbounds double, double* %B, i64 %index
  %10 = bitcast double* %9 to <2 x double>*
  store <2 x double> %8, <2 x double>* %10, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next15 = add <2 x i32> %vec.ind14, <i32 2, i32 2>
  %11 = icmp eq i64 %index.next, %n.vec
  br i1 %11, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i32 %1, 0
  br i1 %cmp.n, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.inc.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.inc.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ %indvars.iv.ph, %for.inc.preheader ]
  %12 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %12 to double
  %add = fadd double %conv, 2.000000e+00
  %div = fdiv double %add, %conv1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  store double %div, double* %arrayidx, align 8
  %add3 = fadd double %conv, 3.000000e+00
  %div5 = fdiv double %add3, %conv1
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div5, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next, %0
  br i1 %exitcond8, label %for.end.loopexit, label %for.inc, !llvm.loop !9

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp19 = icmp sgt i32 %tsteps, 0
  br i1 %cmp19, label %for.cond1.preheader.lr.ph, label %for.end35

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp215 = icmp sgt i32 %sub, 1
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %0 = icmp eq i32 %n, 3
  br i1 %cmp215, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %1 = add i32 %tsteps, -1
  %xtraiter111 = and i32 %tsteps, 7
  %lcmp.mod112 = icmp eq i32 %xtraiter111, 0
  br i1 %lcmp.mod112, label %for.cond1.preheader.prol.loopexit, label %for.cond1.preheader.prol.preheader

for.cond1.preheader.prol.preheader:               ; preds = %for.cond1.preheader.preheader
  br label %for.cond1.preheader.prol

for.cond1.preheader.prol:                         ; preds = %for.cond1.preheader.prol, %for.cond1.preheader.prol.preheader
  %storemerge20.prol = phi i32 [ %inc34.prol, %for.cond1.preheader.prol ], [ 0, %for.cond1.preheader.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond1.preheader.prol ], [ %xtraiter111, %for.cond1.preheader.prol.preheader ]
  %inc34.prol = add nuw nsw i32 %storemerge20.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond1.preheader.prol.loopexit.unr-lcssa, label %for.cond1.preheader.prol, !llvm.loop !10

for.cond1.preheader.prol.loopexit.unr-lcssa:      ; preds = %for.cond1.preheader.prol
  br label %for.cond1.preheader.prol.loopexit

for.cond1.preheader.prol.loopexit:                ; preds = %for.cond1.preheader.preheader, %for.cond1.preheader.prol.loopexit.unr-lcssa
  %storemerge20.unr = phi i32 [ 0, %for.cond1.preheader.preheader ], [ %inc34.prol, %for.cond1.preheader.prol.loopexit.unr-lcssa ]
  %2 = icmp ult i32 %1, 7
  br i1 %2, label %for.end35.loopexit110, label %for.cond1.preheader.preheader.new

for.cond1.preheader.preheader.new:                ; preds = %for.cond1.preheader.prol.loopexit
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %3 = and i32 %sub, 1
  %lcmp.mod36 = icmp eq i32 %3, 0
  %arrayidx21.us.prol = getelementptr inbounds double, double* %B, i64 1
  %arrayidx25.us.prol = getelementptr double, double* %B, i64 2
  %arrayidx29.us.prol = getelementptr inbounds double, double* %A, i64 1
  %4 = icmp eq i32 %sub, 2
  %wide.trip.count26.1 = zext i32 %sub to i64
  %arrayidx9.us.prol = getelementptr double, double* %A, i64 2
  %5 = add nsw i64 %wide.trip.count26.1, -2
  %scevgep50 = getelementptr double, double* %B, i64 -1
  %scevgep53 = getelementptr double, double* %B, i64 3
  %scevgep77 = getelementptr double, double* %A, i64 -1
  %scevgep80 = getelementptr double, double* %A, i64 3
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc33.us
  %storemerge20.us = phi i32 [ %inc34.us, %for.inc33.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.cond1.preheader.us
  %6 = load double, double* %A, align 8
  %7 = load double, double* %arrayidx29.us.prol, align 8
  %add.us.prol = fadd double %6, %7
  %8 = load double, double* %arrayidx9.us.prol, align 8
  %add10.us.prol = fadd double %add.us.prol, %8
  %mul.us.prol = fmul double %add10.us.prol, 3.333300e-01
  store double %mul.us.prol, double* %arrayidx21.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.cond1.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 2, %for.inc.us.prol ], [ 1, %for.cond1.preheader.us ]
  br i1 %0, label %for.inc30.us.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %9 = sub nsw i64 %5, %indvars.iv.unr.ph
  %10 = lshr i64 %9, 1
  %11 = add nuw i64 %10, 1
  %min.iters.check66 = icmp ult i64 %11, 2
  br i1 %min.iters.check66, label %for.inc.us.preheader109, label %min.iters.checked67

for.inc.us.preheader109:                          ; preds = %middle.block64, %vector.memcheck87, %min.iters.checked67, %for.inc.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck87 ], [ %indvars.iv.unr.ph, %min.iters.checked67 ], [ %indvars.iv.unr.ph, %for.inc.us.preheader ], [ %ind.end92, %middle.block64 ]
  br label %for.inc.us

min.iters.checked67:                              ; preds = %for.inc.us.preheader
  %n.mod.vf68 = and i64 %11, 1
  %n.vec69 = sub i64 %11, %n.mod.vf68
  %cmp.zero70 = icmp eq i64 %n.vec69, 0
  br i1 %cmp.zero70, label %for.inc.us.preheader109, label %vector.memcheck87

vector.memcheck87:                                ; preds = %min.iters.checked67
  %scevgep72 = getelementptr double, double* %B, i64 %indvars.iv.unr.ph
  %12 = shl nuw i64 %10, 1
  %13 = add i64 %indvars.iv.unr.ph, %12
  %scevgep75 = getelementptr double, double* %arrayidx25.us.prol, i64 %13
  %scevgep78 = getelementptr double, double* %scevgep77, i64 %indvars.iv.unr.ph
  %scevgep81 = getelementptr double, double* %scevgep80, i64 %13
  %bound083 = icmp ult double* %scevgep72, %scevgep81
  %bound184 = icmp ult double* %scevgep78, %scevgep75
  %found.conflict85 = and i1 %bound083, %bound184
  %14 = add nuw nsw i64 %indvars.iv.unr.ph, 2
  %15 = add i64 %14, %12
  %16 = shl nuw nsw i64 %n.mod.vf68, 1
  %ind.end92 = sub i64 %15, %16
  br i1 %found.conflict85, label %for.inc.us.preheader109, label %vector.body63.preheader

vector.body63.preheader:                          ; preds = %vector.memcheck87
  br label %vector.body63

vector.body63:                                    ; preds = %vector.body63.preheader, %vector.body63
  %index89 = phi i64 [ %index.next90, %vector.body63 ], [ 0, %vector.body63.preheader ]
  %17 = shl i64 %index89, 1
  %offset.idx94 = or i64 %indvars.iv.unr.ph, %17
  %18 = add nsw i64 %offset.idx94, -1
  %19 = getelementptr inbounds double, double* %A, i64 %18
  %20 = bitcast double* %19 to <4 x double>*
  %wide.vec98 = load <4 x double>, <4 x double>* %20, align 8, !alias.scope !12
  %strided.vec99 = shufflevector <4 x double> %wide.vec98, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec100 = shufflevector <4 x double> %wide.vec98, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %21 = fadd <2 x double> %strided.vec99, %strided.vec100
  %22 = add nuw nsw i64 %offset.idx94, 1
  %23 = getelementptr inbounds double, double* %A, i64 %22
  %24 = getelementptr double, double* %23, i64 -1
  %25 = bitcast double* %24 to <4 x double>*
  %wide.vec101 = load <4 x double>, <4 x double>* %25, align 8, !alias.scope !12
  %strided.vec103 = shufflevector <4 x double> %wide.vec101, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %26 = fadd <2 x double> %21, %strided.vec103
  %27 = fmul <2 x double> %26, <double 3.333300e-01, double 3.333300e-01>
  %28 = bitcast double* %23 to <4 x double>*
  %wide.vec104 = load <4 x double>, <4 x double>* %28, align 8, !alias.scope !12
  %strided.vec106 = shufflevector <4 x double> %wide.vec104, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %29 = fadd <4 x double> %wide.vec101, %wide.vec104
  %30 = shufflevector <4 x double> %29, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %31 = fadd <2 x double> %30, %strided.vec106
  %32 = fmul <2 x double> %31, <double 3.333300e-01, double 3.333300e-01>
  %33 = getelementptr inbounds double, double* %B, i64 %22
  %34 = getelementptr double, double* %33, i64 -1
  %35 = bitcast double* %34 to <4 x double>*
  %interleaved.vec107 = shufflevector <2 x double> %27, <2 x double> %32, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec107, <4 x double>* %35, align 8, !alias.scope !15, !noalias !12
  %index.next90 = add i64 %index89, 2
  %36 = icmp eq i64 %index.next90, %n.vec69
  br i1 %36, label %middle.block64, label %vector.body63, !llvm.loop !17

middle.block64:                                   ; preds = %vector.body63
  %cmp.n93 = icmp eq i64 %n.mod.vf68, 0
  br i1 %cmp.n93, label %for.inc30.us.preheader, label %for.inc.us.preheader109

for.inc33.us.loopexit:                            ; preds = %for.inc30.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.inc33.us.loopexit, %middle.block, %for.inc30.us.prol.loopexit
  %inc34.us = add nuw nsw i32 %storemerge20.us, 1
  %exitcond28 = icmp eq i32 %inc34.us, %tsteps
  br i1 %exitcond28, label %for.end35.loopexit, label %for.cond1.preheader.us

for.inc30.us:                                     ; preds = %for.inc30.us.preheader108, %for.inc30.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24.1, %for.inc30.us ], [ %indvars.iv23.ph, %for.inc30.us.preheader108 ]
  %37 = add nsw i64 %indvars.iv23, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %37
  %38 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv23
  %39 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %38, %39
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next24
  %40 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %40
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv23
  store double %mul27.us, double* %arrayidx29.us, align 8
  %41 = load double, double* %arrayidx21.us, align 8
  %42 = load double, double* %arrayidx25.us, align 8
  %add22.us.1 = fadd double %41, %42
  %indvars.iv.next24.1 = add nsw i64 %indvars.iv23, 2
  %arrayidx25.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next24.1
  %43 = load double, double* %arrayidx25.us.1, align 8
  %add26.us.1 = fadd double %add22.us.1, %43
  %mul27.us.1 = fmul double %add26.us.1, 3.333300e-01
  %arrayidx29.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next24
  store double %mul27.us.1, double* %arrayidx29.us.1, align 8
  %exitcond27.1 = icmp eq i64 %indvars.iv.next24.1, %wide.trip.count26.1
  br i1 %exitcond27.1, label %for.inc33.us.loopexit, label %for.inc30.us, !llvm.loop !18

for.inc.us:                                       ; preds = %for.inc.us.preheader109, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader109 ]
  %44 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %44
  %45 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %46 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %45, %46
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %47 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %47
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %48 = load double, double* %arrayidx6.us, align 8
  %49 = load double, double* %arrayidx9.us, align 8
  %add.us.1 = fadd double %48, %49
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %50 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %50
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count26.1
  br i1 %exitcond.1, label %for.inc30.us.preheader.loopexit, label %for.inc.us, !llvm.loop !19

for.inc30.us.preheader.loopexit:                  ; preds = %for.inc.us
  br label %for.inc30.us.preheader

for.inc30.us.preheader:                           ; preds = %for.inc30.us.preheader.loopexit, %for.inc.us.prol.loopexit, %middle.block64
  br i1 %lcmp.mod36, label %for.inc30.us.prol, label %for.inc30.us.prol.loopexit

for.inc30.us.prol:                                ; preds = %for.inc30.us.preheader
  %51 = load double, double* %B, align 8
  %52 = load double, double* %arrayidx21.us.prol, align 8
  %add22.us.prol = fadd double %51, %52
  %53 = load double, double* %arrayidx25.us.prol, align 8
  %add26.us.prol = fadd double %add22.us.prol, %53
  %mul27.us.prol = fmul double %add26.us.prol, 3.333300e-01
  store double %mul27.us.prol, double* %arrayidx29.us.prol, align 8
  br label %for.inc30.us.prol.loopexit

for.inc30.us.prol.loopexit:                       ; preds = %for.inc30.us.prol, %for.inc30.us.preheader
  %indvars.iv23.unr.ph = phi i64 [ 2, %for.inc30.us.prol ], [ 1, %for.inc30.us.preheader ]
  br i1 %4, label %for.inc33.us, label %for.inc30.us.preheader43

for.inc30.us.preheader43:                         ; preds = %for.inc30.us.prol.loopexit
  %54 = sub nsw i64 %5, %indvars.iv23.unr.ph
  %55 = lshr i64 %54, 1
  %56 = add nuw i64 %55, 1
  %min.iters.check = icmp ult i64 %56, 2
  br i1 %min.iters.check, label %for.inc30.us.preheader108, label %min.iters.checked

for.inc30.us.preheader108:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.inc30.us.preheader43
  %indvars.iv23.ph = phi i64 [ %indvars.iv23.unr.ph, %vector.memcheck ], [ %indvars.iv23.unr.ph, %min.iters.checked ], [ %indvars.iv23.unr.ph, %for.inc30.us.preheader43 ], [ %ind.end, %middle.block ]
  br label %for.inc30.us

min.iters.checked:                                ; preds = %for.inc30.us.preheader43
  %n.mod.vf = and i64 %56, 1
  %n.vec = sub i64 %56, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.inc30.us.preheader108, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %A, i64 %indvars.iv23.unr.ph
  %57 = shl nuw i64 %55, 1
  %58 = add i64 %indvars.iv23.unr.ph, %57
  %scevgep48 = getelementptr double, double* %arrayidx9.us.prol, i64 %58
  %scevgep51 = getelementptr double, double* %scevgep50, i64 %indvars.iv23.unr.ph
  %scevgep54 = getelementptr double, double* %scevgep53, i64 %58
  %bound0 = icmp ult double* %scevgep, %scevgep54
  %bound1 = icmp ult double* %scevgep51, %scevgep48
  %found.conflict = and i1 %bound0, %bound1
  %59 = add nuw nsw i64 %indvars.iv23.unr.ph, 2
  %60 = add i64 %59, %57
  %61 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %60, %61
  br i1 %found.conflict, label %for.inc30.us.preheader108, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %62 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv23.unr.ph, %62
  %63 = add nsw i64 %offset.idx, -1
  %64 = getelementptr inbounds double, double* %B, i64 %63
  %65 = bitcast double* %64 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %65, align 8, !alias.scope !20
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec56 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %66 = fadd <2 x double> %strided.vec, %strided.vec56
  %67 = add nuw nsw i64 %offset.idx, 1
  %68 = getelementptr inbounds double, double* %B, i64 %67
  %69 = getelementptr double, double* %68, i64 -1
  %70 = bitcast double* %69 to <4 x double>*
  %wide.vec57 = load <4 x double>, <4 x double>* %70, align 8, !alias.scope !20
  %strided.vec59 = shufflevector <4 x double> %wide.vec57, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %71 = fadd <2 x double> %66, %strided.vec59
  %72 = fmul <2 x double> %71, <double 3.333300e-01, double 3.333300e-01>
  %73 = bitcast double* %68 to <4 x double>*
  %wide.vec60 = load <4 x double>, <4 x double>* %73, align 8, !alias.scope !20
  %strided.vec62 = shufflevector <4 x double> %wide.vec60, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %74 = fadd <4 x double> %wide.vec57, %wide.vec60
  %75 = shufflevector <4 x double> %74, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %76 = fadd <2 x double> %75, %strided.vec62
  %77 = fmul <2 x double> %76, <double 3.333300e-01, double 3.333300e-01>
  %78 = getelementptr inbounds double, double* %A, i64 %67
  %79 = getelementptr double, double* %78, i64 -1
  %80 = bitcast double* %79 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %72, <2 x double> %77, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %80, align 8, !alias.scope !23, !noalias !20
  %index.next = add i64 %index, 2
  %81 = icmp eq i64 %index.next, %n.vec
  br i1 %81, label %middle.block, label %vector.body, !llvm.loop !25

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc33.us, label %for.inc30.us.preheader108

for.cond1.preheader:                              ; preds = %for.cond1.preheader, %for.cond1.preheader.preheader.new
  %storemerge20 = phi i32 [ %storemerge20.unr, %for.cond1.preheader.preheader.new ], [ %inc34.7, %for.cond1.preheader ]
  %inc34.7 = add nsw i32 %storemerge20, 8
  %exitcond34.7 = icmp eq i32 %inc34.7, %tsteps
  br i1 %exitcond34.7, label %for.end35.loopexit110.unr-lcssa, label %for.cond1.preheader

for.end35.loopexit:                               ; preds = %for.inc33.us
  br label %for.end35

for.end35.loopexit110.unr-lcssa:                  ; preds = %for.cond1.preheader
  br label %for.end35.loopexit110

for.end35.loopexit110:                            ; preds = %for.cond1.preheader.prol.loopexit, %for.end35.loopexit110.unr-lcssa
  br label %for.end35

for.end35:                                        ; preds = %for.end35.loopexit110, %for.end35.loopexit, %entry
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
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %3 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.preheader ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %for.inc

for.inc:                                          ; preds = %if.then, %for.body
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond5, label %for.end.loopexit, label %for.body

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

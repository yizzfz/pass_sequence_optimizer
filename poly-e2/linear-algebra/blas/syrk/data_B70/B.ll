; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1000 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_syrk(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv94 = phi i64 [ 0, %entry ], [ %indvars.iv.next10, %for.inc7 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv53 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next6, %for.inc ]
  %0 = mul nuw nsw i64 %indvars.iv53, %indvars.iv94
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1200
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.200000e+03
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv94, i64 %indvars.iv53
  store double %div, double* %arrayidx6, align 8
  %exitcond5 = icmp eq i64 %indvars.iv53, 999
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv53, 1
  br i1 %exitcond5, label %for.inc7, label %for.inc

for.inc7:                                         ; preds = %for.inc
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond7, label %for.cond14.preheader.preheader, label %for.cond1.preheader

for.cond14.preheader.preheader:                   ; preds = %for.inc7
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv32 = phi i64 [ %indvars.iv.next4, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.inc28

for.inc28:                                        ; preds = %for.inc28, %for.cond14.preheader
  %indvars.iv1 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next, %for.inc28 ]
  %3 = mul nuw nsw i64 %indvars.iv1, %indvars.iv32
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20 = srem i32 %5, 1000
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 1.000000e+03
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv32, i64 %indvars.iv1
  store double %div23, double* %arrayidx27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc31, label %for.inc28

for.inc31:                                        ; preds = %for.inc28
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond6, label %for.end33, label %for.cond14.preheader

for.end33:                                        ; preds = %for.inc31
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A) unnamed_addr #2 {
entry:
  %broadcast.splatinsert19 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splatinsert41 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat42 = shufflevector <2 x double> %broadcast.splatinsert41, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc32, %entry
  %indvars.iv115 = phi i64 [ 1, %entry ], [ %indvars.iv.next12, %for.inc32 ]
  %indvars.iv134 = phi i64 [ 0, %entry ], [ %3, %for.inc32 ]
  %0 = add i64 %indvars.iv134, 1
  %1 = add i64 %indvars.iv134, -3
  %2 = lshr i64 %1, 2
  %3 = add i64 %indvars.iv134, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv134, i64 0
  %4 = mul i64 %indvars.iv134, 1201
  %5 = add i64 %4, 1
  %scevgep8 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %5
  %min.iters.check25 = icmp ult i64 %3, 4
  br i1 %min.iters.check25, label %for.inc.preheader, label %min.iters.checked26

min.iters.checked26:                              ; preds = %for.cond1.preheader
  %n.vec28 = and i64 %3, -4
  %cmp.zero29 = icmp eq i64 %n.vec28, 0
  br i1 %cmp.zero29, label %for.inc.preheader, label %vector.ph30

vector.ph30:                                      ; preds = %min.iters.checked26
  %6 = and i64 %2, 1
  %lcmp.mod = icmp eq i64 %6, 0
  br i1 %lcmp.mod, label %vector.body22.prol, label %vector.body22.prol.loopexit

vector.body22.prol:                               ; preds = %vector.ph30
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv134, i64 0
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load39.prol = load <2 x double>, <2 x double>* %8, align 8
  %9 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv134, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load40.prol = load <2 x double>, <2 x double>* %10, align 8
  %11 = fmul <2 x double> %wide.load39.prol, %broadcast.splat42
  %12 = fmul <2 x double> %wide.load40.prol, %broadcast.splat42
  store <2 x double> %11, <2 x double>* %8, align 8
  store <2 x double> %12, <2 x double>* %10, align 8
  br label %vector.body22.prol.loopexit

vector.body22.prol.loopexit:                      ; preds = %vector.body22.prol, %vector.ph30
  %index31.unr.ph = phi i64 [ 4, %vector.body22.prol ], [ 0, %vector.ph30 ]
  %13 = icmp eq i64 %2, 0
  br i1 %13, label %middle.block23, label %vector.ph30.new

vector.ph30.new:                                  ; preds = %vector.body22.prol.loopexit
  br label %vector.body22

vector.body22:                                    ; preds = %vector.body22, %vector.ph30.new
  %index31 = phi i64 [ %index31.unr.ph, %vector.ph30.new ], [ %index.next32.1, %vector.body22 ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv134, i64 %index31
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %17, align 8
  %18 = fmul <2 x double> %wide.load39, %broadcast.splat42
  %19 = fmul <2 x double> %wide.load40, %broadcast.splat42
  store <2 x double> %18, <2 x double>* %15, align 8
  store <2 x double> %19, <2 x double>* %17, align 8
  %index.next32 = add i64 %index31, 4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv134, i64 %index.next32
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load39.1 = load <2 x double>, <2 x double>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load40.1 = load <2 x double>, <2 x double>* %23, align 8
  %24 = fmul <2 x double> %wide.load39.1, %broadcast.splat42
  %25 = fmul <2 x double> %wide.load40.1, %broadcast.splat42
  store <2 x double> %24, <2 x double>* %21, align 8
  store <2 x double> %25, <2 x double>* %23, align 8
  %index.next32.1 = add i64 %index31, 8
  %26 = icmp eq i64 %index.next32.1, %n.vec28
  br i1 %26, label %middle.block23, label %vector.body22, !llvm.loop !1

middle.block23:                                   ; preds = %vector.body22, %vector.body22.prol.loopexit
  %cmp.n34 = icmp eq i64 %3, %n.vec28
  br i1 %cmp.n34, label %for.cond9.preheader.preheader, label %for.inc.preheader

for.inc.preheader:                                ; preds = %middle.block23, %min.iters.checked26, %for.cond1.preheader
  %indvars.iv1.ph = phi i64 [ 0, %min.iters.checked26 ], [ 0, %for.cond1.preheader ], [ %n.vec28, %middle.block23 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %for.inc ], [ %indvars.iv1.ph, %for.inc.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv134, i64 %indvars.iv1
  %27 = load double, double* %arrayidx5, align 8
  %mul = fmul double %27, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv115
  br i1 %exitcond, label %for.cond9.preheader.preheader, label %for.inc, !llvm.loop !4

for.cond9.preheader.preheader:                    ; preds = %for.inc, %middle.block23
  %n.vec = and i64 %3, -4
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.cond9.preheader.preheader, %for.inc29
  %indvars.iv93 = phi i64 [ %29, %for.inc29 ], [ 0, %for.cond9.preheader.preheader ]
  %28 = icmp ult i64 %3, 4
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv93
  %29 = add i64 %indvars.iv93, 1
  %scevgep12 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv134, i64 %29
  %arrayidx15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv134, i64 %indvars.iv93
  br i1 %28, label %for.inc26.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader
  %30 = icmp eq i64 %n.vec, 0
  br i1 %30, label %for.inc26.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep12
  %bound1 = icmp ult double* %scevgep10, %scevgep8
  %found.conflict = and i1 %bound0, %bound1
  %bound015 = icmp ult double* %scevgep, %arrayidx15
  %bound116 = icmp ult double* %arrayidx15, %scevgep8
  %found.conflict17 = and i1 %bound015, %bound116
  %conflict.rdx = or i1 %found.conflict, %found.conflict17
  br i1 %conflict.rdx, label %for.inc26.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %31 = or i64 %index, 1
  %32 = or i64 %index, 2
  %33 = or i64 %index, 3
  %34 = load double, double* %arrayidx15, align 8, !alias.scope !6
  %35 = insertelement <2 x double> undef, double %34, i32 0
  %36 = fmul <2 x double> %35, %broadcast.splatinsert19
  %37 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> zeroinitializer
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv93
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %31, i64 %indvars.iv93
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %32, i64 %indvars.iv93
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %33, i64 %indvars.iv93
  %42 = load double, double* %38, align 8, !alias.scope !9
  %43 = load double, double* %39, align 8, !alias.scope !9
  %44 = load double, double* %40, align 8, !alias.scope !9
  %45 = load double, double* %41, align 8, !alias.scope !9
  %46 = insertelement <2 x double> undef, double %42, i32 0
  %47 = insertelement <2 x double> %46, double %43, i32 1
  %48 = insertelement <2 x double> undef, double %44, i32 0
  %49 = insertelement <2 x double> %48, double %45, i32 1
  %50 = fmul <2 x double> %37, %47
  %51 = fmul <2 x double> %37, %49
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv134, i64 %index
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !11, !noalias !13
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !11, !noalias !13
  %56 = fadd <2 x double> %wide.load, %50
  %57 = fadd <2 x double> %wide.load21, %51
  store <2 x double> %56, <2 x double>* %53, align 8, !alias.scope !11, !noalias !13
  store <2 x double> %57, <2 x double>* %55, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %58 = icmp eq i64 %index.next, %n.vec
  br i1 %58, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %59 = icmp eq i64 %3, %n.vec
  br i1 %59, label %for.inc29, label %for.inc26.preheader

for.inc26.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader
  %indvars.iv32.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader ], [ %n.vec, %middle.block ]
  %60 = sub i64 %0, %indvars.iv32.ph
  %xtraiter43 = and i64 %60, 1
  %lcmp.mod44 = icmp eq i64 %xtraiter43, 0
  br i1 %lcmp.mod44, label %for.inc26.prol.loopexit, label %for.inc26.prol

for.inc26.prol:                                   ; preds = %for.inc26.preheader
  %61 = load double, double* %arrayidx15, align 8
  %mul16.prol = fmul double %61, %alpha
  %arrayidx20.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv32.ph, i64 %indvars.iv93
  %62 = load double, double* %arrayidx20.prol, align 8
  %mul21.prol = fmul double %mul16.prol, %62
  %arrayidx25.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv134, i64 %indvars.iv32.ph
  %63 = load double, double* %arrayidx25.prol, align 8
  %add.prol = fadd double %63, %mul21.prol
  store double %add.prol, double* %arrayidx25.prol, align 8
  %indvars.iv.next4.prol = or i64 %indvars.iv32.ph, 1
  br label %for.inc26.prol.loopexit

for.inc26.prol.loopexit:                          ; preds = %for.inc26.prol, %for.inc26.preheader
  %indvars.iv32.unr.ph = phi i64 [ %indvars.iv.next4.prol, %for.inc26.prol ], [ %indvars.iv32.ph, %for.inc26.preheader ]
  %64 = icmp eq i64 %indvars.iv134, %indvars.iv32.ph
  br i1 %64, label %for.inc29, label %for.inc26.preheader.new

for.inc26.preheader.new:                          ; preds = %for.inc26.prol.loopexit
  br label %for.inc26

for.inc26:                                        ; preds = %for.inc26, %for.inc26.preheader.new
  %indvars.iv32 = phi i64 [ %indvars.iv32.unr.ph, %for.inc26.preheader.new ], [ %indvars.iv.next4.1, %for.inc26 ]
  %65 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %65, %alpha
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv32, i64 %indvars.iv93
  %66 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %66
  %arrayidx25 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv134, i64 %indvars.iv32
  %67 = load double, double* %arrayidx25, align 8
  %add = fadd double %67, %mul21
  store double %add, double* %arrayidx25, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv32, 1
  %68 = load double, double* %arrayidx15, align 8
  %mul16.1 = fmul double %68, %alpha
  %arrayidx20.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next4, i64 %indvars.iv93
  %69 = load double, double* %arrayidx20.1, align 8
  %mul21.1 = fmul double %mul16.1, %69
  %arrayidx25.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv134, i64 %indvars.iv.next4
  %70 = load double, double* %arrayidx25.1, align 8
  %add.1 = fadd double %70, %mul21.1
  store double %add.1, double* %arrayidx25.1, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv32, 2
  %exitcond8.1 = icmp eq i64 %indvars.iv.next4.1, %indvars.iv115
  br i1 %exitcond8.1, label %for.inc29, label %for.inc26, !llvm.loop !15

for.inc29:                                        ; preds = %for.inc26, %for.inc26.prol.loopexit, %middle.block
  %exitcond6 = icmp eq i64 %29, 1000
  br i1 %exitcond6, label %for.inc32, label %for.cond9.preheader

for.inc32:                                        ; preds = %for.inc29
  %cmp = icmp slt i64 %3, 1200
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv115, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.end34

for.end34:                                        ; preds = %for.inc32
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv22 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv22, 1200
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv1 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv1, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv22, i64 %indvars.iv1
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond3, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!10, !7}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}

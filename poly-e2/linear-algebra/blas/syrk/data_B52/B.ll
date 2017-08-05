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
  %arraydecay1 = bitcast i8* %call to [1200 x double]*
  %arraydecay22 = bitcast i8* %call1 to [1000 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay1, [1000 x double]* %arraydecay22)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_syrk(double %0, double %1, [1200 x double]* %arraydecay1, [1000 x double]* %arraydecay22)
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
  %indvars.iv14 = phi i64 [ 0, %entry ], [ %indvars.iv.next15, %for.inc7 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next10, %for.inc ]
  %0 = mul nuw nsw i64 %indvars.iv9, %indvars.iv14
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1200
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.200000e+03
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv9
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond13 = icmp eq i64 %indvars.iv9, 999
  br i1 %exitcond13, label %for.inc7, label %for.inc

for.inc7:                                         ; preds = %for.inc
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond2, label %for.cond14.preheader.preheader, label %for.cond1.preheader

for.cond14.preheader.preheader:                   ; preds = %for.inc7
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.inc28

for.inc28:                                        ; preds = %for.inc28, %for.cond14.preheader
  %indvars.iv = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next, %for.inc28 ]
  %3 = mul nuw nsw i64 %indvars.iv, %indvars.iv7
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20 = srem i32 %5, 1000
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 1.000000e+03
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv
  store double %div23, double* %arrayidx27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %for.inc31, label %for.inc28

for.inc31:                                        ; preds = %for.inc28
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond1, label %for.end33, label %for.cond14.preheader

for.end33:                                        ; preds = %for.inc31
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A) unnamed_addr #2 {
entry:
  %broadcast.splatinsert15 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splatinsert37 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat38 = shufflevector <2 x double> %broadcast.splatinsert37, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc32, %entry
  %indvars.iv20 = phi i64 [ 0, %entry ], [ %indvars.iv.next21, %for.inc32 ]
  %0 = add i64 %indvars.iv20, 1
  %1 = add i64 %indvars.iv20, -3
  %2 = lshr i64 %1, 2
  %3 = add i64 %indvars.iv20, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 0
  %4 = mul i64 %indvars.iv20, 1201
  %5 = add i64 %4, 1
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %5
  %6 = add i64 %indvars.iv20, 1
  %min.iters.check21 = icmp ult i64 %3, 4
  br i1 %min.iters.check21, label %for.inc.preheader, label %min.iters.checked22

min.iters.checked22:                              ; preds = %for.inc.lr.ph
  %n.vec24 = and i64 %3, -4
  %cmp.zero25 = icmp eq i64 %n.vec24, 0
  br i1 %cmp.zero25, label %for.inc.preheader, label %vector.ph26

vector.ph26:                                      ; preds = %min.iters.checked22
  %7 = and i64 %2, 1
  %lcmp.mod = icmp eq i64 %7, 0
  br i1 %lcmp.mod, label %vector.body18.prol.preheader, label %vector.body18.prol.loopexit.unr-lcssa

vector.body18.prol.preheader:                     ; preds = %vector.ph26
  br label %vector.body18.prol

vector.body18.prol:                               ; preds = %vector.body18.prol.preheader
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 0
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load35.prol = load <2 x double>, <2 x double>* %9, align 8
  %10 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load36.prol = load <2 x double>, <2 x double>* %11, align 8
  %12 = fmul <2 x double> %wide.load35.prol, %broadcast.splat38
  %13 = fmul <2 x double> %wide.load36.prol, %broadcast.splat38
  %14 = bitcast double* %8 to <2 x double>*
  store <2 x double> %12, <2 x double>* %14, align 8
  %15 = bitcast double* %10 to <2 x double>*
  store <2 x double> %13, <2 x double>* %15, align 8
  br label %vector.body18.prol.loopexit.unr-lcssa

vector.body18.prol.loopexit.unr-lcssa:            ; preds = %vector.ph26, %vector.body18.prol
  %index27.unr.ph = phi i64 [ 4, %vector.body18.prol ], [ 0, %vector.ph26 ]
  br label %vector.body18.prol.loopexit

vector.body18.prol.loopexit:                      ; preds = %vector.body18.prol.loopexit.unr-lcssa
  %16 = icmp eq i64 %2, 0
  br i1 %16, label %middle.block19, label %vector.ph26.new

vector.ph26.new:                                  ; preds = %vector.body18.prol.loopexit
  br label %vector.body18

vector.body18:                                    ; preds = %vector.body18, %vector.ph26.new
  %index27 = phi i64 [ %index27.unr.ph, %vector.ph26.new ], [ %index.next28.1, %vector.body18 ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %index27
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %18, align 8
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %20, align 8
  %21 = fmul <2 x double> %wide.load35, %broadcast.splat38
  %22 = fmul <2 x double> %wide.load36, %broadcast.splat38
  %23 = bitcast double* %17 to <2 x double>*
  store <2 x double> %21, <2 x double>* %23, align 8
  %24 = bitcast double* %19 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8
  %index.next28 = add i64 %index27, 4
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %index.next28
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load35.1 = load <2 x double>, <2 x double>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load36.1 = load <2 x double>, <2 x double>* %28, align 8
  %29 = fmul <2 x double> %wide.load35.1, %broadcast.splat38
  %30 = fmul <2 x double> %wide.load36.1, %broadcast.splat38
  %31 = bitcast double* %25 to <2 x double>*
  store <2 x double> %29, <2 x double>* %31, align 8
  %32 = bitcast double* %27 to <2 x double>*
  store <2 x double> %30, <2 x double>* %32, align 8
  %index.next28.1 = add i64 %index27, 8
  %33 = icmp eq i64 %index.next28.1, %n.vec24
  br i1 %33, label %middle.block19.unr-lcssa, label %vector.body18, !llvm.loop !1

middle.block19.unr-lcssa:                         ; preds = %vector.body18
  br label %middle.block19

middle.block19:                                   ; preds = %vector.body18.prol.loopexit, %middle.block19.unr-lcssa
  %cmp.n30 = icmp eq i64 %3, %n.vec24
  br i1 %cmp.n30, label %for.cond9.preheader.preheader, label %for.inc.preheader

for.inc.preheader:                                ; preds = %middle.block19, %min.iters.checked22, %for.inc.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked22 ], [ 0, %for.inc.lr.ph ], [ %n.vec24, %middle.block19 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ %indvars.iv.ph, %for.inc.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %indvars.iv
  %34 = load double, double* %arrayidx5, align 8
  %mul = fmul double %34, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv, %indvars.iv20
  br i1 %exitcond, label %for.cond9.preheader.preheader.loopexit, label %for.inc, !llvm.loop !4

for.cond9.preheader.preheader.loopexit:           ; preds = %for.inc
  br label %for.cond9.preheader.preheader

for.cond9.preheader.preheader:                    ; preds = %for.cond9.preheader.preheader.loopexit, %middle.block19
  %min.iters.check = icmp ult i64 %6, 4
  %n.vec = and i64 %6, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %6, %n.vec
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.cond9.preheader.preheader, %for.inc29
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.inc29 ], [ 0, %for.cond9.preheader.preheader ]
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv17
  %35 = add i64 %indvars.iv17, 1
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %35
  %arrayidx15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv17
  br i1 %min.iters.check, label %for.inc26.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader
  br i1 %cmp.zero, label %for.inc26.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  %bound011 = icmp ult double* %scevgep, %arrayidx15
  %bound112 = icmp ult double* %arrayidx15, %scevgep4
  %found.conflict13 = and i1 %bound011, %bound112
  %conflict.rdx = or i1 %found.conflict, %found.conflict13
  br i1 %conflict.rdx, label %for.inc26.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %36 = or i64 %index, 1
  %37 = or i64 %index, 2
  %38 = or i64 %index, 3
  %39 = load double, double* %arrayidx15, align 8, !alias.scope !6
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = insertelement <2 x double> undef, double %39, i32 0
  %42 = fmul <2 x double> %40, %broadcast.splatinsert15
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = fmul <2 x double> %41, %broadcast.splatinsert15
  %45 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> zeroinitializer
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv17
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %36, i64 %indvars.iv17
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %37, i64 %indvars.iv17
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %38, i64 %indvars.iv17
  %50 = load double, double* %46, align 8, !alias.scope !9
  %51 = load double, double* %47, align 8, !alias.scope !9
  %52 = load double, double* %48, align 8, !alias.scope !9
  %53 = load double, double* %49, align 8, !alias.scope !9
  %54 = insertelement <2 x double> undef, double %50, i32 0
  %55 = insertelement <2 x double> %54, double %51, i32 1
  %56 = insertelement <2 x double> undef, double %52, i32 0
  %57 = insertelement <2 x double> %56, double %53, i32 1
  %58 = fmul <2 x double> %43, %55
  %59 = fmul <2 x double> %45, %57
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %index
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !11, !noalias !13
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !11, !noalias !13
  %64 = fadd <2 x double> %wide.load, %58
  %65 = fadd <2 x double> %wide.load17, %59
  %66 = bitcast double* %60 to <2 x double>*
  store <2 x double> %64, <2 x double>* %66, align 8, !alias.scope !11, !noalias !13
  %67 = bitcast double* %62 to <2 x double>*
  store <2 x double> %65, <2 x double>* %67, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %68 = icmp eq i64 %index.next, %n.vec
  br i1 %68, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc29, label %for.inc26.preheader

for.inc26.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader
  %indvars.iv11.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader ], [ %n.vec, %middle.block ]
  %69 = sub i64 %0, %indvars.iv11.ph
  %xtraiter39 = and i64 %69, 1
  %lcmp.mod40 = icmp eq i64 %xtraiter39, 0
  br i1 %lcmp.mod40, label %for.inc26.prol.loopexit.unr-lcssa, label %for.inc26.prol.preheader

for.inc26.prol.preheader:                         ; preds = %for.inc26.preheader
  br label %for.inc26.prol

for.inc26.prol:                                   ; preds = %for.inc26.prol.preheader
  %70 = load double, double* %arrayidx15, align 8
  %mul16.prol = fmul double %70, %alpha
  %arrayidx20.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv11.ph, i64 %indvars.iv17
  %71 = load double, double* %arrayidx20.prol, align 8
  %mul21.prol = fmul double %mul16.prol, %71
  %arrayidx25.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %indvars.iv11.ph
  %72 = load double, double* %arrayidx25.prol, align 8
  %add.prol = fadd double %72, %mul21.prol
  store double %add.prol, double* %arrayidx25.prol, align 8
  %indvars.iv.next12.prol = or i64 %indvars.iv11.ph, 1
  br label %for.inc26.prol.loopexit.unr-lcssa

for.inc26.prol.loopexit.unr-lcssa:                ; preds = %for.inc26.preheader, %for.inc26.prol
  %indvars.iv11.unr.ph = phi i64 [ %indvars.iv.next12.prol, %for.inc26.prol ], [ %indvars.iv11.ph, %for.inc26.preheader ]
  br label %for.inc26.prol.loopexit

for.inc26.prol.loopexit:                          ; preds = %for.inc26.prol.loopexit.unr-lcssa
  %73 = icmp eq i64 %indvars.iv20, %indvars.iv11.ph
  br i1 %73, label %for.inc29.loopexit, label %for.inc26.preheader.new

for.inc26.preheader.new:                          ; preds = %for.inc26.prol.loopexit
  br label %for.inc26

for.inc26:                                        ; preds = %for.inc26, %for.inc26.preheader.new
  %indvars.iv11 = phi i64 [ %indvars.iv11.unr.ph, %for.inc26.preheader.new ], [ %indvars.iv.next12.1, %for.inc26 ]
  %74 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %74, %alpha
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv17
  %75 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %75
  %arrayidx25 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %indvars.iv11
  %76 = load double, double* %arrayidx25, align 8
  %add = fadd double %76, %mul21
  store double %add, double* %arrayidx25, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %77 = load double, double* %arrayidx15, align 8
  %mul16.1 = fmul double %77, %alpha
  %arrayidx20.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next12, i64 %indvars.iv17
  %78 = load double, double* %arrayidx20.1, align 8
  %mul21.1 = fmul double %mul16.1, %78
  %arrayidx25.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv20, i64 %indvars.iv.next12
  %79 = load double, double* %arrayidx25.1, align 8
  %add.1 = fadd double %79, %mul21.1
  store double %add.1, double* %arrayidx25.1, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv11, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next12, %indvars.iv20
  br i1 %exitcond16.1, label %for.inc29.loopexit.unr-lcssa, label %for.inc26, !llvm.loop !15

for.inc29.loopexit.unr-lcssa:                     ; preds = %for.inc26
  br label %for.inc29.loopexit

for.inc29.loopexit:                               ; preds = %for.inc26.prol.loopexit, %for.inc29.loopexit.unr-lcssa
  br label %for.inc29

for.inc29:                                        ; preds = %for.inc29.loopexit, %middle.block
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond1, label %for.inc32, label %for.cond9.preheader

for.inc32:                                        ; preds = %for.inc29
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next21, 1200
  br i1 %exitcond2, label %for.end34, label %for.inc.lr.ph

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
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv, %3
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
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv4, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

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

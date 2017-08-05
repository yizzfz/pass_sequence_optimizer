; ModuleID = 'B.ll'
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
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_syrk(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array([1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
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
  %indvars.iv32 = phi i64 [ 0, %entry ], [ %indvars.iv.next33, %for.inc7 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.body3 ], [ 0, %for.cond1.preheader ]
  %0 = mul nuw nsw i64 %indvars.iv27, %indvars.iv32
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1200
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.200000e+03
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv32, i64 %indvars.iv27
  store double %div, double* %arrayidx6, align 8
  %exitcond31 = icmp eq i64 %indvars.iv27, 999
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  br i1 %exitcond31, label %for.inc7, label %for.body3

for.inc7:                                         ; preds = %for.body3
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next33, 1200
  br i1 %exitcond2, label %for.cond14.preheader.preheader, label %for.cond1.preheader

for.cond14.preheader.preheader:                   ; preds = %for.inc7
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.inc31, %for.cond14.preheader.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.body17

for.body17:                                       ; preds = %for.body17, %for.cond14.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body17 ], [ 0, %for.cond14.preheader ]
  %3 = mul nuw nsw i64 %indvars.iv, %indvars.iv25
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20 = srem i32 %5, 1000
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 1.000000e+03
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv25, i64 %indvars.iv
  store double %div23, double* %arrayidx27, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.inc31, label %for.body17

for.inc31:                                        ; preds = %for.body17
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond1, label %for.end33, label %for.cond14.preheader

for.end33:                                        ; preds = %for.inc31
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A) unnamed_addr #2 {
entry:
  %broadcast.splatinsert13 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splatinsert35 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat36 = shufflevector <2 x double> %broadcast.splatinsert35, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.inc32, %entry
  %indvars.iv35 = phi i64 [ 0, %entry ], [ %indvars.iv.next36, %for.inc32 ]
  %0 = add nuw nsw i64 %indvars.iv35, 1
  %1 = add nsw i64 %indvars.iv35, -3
  %2 = lshr i64 %1, 2
  %3 = add nuw nsw i64 %indvars.iv35, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 0
  %4 = mul nuw nsw i64 %indvars.iv35, 1201
  %5 = add nuw nsw i64 %4, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %5
  %6 = add nuw nsw i64 %indvars.iv35, 1
  %min.iters.check19 = icmp ult i64 %3, 4
  br i1 %min.iters.check19, label %for.body3.preheader, label %min.iters.checked20

min.iters.checked20:                              ; preds = %for.body3.lr.ph
  %n.vec22 = and i64 %3, -4
  %cmp.zero23 = icmp eq i64 %n.vec22, 0
  br i1 %cmp.zero23, label %for.body3.preheader, label %vector.ph24

vector.ph24:                                      ; preds = %min.iters.checked20
  %7 = and i64 %2, 1
  %lcmp.mod = icmp eq i64 %7, 0
  br i1 %lcmp.mod, label %vector.body16.prol.preheader, label %vector.body16.prol.loopexit.unr-lcssa

vector.body16.prol.preheader:                     ; preds = %vector.ph24
  br label %vector.body16.prol

vector.body16.prol:                               ; preds = %vector.body16.prol.preheader
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 0
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load33.prol = load <2 x double>, <2 x double>* %9, align 8
  %10 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load34.prol = load <2 x double>, <2 x double>* %11, align 8
  %12 = fmul <2 x double> %wide.load33.prol, %broadcast.splat36
  %13 = fmul <2 x double> %wide.load34.prol, %broadcast.splat36
  %14 = bitcast double* %8 to <2 x double>*
  store <2 x double> %12, <2 x double>* %14, align 8
  %15 = bitcast double* %10 to <2 x double>*
  store <2 x double> %13, <2 x double>* %15, align 8
  br label %vector.body16.prol.loopexit.unr-lcssa

vector.body16.prol.loopexit.unr-lcssa:            ; preds = %vector.body16.prol, %vector.ph24
  %index25.unr.ph = phi i64 [ 4, %vector.body16.prol ], [ 0, %vector.ph24 ]
  br label %vector.body16.prol.loopexit

vector.body16.prol.loopexit:                      ; preds = %vector.body16.prol.loopexit.unr-lcssa
  %16 = icmp eq i64 %2, 0
  br i1 %16, label %middle.block17, label %vector.ph24.new

vector.ph24.new:                                  ; preds = %vector.body16.prol.loopexit
  br label %vector.body16

vector.body16:                                    ; preds = %vector.body16, %vector.ph24.new
  %index25 = phi i64 [ %index25.unr.ph, %vector.ph24.new ], [ %index.next26.1, %vector.body16 ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 %index25
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %18, align 8
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %20, align 8
  %21 = fmul <2 x double> %wide.load33, %broadcast.splat36
  %22 = fmul <2 x double> %wide.load34, %broadcast.splat36
  %23 = bitcast double* %17 to <2 x double>*
  store <2 x double> %21, <2 x double>* %23, align 8
  %24 = bitcast double* %19 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8
  %index.next26 = add i64 %index25, 4
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 %index.next26
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load33.1 = load <2 x double>, <2 x double>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load34.1 = load <2 x double>, <2 x double>* %28, align 8
  %29 = fmul <2 x double> %wide.load33.1, %broadcast.splat36
  %30 = fmul <2 x double> %wide.load34.1, %broadcast.splat36
  %31 = bitcast double* %25 to <2 x double>*
  store <2 x double> %29, <2 x double>* %31, align 8
  %32 = bitcast double* %27 to <2 x double>*
  store <2 x double> %30, <2 x double>* %32, align 8
  %index.next26.1 = add i64 %index25, 8
  %33 = icmp eq i64 %index.next26.1, %n.vec22
  br i1 %33, label %middle.block17.unr-lcssa, label %vector.body16, !llvm.loop !1

middle.block17.unr-lcssa:                         ; preds = %vector.body16
  br label %middle.block17

middle.block17:                                   ; preds = %middle.block17.unr-lcssa, %vector.body16.prol.loopexit
  %cmp.n28 = icmp eq i64 %3, %n.vec22
  br i1 %cmp.n28, label %for.cond9.preheader.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %middle.block17, %min.iters.checked20, %for.body3.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked20 ], [ 0, %for.body3.lr.ph ], [ %n.vec22, %middle.block17 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 %indvars.iv
  %34 = load double, double* %arrayidx5, align 8
  %mul = fmul double %34, %beta
  store double %mul, double* %arrayidx5, align 8
  %exitcond = icmp eq i64 %indvars.iv, %indvars.iv35
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond9.preheader.preheader.loopexit, label %for.body3, !llvm.loop !4

for.cond9.preheader.preheader.loopexit:           ; preds = %for.body3
  br label %for.cond9.preheader.preheader

for.cond9.preheader.preheader:                    ; preds = %for.cond9.preheader.preheader.loopexit, %middle.block17
  %min.iters.check = icmp ult i64 %6, 4
  %n.vec = and i64 %6, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %6, %n.vec
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.inc29, %for.cond9.preheader.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %for.inc29 ], [ 0, %for.cond9.preheader.preheader ]
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv32
  %35 = add nuw nsw i64 %indvars.iv32, 1
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %35
  %arrayidx15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv32
  br i1 %min.iters.check, label %for.body11.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader
  br i1 %cmp.zero, label %for.body11.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult double* %scevgep, %arrayidx15
  %bound110 = icmp ult double* %arrayidx15, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %for.body11.preheader, label %vector.ph

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
  %42 = fmul <2 x double> %40, %broadcast.splatinsert13
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = fmul <2 x double> %41, %broadcast.splatinsert13
  %45 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> zeroinitializer
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv32
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %36, i64 %indvars.iv32
  %48 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %37, i64 %indvars.iv32
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %38, i64 %indvars.iv32
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
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 %index
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !11, !noalias !13
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !11, !noalias !13
  %64 = fadd <2 x double> %wide.load, %58
  %65 = fadd <2 x double> %wide.load15, %59
  %66 = bitcast double* %60 to <2 x double>*
  store <2 x double> %64, <2 x double>* %66, align 8, !alias.scope !11, !noalias !13
  %67 = bitcast double* %62 to <2 x double>*
  store <2 x double> %65, <2 x double>* %67, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %68 = icmp eq i64 %index.next, %n.vec
  br i1 %68, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc29, label %for.body11.preheader

for.body11.preheader:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader
  %indvars.iv26.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader ], [ %n.vec, %middle.block ]
  %69 = sub i64 %0, %indvars.iv26.ph
  %xtraiter39 = and i64 %69, 1
  %lcmp.mod40 = icmp eq i64 %xtraiter39, 0
  br i1 %lcmp.mod40, label %for.body11.prol.loopexit.unr-lcssa, label %for.body11.prol.preheader

for.body11.prol.preheader:                        ; preds = %for.body11.preheader
  br label %for.body11.prol

for.body11.prol:                                  ; preds = %for.body11.prol.preheader
  %70 = load double, double* %arrayidx15, align 8
  %mul16.prol = fmul double %70, %alpha
  %arrayidx20.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv26.ph, i64 %indvars.iv32
  %71 = load double, double* %arrayidx20.prol, align 8
  %mul21.prol = fmul double %mul16.prol, %71
  %arrayidx25.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 %indvars.iv26.ph
  %72 = load double, double* %arrayidx25.prol, align 8
  %add.prol = fadd double %72, %mul21.prol
  store double %add.prol, double* %arrayidx25.prol, align 8
  %indvars.iv.next27.prol = or i64 %indvars.iv26.ph, 1
  br label %for.body11.prol.loopexit.unr-lcssa

for.body11.prol.loopexit.unr-lcssa:               ; preds = %for.body11.prol, %for.body11.preheader
  %indvars.iv26.unr.ph = phi i64 [ %indvars.iv.next27.prol, %for.body11.prol ], [ %indvars.iv26.ph, %for.body11.preheader ]
  br label %for.body11.prol.loopexit

for.body11.prol.loopexit:                         ; preds = %for.body11.prol.loopexit.unr-lcssa
  %73 = icmp eq i64 %indvars.iv35, %indvars.iv26.ph
  br i1 %73, label %for.inc29.loopexit, label %for.body11.preheader.new

for.body11.preheader.new:                         ; preds = %for.body11.prol.loopexit
  br label %for.body11

for.body11:                                       ; preds = %for.body11, %for.body11.preheader.new
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr.ph, %for.body11.preheader.new ], [ %indvars.iv.next27.1, %for.body11 ]
  %74 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %74, %alpha
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv26, i64 %indvars.iv32
  %75 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %75
  %arrayidx25 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 %indvars.iv26
  %76 = load double, double* %arrayidx25, align 8
  %add = fadd double %76, %mul21
  store double %add, double* %arrayidx25, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %77 = load double, double* %arrayidx15, align 8
  %mul16.1 = fmul double %77, %alpha
  %arrayidx20.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next27, i64 %indvars.iv32
  %78 = load double, double* %arrayidx20.1, align 8
  %mul21.1 = fmul double %mul16.1, %78
  %arrayidx25.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 %indvars.iv.next27
  %79 = load double, double* %arrayidx25.1, align 8
  %add.1 = fadd double %79, %mul21.1
  store double %add.1, double* %arrayidx25.1, align 8
  %exitcond31.1 = icmp eq i64 %indvars.iv.next27, %indvars.iv35
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  br i1 %exitcond31.1, label %for.inc29.loopexit.unr-lcssa, label %for.body11, !llvm.loop !15

for.inc29.loopexit.unr-lcssa:                     ; preds = %for.body11
  br label %for.inc29.loopexit

for.inc29.loopexit:                               ; preds = %for.inc29.loopexit.unr-lcssa, %for.body11.prol.loopexit
  br label %for.inc29

for.inc29:                                        ; preds = %for.inc29.loopexit, %middle.block
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next33, 1000
  br i1 %exitcond37, label %for.inc32, label %for.cond9.preheader

for.inc32:                                        ; preds = %for.inc29
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 1200
  br i1 %exitcond38, label %for.end34, label %for.body3.lr.ph

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv11, 1200
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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

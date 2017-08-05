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
  tail call fastcc void @print_array([1200 x double]* %arraydecay)
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
  %indvars.iv914 = phi i64 [ 0, %entry ], [ %indvars.iv.next10, %for.inc7 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv513 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next6, %for.inc ]
  %0 = mul nuw nsw i64 %indvars.iv513, %indvars.iv914
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1200
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.200000e+03
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv914, i64 %indvars.iv513
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv513, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond16, label %for.inc7, label %for.inc

for.inc7:                                         ; preds = %for.inc
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv914, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond17, label %for.cond14.preheader.preheader, label %for.cond1.preheader

for.cond14.preheader.preheader:                   ; preds = %for.inc7
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv312 = phi i64 [ %indvars.iv.next4, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.inc28

for.inc28:                                        ; preds = %for.inc28, %for.cond14.preheader
  %indvars.iv11 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next, %for.inc28 ]
  %3 = mul nuw nsw i64 %indvars.iv11, %indvars.iv312
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20 = srem i32 %5, 1000
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 1.000000e+03
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv312, i64 %indvars.iv11
  store double %div23, double* %arrayidx27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc31, label %for.inc28

for.inc31:                                        ; preds = %for.inc28
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv312, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond15, label %for.end33, label %for.cond14.preheader

for.end33:                                        ; preds = %for.inc31
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A) unnamed_addr #2 {
entry:
  %broadcast.splatinsert4 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat5 = shufflevector <2 x double> %broadcast.splatinsert4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc32, %entry
  %indvars.iv = phi i2 [ %indvars.iv.next24, %for.inc32 ], [ 1, %entry ]
  %indvars.iv1119 = phi i64 [ %indvars.iv.next12, %for.inc32 ], [ 1, %entry ]
  %indvars.iv1318 = phi i64 [ %2, %for.inc32 ], [ 0, %entry ]
  %0 = add nsw i64 %indvars.iv1318, -3
  %1 = zext i2 %indvars.iv to i64
  %2 = add nuw nsw i64 %indvars.iv1318, 1
  %xtraiter = and i64 %2, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.cond1.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  %indvars.iv15.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.prol ], [ %xtraiter, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %indvars.iv15.prol
  %3 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %3, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv15.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !1

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.cond1.preheader
  %indvars.iv15.unr = phi i64 [ 0, %for.cond1.preheader ], [ %1, %for.inc.prol.loopexit.loopexit ]
  %4 = icmp ult i64 %indvars.iv1318, 3
  br i1 %4, label %for.cond9.preheader.preheader, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  %5 = sub i64 %0, %indvars.iv15.unr
  %6 = lshr i64 %5, 2
  %7 = add nuw nsw i64 %6, 1
  %min.iters.check = icmp ult i64 %7, 2
  br i1 %min.iters.check, label %for.inc.preheader6, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc.preheader
  %n.mod.vf = and i64 %7, 1
  %n.vec = sub nsw i64 %7, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %8 = or i64 %indvars.iv15.unr, 4
  %9 = shl nuw i64 %6, 2
  %10 = add i64 %8, %9
  %11 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %10, %11
  br i1 %cmp.zero, label %for.inc.preheader6, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %12 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv15.unr, %12
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %offset.idx
  %14 = bitcast double* %13 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %14, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec1 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec2 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec3 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %15 = fmul <2 x double> %strided.vec, %broadcast.splat5
  %16 = fmul <2 x double> %strided.vec1, %broadcast.splat5
  %17 = fmul <2 x double> %strided.vec2, %broadcast.splat5
  %18 = add nsw i64 %offset.idx, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %18
  %20 = fmul <2 x double> %strided.vec3, %broadcast.splat5
  %21 = getelementptr double, double* %19, i64 -3
  %22 = bitcast double* %21 to <8 x double>*
  %23 = shufflevector <2 x double> %15, <2 x double> %16, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %24 = shufflevector <2 x double> %17, <2 x double> %20, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %23, <4 x double> %24, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %22, align 8
  %index.next = add i64 %index, 2
  %25 = icmp eq i64 %index.next, %n.vec
  br i1 %25, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond9.preheader.preheader, label %for.inc.preheader6

for.inc.preheader6:                               ; preds = %middle.block, %min.iters.checked, %for.inc.preheader
  %indvars.iv15.ph = phi i64 [ %indvars.iv15.unr, %min.iters.checked ], [ %indvars.iv15.unr, %for.inc.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader6, %for.inc
  %indvars.iv15 = phi i64 [ %indvars.iv.next.3, %for.inc ], [ %indvars.iv15.ph, %for.inc.preheader6 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %indvars.iv15
  %26 = load double, double* %arrayidx5, align 8
  %mul = fmul double %26, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv15, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %indvars.iv.next
  %27 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %27, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv15, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %indvars.iv.next.1
  %28 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %28, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv15, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %indvars.iv.next.2
  %29 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %29, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv15, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1119
  br i1 %exitcond.3, label %for.cond9.preheader.preheader.loopexit, label %for.inc, !llvm.loop !6

for.cond9.preheader.preheader.loopexit:           ; preds = %for.inc
  br label %for.cond9.preheader.preheader

for.cond9.preheader.preheader:                    ; preds = %for.cond9.preheader.preheader.loopexit, %middle.block, %for.inc.prol.loopexit
  %30 = and i64 %indvars.iv1318, 1
  %arrayidx25.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 0
  %31 = icmp eq i64 %30, 0
  %32 = icmp eq i64 %indvars.iv1318, 0
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.cond9.preheader.preheader, %for.inc29
  %indvars.iv917 = phi i64 [ %indvars.iv.next10, %for.inc29 ], [ 0, %for.cond9.preheader.preheader ]
  %arrayidx15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1318, i64 %indvars.iv917
  br i1 %31, label %for.inc26.prol, label %for.inc26.prol.loopexit

for.inc26.prol:                                   ; preds = %for.cond9.preheader
  %33 = load double, double* %arrayidx15, align 8
  %mul16.prol = fmul double %33, %alpha
  %arrayidx20.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv917
  %34 = load double, double* %arrayidx20.prol, align 8
  %mul21.prol = fmul double %mul16.prol, %34
  %35 = load double, double* %arrayidx25.prol, align 8
  %add.prol = fadd double %35, %mul21.prol
  store double %add.prol, double* %arrayidx25.prol, align 8
  br label %for.inc26.prol.loopexit

for.inc26.prol.loopexit:                          ; preds = %for.inc26.prol, %for.cond9.preheader
  %indvars.iv316.unr.ph = phi i64 [ 1, %for.inc26.prol ], [ 0, %for.cond9.preheader ]
  br i1 %32, label %for.inc29, label %for.inc26.preheader

for.inc26.preheader:                              ; preds = %for.inc26.prol.loopexit
  br label %for.inc26

for.inc26:                                        ; preds = %for.inc26.preheader, %for.inc26
  %indvars.iv316 = phi i64 [ %indvars.iv.next4.1, %for.inc26 ], [ %indvars.iv316.unr.ph, %for.inc26.preheader ]
  %36 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %36, %alpha
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv316, i64 %indvars.iv917
  %37 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %37
  %arrayidx25 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %indvars.iv316
  %38 = load double, double* %arrayidx25, align 8
  %add = fadd double %38, %mul21
  store double %add, double* %arrayidx25, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv316, 1
  %39 = load double, double* %arrayidx15, align 8
  %mul16.1 = fmul double %39, %alpha
  %arrayidx20.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next4, i64 %indvars.iv917
  %40 = load double, double* %arrayidx20.1, align 8
  %mul21.1 = fmul double %mul16.1, %40
  %arrayidx25.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %indvars.iv.next4
  %41 = load double, double* %arrayidx25.1, align 8
  %add.1 = fadd double %41, %mul21.1
  store double %add.1, double* %arrayidx25.1, align 8
  %indvars.iv.next4.1 = add nuw nsw i64 %indvars.iv316, 2
  %exitcond8.1 = icmp eq i64 %indvars.iv.next4.1, %indvars.iv1119
  br i1 %exitcond8.1, label %for.inc29.loopexit, label %for.inc26

for.inc29.loopexit:                               ; preds = %for.inc26
  br label %for.inc29

for.inc29:                                        ; preds = %for.inc29.loopexit, %for.inc26.prol.loopexit
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv917, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond20, label %for.inc32, label %for.cond9.preheader

for.inc32:                                        ; preds = %for.inc29
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1119, 1
  %exitcond21 = icmp eq i64 %2, 1200
  %indvars.iv.next24 = add i2 %indvars.iv, 1
  br i1 %exitcond21, label %for.end34, label %for.cond1.preheader

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
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv26, 1200
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv5 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv5, %3
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
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv26, i64 %indvars.iv5
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond7, label %for.end12, label %for.cond2.preheader

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}

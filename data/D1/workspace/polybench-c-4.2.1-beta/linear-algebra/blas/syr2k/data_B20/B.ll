; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_syr2k(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call void @print_array([1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double*, double*, [1200 x double]*, [1000 x double]*, [1000 x double]*) #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader35

.preheader35:                                     ; preds = %20, %5
  %indvars.iv7 = phi i64 [ 0, %5 ], [ %indvars.iv.next8, %20 ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader35
  %indvars.iv4 = phi i64 [ 0, %.preheader35 ], [ %indvars.iv.next5, %6 ]
  %7 = mul nuw nsw i64 %indvars.iv4, %indvars.iv7
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv7, i64 %indvars.iv4
  store double %12, double* %13, align 8
  %14 = add nuw nsw i64 %7, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv7, i64 %indvars.iv4
  store double %18, double* %19, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond6, label %20, label %6

; <label>:20:                                     ; preds = %6
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond9, label %.preheader.preheader, label %.preheader35

.preheader.preheader:                             ; preds = %20
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %29
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %29 ], [ 0, %.preheader.preheader ]
  br label %21

; <label>:21:                                     ; preds = %21, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %21 ]
  %22 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %23 = add nuw nsw i64 %22, 3
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 1200
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.000000e+03
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %29, label %21

; <label>:29:                                     ; preds = %21
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %30, label %.preheader

; <label>:30:                                     ; preds = %29
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) #2 {
  %broadcast.splatinsert64 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat65 = shufflevector <2 x double> %broadcast.splatinsert64, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert43 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat44 = shufflevector <2 x double> %broadcast.splatinsert43, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph:                                           ; preds = %5, %.us-lcssa.us
  %indvars.iv67 = phi i2 [ 1, %5 ], [ %indvars.iv.next68, %.us-lcssa.us ]
  %indvars.iv15 = phi i64 [ 0, %5 ], [ %indvars.iv.next16, %.us-lcssa.us ]
  %indvars.iv13 = phi i64 [ 1, %5 ], [ %indvars.iv.next14, %.us-lcssa.us ]
  %6 = zext i2 %indvars.iv67 to i64
  %7 = add nuw nsw i64 %6, 4294967295
  %8 = and i64 %7, 4294967295
  %9 = add nuw nsw i64 %8, 1
  %10 = add nsw i64 %indvars.iv15, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 0
  %11 = mul nuw nsw i64 %indvars.iv15, 1201
  %12 = add nuw nsw i64 %11, 1
  %scevgep19 = getelementptr [1200 x double], [1200 x double]* %2, i64 0, i64 %12
  %13 = add nuw nsw i64 %indvars.iv15, 1
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %14 = trunc i64 %indvars.iv.next16 to i32
  %xtraiter = and i32 %14, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv.prol
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %1
  store double %17, double* %15, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %9, %.prol.loopexit.loopexit ]
  %18 = icmp ult i64 %indvars.iv15, 3
  br i1 %18, label %.preheader.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %19 = sub i64 %10, %indvars.iv.unr
  %20 = lshr i64 %19, 2
  %21 = add nuw nsw i64 %20, 1
  %min.iters.check48 = icmp ult i64 %21, 2
  br i1 %min.iters.check48, label %.lr.ph.new.preheader66, label %min.iters.checked49

min.iters.checked49:                              ; preds = %.lr.ph.new.preheader
  %n.mod.vf50 = and i64 %21, 1
  %n.vec51 = sub nsw i64 %21, %n.mod.vf50
  %cmp.zero52 = icmp eq i64 %n.vec51, 0
  %22 = add nsw i64 %indvars.iv.unr, 4
  %23 = shl nuw i64 %20, 2
  %24 = add i64 %22, %23
  %25 = shl nuw nsw i64 %n.mod.vf50, 2
  %ind.end = sub i64 %24, %25
  br i1 %cmp.zero52, label %.lr.ph.new.preheader66, label %vector.ph53

vector.ph53:                                      ; preds = %min.iters.checked49
  br label %vector.body45

vector.body45:                                    ; preds = %vector.body45, %vector.ph53
  %index54 = phi i64 [ 0, %vector.ph53 ], [ %index.next55, %vector.body45 ]
  %26 = shl i64 %index54, 2
  %27 = add i64 %indvars.iv.unr, %26
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %27
  %29 = bitcast double* %28 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %29, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec61 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec62 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec63 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %30 = fmul <2 x double> %strided.vec, %broadcast.splat65
  %31 = fmul <2 x double> %strided.vec61, %broadcast.splat65
  %32 = fmul <2 x double> %strided.vec62, %broadcast.splat65
  %33 = add nsw i64 %27, 3
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %33
  %35 = fmul <2 x double> %strided.vec63, %broadcast.splat65
  %36 = getelementptr double, double* %34, i64 -3
  %37 = bitcast double* %36 to <8 x double>*
  %38 = shufflevector <2 x double> %30, <2 x double> %31, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %39 = shufflevector <2 x double> %32, <2 x double> %35, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %38, <4 x double> %39, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %37, align 8
  %index.next55 = add i64 %index54, 2
  %40 = icmp eq i64 %index.next55, %n.vec51
  br i1 %40, label %middle.block46, label %vector.body45, !llvm.loop !3

middle.block46:                                   ; preds = %vector.body45
  %cmp.n57 = icmp eq i64 %n.mod.vf50, 0
  br i1 %cmp.n57, label %.preheader.preheader, label %.lr.ph.new.preheader66

.lr.ph.new.preheader66:                           ; preds = %middle.block46, %min.iters.checked49, %.lr.ph.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked49 ], [ %indvars.iv.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block46 ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader66, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.ph, %.lr.ph.new.preheader66 ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, %1
  store double %43, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv.next
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %1
  store double %46, double* %44, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv.next.1
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %1
  store double %49, double* %47, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv.next.2
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %1
  store double %52, double* %50, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv13
  br i1 %exitcond.3, label %.preheader.preheader.loopexit, label %.lr.ph.new, !llvm.loop !6

.preheader.preheader.loopexit:                    ; preds = %.lr.ph.new
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %middle.block46, %.prol.loopexit
  %min.iters.check = icmp ult i64 %13, 2
  %n.vec = and i64 %13, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %13, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge ], [ 0, %.preheader.preheader ]
  %scevgep21 = getelementptr [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv9
  %53 = add nuw nsw i64 %indvars.iv9, 1
  %scevgep23 = getelementptr [1000 x double], [1000 x double]* %3, i64 %indvars.iv15, i64 %53
  %scevgep25 = getelementptr [1000 x double], [1000 x double]* %4, i64 0, i64 %indvars.iv9
  %scevgep27 = getelementptr [1000 x double], [1000 x double]* %4, i64 %indvars.iv15, i64 %53
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv9
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv15, i64 %indvars.iv9
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %55
  %bound1 = icmp ult double* %55, %scevgep19
  %found.conflict = and i1 %bound0, %bound1
  %bound030 = icmp ult double* %scevgep, %scevgep23
  %bound131 = icmp ult double* %scevgep21, %scevgep19
  %found.conflict32 = and i1 %bound030, %bound131
  %conflict.rdx = or i1 %found.conflict, %found.conflict32
  %bound033 = icmp ult double* %scevgep, %scevgep27
  %bound134 = icmp ult double* %scevgep25, %scevgep19
  %found.conflict35 = and i1 %bound033, %bound134
  %conflict.rdx36 = or i1 %conflict.rdx, %found.conflict35
  %bound039 = icmp ult double* %scevgep, %54
  %bound140 = icmp ult double* %54, %scevgep19
  %found.conflict41 = and i1 %bound039, %bound140
  %conflict.rdx42 = or i1 %conflict.rdx36, %found.conflict41
  br i1 %conflict.rdx42, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %56 = load double, double* %54, align 8, !alias.scope !8
  %57 = insertelement <2 x double> undef, double %56, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  %59 = load double, double* %55, align 8, !alias.scope !11
  %60 = insertelement <2 x double> undef, double %59, i32 0
  %61 = shufflevector <2 x double> %60, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %62 = or i64 %index, 1
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %index, i64 %indvars.iv9
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %62, i64 %indvars.iv9
  %65 = load double, double* %63, align 8, !alias.scope !13
  %66 = load double, double* %64, align 8, !alias.scope !13
  %67 = insertelement <2 x double> undef, double %65, i32 0
  %68 = insertelement <2 x double> %67, double %66, i32 1
  %69 = fmul <2 x double> %68, %broadcast.splat44
  %70 = fmul <2 x double> %69, %58
  %71 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %index, i64 %indvars.iv9
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %62, i64 %indvars.iv9
  %73 = load double, double* %71, align 8, !alias.scope !15
  %74 = load double, double* %72, align 8, !alias.scope !15
  %75 = insertelement <2 x double> undef, double %73, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = fmul <2 x double> %76, %broadcast.splat44
  %78 = fmul <2 x double> %77, %61
  %79 = fadd <2 x double> %70, %78
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %index
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !17, !noalias !19
  %82 = fadd <2 x double> %wide.load, %79
  %83 = bitcast double* %80 to <2 x double>*
  store <2 x double> %82, <2 x double>* %83, align 8, !alias.scope !17, !noalias !19
  %index.next = add i64 %index, 2
  %84 = icmp eq i64 %index.next, %n.vec
  br i1 %84, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader
  %indvars.iv4.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %scalar.ph ], [ %indvars.iv4.ph, %scalar.ph.preheader ]
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv4, i64 %indvars.iv9
  %86 = load double, double* %85, align 8
  %87 = fmul double %86, %0
  %88 = load double, double* %54, align 8
  %89 = fmul double %87, %88
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv4, i64 %indvars.iv9
  %91 = load double, double* %90, align 8
  %92 = fmul double %91, %0
  %93 = load double, double* %55, align 8
  %94 = fmul double %92, %93
  %95 = fadd double %89, %94
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv4
  %97 = load double, double* %96, align 8
  %98 = fadd double %97, %95
  store double %98, double* %96, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, %indvars.iv13
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !21

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond11, label %.us-lcssa.us, label %.preheader

.us-lcssa.us:                                     ; preds = %._crit_edge
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  %indvars.iv.next68 = add i2 %indvars.iv67, 1
  br i1 %exitcond17, label %99, label %.lr.ph

; <label>:99:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %19, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %19 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %7

; <label>:19:                                     ; preds = %14
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!16}
!16 = distinct !{!16, !10}
!17 = !{!18}
!18 = distinct !{!18, !10}
!19 = !{!12, !14, !16, !9}
!20 = distinct !{!20, !4, !5}
!21 = distinct !{!21, !4, !5}

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
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call void @kernel_syr2k(double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call void @print_array([1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader4

.preheader4:                                      ; preds = %20, %5
  %indvars.iv15 = phi i64 [ 0, %5 ], [ %indvars.iv.next16, %20 ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader4
  %indvars.iv12 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next13, %6 ]
  %7 = mul nuw nsw i64 %indvars.iv12, %indvars.iv15
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv15, i64 %indvars.iv12
  store double %12, double* %13, align 8
  %14 = add nuw nsw i64 %7, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv12
  store double %18, double* %19, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1000
  br i1 %exitcond14, label %20, label %6

; <label>:20:                                     ; preds = %6
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond17, label %.preheader.preheader, label %.preheader4

.preheader.preheader:                             ; preds = %20
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %29
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %29 ], [ 0, %.preheader.preheader ]
  br label %21

; <label>:21:                                     ; preds = %21, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %21 ]
  %22 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %23 = add nuw nsw i64 %22, 3
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 1200
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.000000e+03
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %29, label %21

; <label>:29:                                     ; preds = %21
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond11, label %30, label %.preheader

; <label>:30:                                     ; preds = %29
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) #2 {
  %broadcast.splatinsert26 = insertelement <2 x double> undef, double %0, i32 0
  %broadcast.splat27 = shufflevector <2 x double> %broadcast.splatinsert26, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert47 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat48 = shufflevector <2 x double> %broadcast.splatinsert47, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph:                                           ; preds = %5, %.us-lcssa.us
  %indvars.iv29 = phi i64 [ 1, %5 ], [ %indvars.iv.next30, %.us-lcssa.us ]
  %indvars.iv26 = phi i64 [ 0, %5 ], [ %11, %.us-lcssa.us ]
  %indvars.iv24 = phi i64 [ 1, %5 ], [ %indvars.iv.next25, %.us-lcssa.us ]
  %6 = add nsw i64 %indvars.iv26, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv26, i64 0
  %7 = mul nuw nsw i64 %indvars.iv26, 1201
  %8 = add nuw nsw i64 %7, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %2, i64 0, i64 %8
  %9 = add nuw nsw i64 %indvars.iv26, 1
  %10 = and i64 %indvars.iv29, 3
  %11 = add nuw nsw i64 %indvars.iv26, 1
  %xtraiter = and i64 %11, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv.prol
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %1
  store double %14, double* %12, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %10, %.prol.loopexit.loopexit ]
  %15 = icmp ult i64 %indvars.iv26, 3
  br i1 %15, label %.preheader.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %16 = sub i64 %6, %indvars.iv.unr
  %17 = lshr i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check31 = icmp ult i64 %18, 2
  br i1 %min.iters.check31, label %.lr.ph.new.preheader49, label %min.iters.checked32

min.iters.checked32:                              ; preds = %.lr.ph.new.preheader
  %n.mod.vf33 = and i64 %18, 1
  %n.vec34 = sub nsw i64 %18, %n.mod.vf33
  %cmp.zero35 = icmp eq i64 %n.vec34, 0
  %19 = or i64 %indvars.iv.unr, 4
  %20 = shl nuw i64 %17, 2
  %21 = add i64 %19, %20
  %22 = shl nuw nsw i64 %n.mod.vf33, 2
  %ind.end = sub i64 %21, %22
  br i1 %cmp.zero35, label %.lr.ph.new.preheader49, label %vector.ph36

vector.ph36:                                      ; preds = %min.iters.checked32
  br label %vector.body28

vector.body28:                                    ; preds = %vector.body28, %vector.ph36
  %index37 = phi i64 [ 0, %vector.ph36 ], [ %index.next38, %vector.body28 ]
  %23 = shl i64 %index37, 2
  %offset.idx = or i64 %indvars.iv.unr, %23
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv26, i64 %offset.idx
  %25 = bitcast double* %24 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %25, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec44 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec45 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec46 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %26 = fmul <2 x double> %strided.vec, %broadcast.splat48
  %27 = fmul <2 x double> %strided.vec44, %broadcast.splat48
  %28 = fmul <2 x double> %strided.vec45, %broadcast.splat48
  %29 = add nsw i64 %offset.idx, 3
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv26, i64 %29
  %31 = fmul <2 x double> %strided.vec46, %broadcast.splat48
  %32 = getelementptr double, double* %30, i64 -3
  %33 = bitcast double* %32 to <8 x double>*
  %34 = shufflevector <2 x double> %26, <2 x double> %27, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %35 = shufflevector <2 x double> %28, <2 x double> %31, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %34, <4 x double> %35, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %33, align 8
  %index.next38 = add i64 %index37, 2
  %36 = icmp eq i64 %index.next38, %n.vec34
  br i1 %36, label %middle.block29, label %vector.body28, !llvm.loop !3

middle.block29:                                   ; preds = %vector.body28
  %cmp.n40 = icmp eq i64 %n.mod.vf33, 0
  br i1 %cmp.n40, label %.preheader.preheader, label %.lr.ph.new.preheader49

.lr.ph.new.preheader49:                           ; preds = %middle.block29, %min.iters.checked32, %.lr.ph.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked32 ], [ %indvars.iv.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block29 ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader49, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.ph, %.lr.ph.new.preheader49 ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %1
  store double %39, double* %37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv.next
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %1
  store double %42, double* %40, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv.next.1
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %1
  store double %45, double* %43, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv.next.2
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %1
  store double %48, double* %46, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv24
  br i1 %exitcond.3, label %.preheader.preheader.loopexit, label %.lr.ph.new, !llvm.loop !6

.preheader.preheader.loopexit:                    ; preds = %.lr.ph.new
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.loopexit, %middle.block29, %.prol.loopexit
  %min.iters.check = icmp ult i64 %9, 2
  %n.vec = and i64 %9, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %9, %n.vec
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge ], [ 0, %.preheader.preheader ]
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv20
  %49 = add nuw nsw i64 %indvars.iv20, 1
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %49
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %4, i64 0, i64 %indvars.iv20
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %4, i64 %indvars.iv26, i64 %49
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv20
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv20
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %51
  %bound1 = icmp ult double* %51, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult double* %scevgep, %scevgep6
  %bound114 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  %bound016 = icmp ult double* %scevgep, %scevgep10
  %bound117 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx19 = or i1 %conflict.rdx, %found.conflict18
  %bound022 = icmp ult double* %scevgep, %50
  %bound123 = icmp ult double* %50, %scevgep2
  %found.conflict24 = and i1 %bound022, %bound123
  %conflict.rdx25 = or i1 %conflict.rdx19, %found.conflict24
  br i1 %conflict.rdx25, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %52 = load double, double* %50, align 8, !alias.scope !8
  %53 = insertelement <2 x double> undef, double %52, i32 0
  %54 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  %55 = load double, double* %51, align 8, !alias.scope !11
  %56 = insertelement <2 x double> undef, double %55, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %58 = or i64 %index, 1
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %index, i64 %indvars.iv20
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %58, i64 %indvars.iv20
  %61 = load double, double* %59, align 8, !alias.scope !13
  %62 = load double, double* %60, align 8, !alias.scope !13
  %63 = insertelement <2 x double> undef, double %61, i32 0
  %64 = insertelement <2 x double> %63, double %62, i32 1
  %65 = fmul <2 x double> %64, %broadcast.splat27
  %66 = fmul <2 x double> %65, %54
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %index, i64 %indvars.iv20
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %58, i64 %indvars.iv20
  %69 = load double, double* %67, align 8, !alias.scope !15
  %70 = load double, double* %68, align 8, !alias.scope !15
  %71 = insertelement <2 x double> undef, double %69, i32 0
  %72 = insertelement <2 x double> %71, double %70, i32 1
  %73 = fmul <2 x double> %72, %broadcast.splat27
  %74 = fmul <2 x double> %73, %57
  %75 = fadd <2 x double> %66, %74
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv26, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !17, !noalias !19
  %78 = fadd <2 x double> %wide.load, %75
  %79 = bitcast double* %76 to <2 x double>*
  store <2 x double> %78, <2 x double>* %79, align 8, !alias.scope !17, !noalias !19
  %index.next = add i64 %index, 2
  %80 = icmp eq i64 %index.next, %n.vec
  br i1 %80, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader
  %indvars.iv14.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %scalar.ph ], [ %indvars.iv14.ph, %scalar.ph.preheader ]
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv20
  %82 = load double, double* %81, align 8
  %83 = fmul double %82, %0
  %84 = load double, double* %50, align 8
  %85 = fmul double %83, %84
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv20
  %87 = load double, double* %86, align 8
  %88 = fmul double %87, %0
  %89 = load double, double* %51, align 8
  %90 = fmul double %88, %89
  %91 = fadd double %85, %90
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv14
  %93 = load double, double* %92, align 8
  %94 = fadd double %93, %91
  store double %94, double* %92, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next15, %indvars.iv24
  br i1 %exitcond19, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !21

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond22, label %.us-lcssa.us, label %.preheader

.us-lcssa.us:                                     ; preds = %._crit_edge
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond28 = icmp eq i64 %11, 1200
  %indvars.iv.next30 = add nuw nsw i64 %10, 1
  br i1 %exitcond28, label %95, label %.lr.ph

; <label>:95:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %19, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %19 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 1200
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
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %7

; <label>:19:                                     ; preds = %14
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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

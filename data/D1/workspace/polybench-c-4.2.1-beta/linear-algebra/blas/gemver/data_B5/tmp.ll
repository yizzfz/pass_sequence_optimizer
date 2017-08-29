; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %14 = bitcast i8* %5 to [2000 x double]*
  %15 = bitcast i8* %6 to double*
  %16 = bitcast i8* %7 to double*
  %17 = bitcast i8* %8 to double*
  %18 = bitcast i8* %9 to double*
  %19 = bitcast i8* %10 to double*
  %20 = bitcast i8* %11 to double*
  %21 = bitcast i8* %12 to double*
  %22 = bitcast i8* %13 to double*
  call void @init_array(i32 2000, double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  call void @kernel_gemver(i32 2000, double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %30

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %30

; <label>:29:                                     ; preds = %26
  call void @print_array(i32 2000, double* %19)
  br label %30

; <label>:30:                                     ; preds = %26, %29, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  call void @free(i8* %10) #4
  call void @free(i8* %11) #4
  call void @free(i8* %12) #4
  call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double*, double*, [2000 x double]*, double*, double*, double*, double*, double*, double*, double*, double*) #2 {
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  %13 = sitofp i32 %0 to double
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.lr.ph34.split.us.preheader, label %._crit_edge

.lr.ph34.split.us.preheader:                      ; preds = %12
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %15 = icmp eq i32 %0, 1
  %wide.trip.count37 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %16 = fdiv double 0.000000e+00, %13
  br label %.lr.ph34.split.us

.lr.ph34.split.us:                                ; preds = %.lr.ph34.split.us.preheader, %..loopexit_crit_edge.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %..loopexit_crit_edge.us ], [ 0, %.lr.ph34.split.us.preheader ]
  %17 = trunc i64 %indvars.iv35 to i32
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds double, double* %4, i64 %indvars.iv35
  store double %18, double* %19, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %20 = trunc i64 %indvars.iv.next36 to i32
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %13
  %23 = fmul double %22, 5.000000e-01
  %24 = getelementptr inbounds double, double* %6, i64 %indvars.iv35
  store double %23, double* %24, align 8
  %25 = fmul double %22, 2.500000e-01
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv35
  store double %25, double* %26, align 8
  %27 = fdiv double %22, 6.000000e+00
  %28 = getelementptr inbounds double, double* %7, i64 %indvars.iv35
  store double %27, double* %28, align 8
  %29 = fmul double %22, 1.250000e-01
  %30 = getelementptr inbounds double, double* %10, i64 %indvars.iv35
  store double %29, double* %30, align 8
  %31 = fdiv double %22, 9.000000e+00
  %32 = getelementptr inbounds double, double* %11, i64 %indvars.iv35
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds double, double* %9, i64 %indvars.iv35
  store double 0.000000e+00, double* %33, align 8
  %34 = getelementptr inbounds double, double* %8, i64 %indvars.iv35
  store double 0.000000e+00, double* %34, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph34.split.us
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv35, i64 0
  store double %16, double* %35, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph34.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph34.split.us ]
  br i1 %15, label %..loopexit_crit_edge.us, label %.lr.ph34.split.us.new.preheader

.lr.ph34.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph34.split.us.new

.lr.ph34.split.us.new:                            ; preds = %.lr.ph34.split.us.new.preheader, %.lr.ph34.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph34.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph34.split.us.new.preheader ]
  %36 = mul nuw nsw i64 %indvars.iv, %indvars.iv35
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, %0
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %13
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv35, i64 %indvars.iv
  store double %40, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv35
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %0
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %13
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv35, i64 %indvars.iv.next
  store double %46, double* %47, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph34.split.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph34.split.us.new
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %..loopexit_crit_edge.us.loopexit, %.prol.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph34.split.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %12
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemver(i32, double, double, [2000 x double]*, double*, double*, double*, double*, double*, double*, double*, double*) #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader11.preheader.us.preheader, label %.preheader7._crit_edge

.preheader11.preheader.us.preheader:              ; preds = %12
  %xtraiter95 = and i32 %0, 1
  %lcmp.mod96 = icmp eq i32 %xtraiter95, 0
  %14 = icmp eq i32 %0, 1
  %wide.trip.count99 = zext i32 %0 to i64
  %wide.trip.count93.1 = zext i32 %0 to i64
  %15 = add nsw i64 %wide.trip.count93.1, -2
  %16 = add nsw i64 %wide.trip.count93.1, -2
  %scevgep110 = getelementptr double, double* %5, i64 2
  %scevgep115 = getelementptr double, double* %7, i64 2
  br label %.preheader11.preheader.us

.preheader11.preheader.us:                        ; preds = %.preheader11.preheader.us.preheader, %.preheader11._crit_edge.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %.preheader11._crit_edge.us ], [ 0, %.preheader11.preheader.us.preheader ]
  %scevgep105 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv97, i64 2
  %17 = getelementptr inbounds double, double* %4, i64 %indvars.iv97
  %18 = getelementptr inbounds double, double* %6, i64 %indvars.iv97
  br i1 %lcmp.mod96, label %.preheader11.us.prol.loopexit, label %.preheader11.us.prol

.preheader11.us.prol:                             ; preds = %.preheader11.preheader.us
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv97, i64 0
  %20 = load double, double* %19, align 8
  %21 = load double, double* %17, align 8
  %22 = load double, double* %5, align 8
  %23 = fmul double %21, %22
  %24 = fadd double %20, %23
  %25 = load double, double* %18, align 8
  %26 = load double, double* %7, align 8
  %27 = fmul double %25, %26
  %28 = fadd double %24, %27
  store double %28, double* %19, align 8
  br label %.preheader11.us.prol.loopexit

.preheader11.us.prol.loopexit:                    ; preds = %.preheader11.us.prol, %.preheader11.preheader.us
  %indvars.iv91.unr.ph = phi i64 [ 1, %.preheader11.us.prol ], [ 0, %.preheader11.preheader.us ]
  br i1 %14, label %.preheader11._crit_edge.us, label %.preheader11.us.preheader

.preheader11.us.preheader:                        ; preds = %.preheader11.us.prol.loopexit
  %29 = sub nsw i64 %15, %indvars.iv91.unr.ph
  %30 = lshr i64 %29, 1
  %31 = add nuw i64 %30, 1
  %min.iters.check = icmp ult i64 %31, 2
  br i1 %min.iters.check, label %.preheader11.us.preheader183, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader11.us.preheader
  %n.mod.vf = and i64 %31, 1
  %n.vec = sub i64 %31, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader11.us.preheader183, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep103 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv97, i64 %indvars.iv91.unr.ph
  %32 = sub nsw i64 %16, %indvars.iv91.unr.ph
  %33 = and i64 %32, -2
  %34 = or i64 %indvars.iv91.unr.ph, %33
  %scevgep106 = getelementptr double, double* %scevgep105, i64 %34
  %scevgep108 = getelementptr double, double* %5, i64 %indvars.iv91.unr.ph
  %scevgep111 = getelementptr double, double* %scevgep110, i64 %34
  %scevgep113 = getelementptr double, double* %7, i64 %indvars.iv91.unr.ph
  %scevgep116 = getelementptr double, double* %scevgep115, i64 %34
  %bound0 = icmp ult double* %scevgep103, %17
  %bound1 = icmp ult double* %17, %scevgep106
  %found.conflict = and i1 %bound0, %bound1
  %bound0119 = icmp ult double* %scevgep103, %scevgep111
  %bound1120 = icmp ult double* %scevgep108, %scevgep106
  %found.conflict121 = and i1 %bound0119, %bound1120
  %conflict.rdx = or i1 %found.conflict, %found.conflict121
  %bound0124 = icmp ult double* %scevgep103, %18
  %bound1125 = icmp ult double* %18, %scevgep106
  %found.conflict126 = and i1 %bound0124, %bound1125
  %conflict.rdx127 = or i1 %conflict.rdx, %found.conflict126
  %bound0128 = icmp ult double* %scevgep103, %scevgep116
  %bound1129 = icmp ult double* %scevgep113, %scevgep106
  %found.conflict130 = and i1 %bound0128, %bound1129
  %conflict.rdx131 = or i1 %conflict.rdx127, %found.conflict130
  %35 = or i64 %indvars.iv91.unr.ph, 2
  %36 = shl nuw i64 %30, 1
  %37 = add i64 %35, %36
  %38 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %37, %38
  br i1 %conflict.rdx131, label %.preheader11.us.preheader183, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %39 = load double, double* %17, align 8, !alias.scope !1
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  %42 = load double, double* %18, align 8, !alias.scope !4
  %43 = insertelement <2 x double> undef, double %42, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  %45 = load double, double* %17, align 8, !alias.scope !1
  %46 = insertelement <2 x double> undef, double %45, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = load double, double* %18, align 8, !alias.scope !4
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %51 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv91.unr.ph, %51
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv97, i64 %offset.idx
  %53 = bitcast double* %52 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %53, align 8, !alias.scope !6, !noalias !8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec132 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %54 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %55 = bitcast double* %54 to <4 x double>*
  %wide.vec133 = load <4 x double>, <4 x double>* %55, align 8, !alias.scope !11
  %strided.vec134 = shufflevector <4 x double> %wide.vec133, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec135 = shufflevector <4 x double> %wide.vec133, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %56 = fmul <2 x double> %41, %strided.vec134
  %57 = fadd <2 x double> %strided.vec, %56
  %58 = getelementptr inbounds double, double* %7, i64 %offset.idx
  %59 = bitcast double* %58 to <4 x double>*
  %wide.vec136 = load <4 x double>, <4 x double>* %59, align 8, !alias.scope !12
  %strided.vec137 = shufflevector <4 x double> %wide.vec136, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec138 = shufflevector <4 x double> %wide.vec136, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %60 = fmul <2 x double> %44, %strided.vec137
  %61 = fadd <2 x double> %57, %60
  %62 = add nuw nsw i64 %offset.idx, 1
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv97, i64 %62
  %64 = fmul <2 x double> %47, %strided.vec135
  %65 = fadd <2 x double> %strided.vec132, %64
  %66 = fmul <2 x double> %50, %strided.vec138
  %67 = fadd <2 x double> %65, %66
  %68 = getelementptr double, double* %63, i64 -1
  %69 = bitcast double* %68 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %61, <2 x double> %67, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %69, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %70 = icmp eq i64 %index.next, %n.vec
  br i1 %70, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader11._crit_edge.us, label %.preheader11.us.preheader183

.preheader11.us.preheader183:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader11.us.preheader
  %indvars.iv91.ph = phi i64 [ %indvars.iv91.unr.ph, %vector.memcheck ], [ %indvars.iv91.unr.ph, %min.iters.checked ], [ %indvars.iv91.unr.ph, %.preheader11.us.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %.preheader11.us.preheader183, %.preheader11.us
  %indvars.iv91 = phi i64 [ %indvars.iv.next92.1, %.preheader11.us ], [ %indvars.iv91.ph, %.preheader11.us.preheader183 ]
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv97, i64 %indvars.iv91
  %72 = load double, double* %71, align 8
  %73 = load double, double* %17, align 8
  %74 = getelementptr inbounds double, double* %5, i64 %indvars.iv91
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %72, %76
  %78 = load double, double* %18, align 8
  %79 = getelementptr inbounds double, double* %7, i64 %indvars.iv91
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %77, %81
  store double %82, double* %71, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv97, i64 %indvars.iv.next92
  %84 = load double, double* %83, align 8
  %85 = load double, double* %17, align 8
  %86 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next92
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %84, %88
  %90 = load double, double* %18, align 8
  %91 = getelementptr inbounds double, double* %7, i64 %indvars.iv.next92
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = fadd double %89, %93
  store double %94, double* %83, align 8
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91, 2
  %exitcond94.1 = icmp eq i64 %indvars.iv.next92.1, %wide.trip.count93.1
  br i1 %exitcond94.1, label %.preheader11._crit_edge.us.loopexit, label %.preheader11.us, !llvm.loop !16

.preheader11._crit_edge.us.loopexit:              ; preds = %.preheader11.us
  br label %.preheader11._crit_edge.us

.preheader11._crit_edge.us:                       ; preds = %.preheader11._crit_edge.us.loopexit, %middle.block, %.preheader11.us.prol.loopexit
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98, %wide.trip.count99
  br i1 %exitcond100, label %.preheader10.preheader, label %.preheader11.preheader.us

.preheader10.preheader:                           ; preds = %.preheader11._crit_edge.us
  %95 = icmp sgt i32 %0, 0
  br i1 %95, label %.preheader9.preheader.us.preheader, label %.preheader7._crit_edge

.preheader9.preheader.us.preheader:               ; preds = %.preheader10.preheader
  %xtraiter85 = and i32 %0, 1
  %lcmp.mod86 = icmp eq i32 %xtraiter85, 0
  %96 = icmp eq i32 %0, 1
  %wide.trip.count89 = zext i32 %0 to i64
  %wide.trip.count83.1 = zext i32 %0 to i64
  br label %.preheader9.preheader.us

.preheader9.preheader.us:                         ; preds = %.preheader9.preheader.us.preheader, %.preheader9._crit_edge.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %.preheader9._crit_edge.us ], [ 0, %.preheader9.preheader.us.preheader ]
  %97 = getelementptr inbounds double, double* %9, i64 %indvars.iv87
  br i1 %lcmp.mod86, label %.preheader9.us.prol.loopexit, label %.preheader9.us.prol

.preheader9.us.prol:                              ; preds = %.preheader9.preheader.us
  %98 = load double, double* %97, align 8
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv87
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, %2
  %102 = load double, double* %10, align 8
  %103 = fmul double %101, %102
  %104 = fadd double %98, %103
  store double %104, double* %97, align 8
  br label %.preheader9.us.prol.loopexit

.preheader9.us.prol.loopexit:                     ; preds = %.preheader9.us.prol, %.preheader9.preheader.us
  %indvars.iv81.unr.ph = phi i64 [ 1, %.preheader9.us.prol ], [ 0, %.preheader9.preheader.us ]
  br i1 %96, label %.preheader9._crit_edge.us, label %.preheader9.us.preheader

.preheader9.us.preheader:                         ; preds = %.preheader9.us.prol.loopexit
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.preheader9.us.preheader, %.preheader9.us
  %indvars.iv81 = phi i64 [ %indvars.iv.next82.1, %.preheader9.us ], [ %indvars.iv81.unr.ph, %.preheader9.us.preheader ]
  %105 = load double, double* %97, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv81, i64 %indvars.iv87
  %107 = load double, double* %106, align 8
  %108 = fmul double %107, %2
  %109 = getelementptr inbounds double, double* %10, i64 %indvars.iv81
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = fadd double %105, %111
  store double %112, double* %97, align 8
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv.next82, i64 %indvars.iv87
  %114 = load double, double* %113, align 8
  %115 = fmul double %114, %2
  %116 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next82
  %117 = load double, double* %116, align 8
  %118 = fmul double %115, %117
  %119 = fadd double %112, %118
  store double %119, double* %97, align 8
  %indvars.iv.next82.1 = add nsw i64 %indvars.iv81, 2
  %exitcond84.1 = icmp eq i64 %indvars.iv.next82.1, %wide.trip.count83.1
  br i1 %exitcond84.1, label %.preheader9._crit_edge.us.loopexit, label %.preheader9.us

.preheader9._crit_edge.us.loopexit:               ; preds = %.preheader9.us
  br label %.preheader9._crit_edge.us

.preheader9._crit_edge.us:                        ; preds = %.preheader9._crit_edge.us.loopexit, %.preheader9.us.prol.loopexit
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond90 = icmp eq i64 %indvars.iv.next88, %wide.trip.count89
  br i1 %exitcond90, label %.preheader8.preheader, label %.preheader9.preheader.us

.preheader8.preheader:                            ; preds = %.preheader9._crit_edge.us
  %120 = icmp sgt i32 %0, 0
  br i1 %120, label %.preheader8.preheader71, label %.preheader7._crit_edge

.preheader8.preheader71:                          ; preds = %.preheader8.preheader
  %121 = add i32 %0, -1
  %xtraiter79 = and i32 %0, 3
  %lcmp.mod80 = icmp eq i32 %xtraiter79, 0
  br i1 %lcmp.mod80, label %.preheader8.prol.loopexit, label %.preheader8.prol.preheader

.preheader8.prol.preheader:                       ; preds = %.preheader8.preheader71
  br label %.preheader8.prol

.preheader8.prol:                                 ; preds = %.preheader8.prol.preheader, %.preheader8.prol
  %indvars.iv75.prol = phi i64 [ %indvars.iv.next76.prol, %.preheader8.prol ], [ 0, %.preheader8.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader8.prol ], [ %xtraiter79, %.preheader8.prol.preheader ]
  %122 = getelementptr inbounds double, double* %9, i64 %indvars.iv75.prol
  %123 = load double, double* %122, align 8
  %124 = getelementptr inbounds double, double* %11, i64 %indvars.iv75.prol
  %125 = load double, double* %124, align 8
  %126 = fadd double %123, %125
  store double %126, double* %122, align 8
  %indvars.iv.next76.prol = add nuw nsw i64 %indvars.iv75.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader8.prol.loopexit.loopexit, label %.preheader8.prol, !llvm.loop !17

.preheader8.prol.loopexit.loopexit:               ; preds = %.preheader8.prol
  br label %.preheader8.prol.loopexit

.preheader8.prol.loopexit:                        ; preds = %.preheader8.prol.loopexit.loopexit, %.preheader8.preheader71
  %indvars.iv75.unr = phi i64 [ 0, %.preheader8.preheader71 ], [ %indvars.iv.next76.prol, %.preheader8.prol.loopexit.loopexit ]
  %127 = icmp ult i32 %121, 3
  br i1 %127, label %.preheader.preheader.us.preheader, label %.preheader8.preheader102

.preheader8.preheader102:                         ; preds = %.preheader8.prol.loopexit
  %wide.trip.count77.3 = zext i32 %0 to i64
  %128 = add nsw i64 %wide.trip.count93.1, -4
  %129 = sub i64 %128, %indvars.iv75.unr
  %130 = lshr i64 %129, 2
  %131 = add nuw nsw i64 %130, 1
  %min.iters.check142 = icmp ult i64 %131, 2
  br i1 %min.iters.check142, label %.preheader8.preheader182, label %min.iters.checked143

.preheader8.preheader182:                         ; preds = %middle.block140, %vector.memcheck160, %min.iters.checked143, %.preheader8.preheader102
  %indvars.iv75.ph = phi i64 [ %indvars.iv75.unr, %vector.memcheck160 ], [ %indvars.iv75.unr, %min.iters.checked143 ], [ %indvars.iv75.unr, %.preheader8.preheader102 ], [ %ind.end165, %middle.block140 ]
  br label %.preheader8

min.iters.checked143:                             ; preds = %.preheader8.preheader102
  %n.mod.vf144 = and i64 %131, 1
  %n.vec145 = sub nsw i64 %131, %n.mod.vf144
  %cmp.zero146 = icmp eq i64 %n.vec145, 0
  br i1 %cmp.zero146, label %.preheader8.preheader182, label %vector.memcheck160

vector.memcheck160:                               ; preds = %min.iters.checked143
  %scevgep148 = getelementptr double, double* %9, i64 %indvars.iv75.unr
  %132 = add nsw i64 %wide.trip.count93.1, -4
  %133 = sub i64 %132, %indvars.iv75.unr
  %134 = and i64 %133, -4
  %135 = add i64 %indvars.iv75.unr, %134
  %136 = add i64 %135, 4
  %scevgep150 = getelementptr double, double* %9, i64 %136
  %scevgep152 = getelementptr double, double* %11, i64 %indvars.iv75.unr
  %scevgep154 = getelementptr double, double* %11, i64 %136
  %bound0156 = icmp ult double* %scevgep148, %scevgep154
  %bound1157 = icmp ult double* %scevgep152, %scevgep150
  %memcheck.conflict159 = and i1 %bound0156, %bound1157
  %137 = shl nuw i64 %130, 2
  %138 = add i64 %indvars.iv75.unr, %137
  %139 = add i64 %138, 4
  %140 = shl nuw nsw i64 %n.mod.vf144, 2
  %ind.end165 = sub i64 %139, %140
  br i1 %memcheck.conflict159, label %.preheader8.preheader182, label %vector.body139.preheader

vector.body139.preheader:                         ; preds = %vector.memcheck160
  br label %vector.body139

vector.body139:                                   ; preds = %vector.body139.preheader, %vector.body139
  %index162 = phi i64 [ %index.next163, %vector.body139 ], [ 0, %vector.body139.preheader ]
  %141 = shl i64 %index162, 2
  %142 = add i64 %indvars.iv75.unr, %141
  %143 = getelementptr inbounds double, double* %9, i64 %142
  %144 = bitcast double* %143 to <8 x double>*
  %wide.vec171 = load <8 x double>, <8 x double>* %144, align 8, !alias.scope !19, !noalias !22
  %145 = getelementptr inbounds double, double* %11, i64 %142
  %146 = bitcast double* %145 to <8 x double>*
  %wide.vec176 = load <8 x double>, <8 x double>* %146, align 8, !alias.scope !22
  %147 = fadd <8 x double> %wide.vec171, %wide.vec176
  %148 = shufflevector <8 x double> %147, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %149 = fadd <8 x double> %wide.vec171, %wide.vec176
  %150 = shufflevector <8 x double> %149, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %151 = fadd <8 x double> %wide.vec171, %wide.vec176
  %152 = shufflevector <8 x double> %151, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %153 = add nsw i64 %142, 3
  %154 = getelementptr inbounds double, double* %9, i64 %153
  %155 = fadd <8 x double> %wide.vec171, %wide.vec176
  %156 = shufflevector <8 x double> %155, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %157 = getelementptr double, double* %154, i64 -3
  %158 = bitcast double* %157 to <8 x double>*
  %159 = shufflevector <2 x double> %148, <2 x double> %150, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %160 = shufflevector <2 x double> %152, <2 x double> %156, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec181 = shufflevector <4 x double> %159, <4 x double> %160, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec181, <8 x double>* %158, align 8, !alias.scope !19, !noalias !22
  %index.next163 = add i64 %index162, 2
  %161 = icmp eq i64 %index.next163, %n.vec145
  br i1 %161, label %middle.block140, label %vector.body139, !llvm.loop !24

middle.block140:                                  ; preds = %vector.body139
  %cmp.n166 = icmp eq i64 %n.mod.vf144, 0
  br i1 %cmp.n166, label %.preheader7.preheader, label %.preheader8.preheader182

.preheader7.preheader.loopexit:                   ; preds = %.preheader8
  br label %.preheader7.preheader

.preheader7.preheader:                            ; preds = %.preheader7.preheader.loopexit, %middle.block140
  %162 = icmp sgt i32 %0, 0
  br i1 %162, label %.preheader.preheader.us.preheader, label %.preheader7._crit_edge

.preheader.preheader.us.preheader:                ; preds = %.preheader7.preheader, %.preheader8.prol.loopexit
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %163 = icmp eq i32 %0, 1
  %wide.trip.count74 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader._crit_edge.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  %164 = getelementptr inbounds double, double* %8, i64 %indvars.iv72
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.preheader.us
  %165 = load double, double* %164, align 8
  %166 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv72, i64 0
  %167 = load double, double* %166, align 8
  %168 = fmul double %167, %1
  %169 = load double, double* %9, align 8
  %170 = fmul double %168, %169
  %171 = fadd double %165, %170
  store double %171, double* %164, align 8
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol, %.preheader.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.preheader.us.prol ], [ 0, %.preheader.preheader.us ]
  br i1 %163, label %.preheader._crit_edge.us, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.prol.loopexit
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us ], [ %indvars.iv.unr.ph, %.preheader.us.preheader ]
  %172 = load double, double* %164, align 8
  %173 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv72, i64 %indvars.iv
  %174 = load double, double* %173, align 8
  %175 = fmul double %174, %1
  %176 = getelementptr inbounds double, double* %9, i64 %indvars.iv
  %177 = load double, double* %176, align 8
  %178 = fmul double %175, %177
  %179 = fadd double %172, %178
  store double %179, double* %164, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %180 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv72, i64 %indvars.iv.next
  %181 = load double, double* %180, align 8
  %182 = fmul double %181, %1
  %183 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next
  %184 = load double, double* %183, align 8
  %185 = fmul double %182, %184
  %186 = fadd double %179, %185
  store double %186, double* %164, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.preheader._crit_edge.us.loopexit, label %.preheader.us

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %.preheader.us.prol.loopexit
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond = icmp eq i64 %indvars.iv.next73, %wide.trip.count74
  br i1 %exitcond, label %.preheader7._crit_edge.loopexit, label %.preheader.preheader.us

.preheader8:                                      ; preds = %.preheader8.preheader182, %.preheader8
  %indvars.iv75 = phi i64 [ %indvars.iv.next76.3, %.preheader8 ], [ %indvars.iv75.ph, %.preheader8.preheader182 ]
  %187 = getelementptr inbounds double, double* %9, i64 %indvars.iv75
  %188 = load double, double* %187, align 8
  %189 = getelementptr inbounds double, double* %11, i64 %indvars.iv75
  %190 = load double, double* %189, align 8
  %191 = fadd double %188, %190
  store double %191, double* %187, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %192 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next76
  %193 = load double, double* %192, align 8
  %194 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next76
  %195 = load double, double* %194, align 8
  %196 = fadd double %193, %195
  store double %196, double* %192, align 8
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  %197 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next76.1
  %198 = load double, double* %197, align 8
  %199 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next76.1
  %200 = load double, double* %199, align 8
  %201 = fadd double %198, %200
  store double %201, double* %197, align 8
  %indvars.iv.next76.2 = add nsw i64 %indvars.iv75, 3
  %202 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next76.2
  %203 = load double, double* %202, align 8
  %204 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next76.2
  %205 = load double, double* %204, align 8
  %206 = fadd double %203, %205
  store double %206, double* %202, align 8
  %indvars.iv.next76.3 = add nsw i64 %indvars.iv75, 4
  %exitcond78.3 = icmp eq i64 %indvars.iv.next76.3, %wide.trip.count77.3
  br i1 %exitcond78.3, label %.preheader7.preheader.loopexit, label %.preheader8, !llvm.loop !25

.preheader7._crit_edge.loopexit:                  ; preds = %.preheader._crit_edge.us
  br label %.preheader7._crit_edge

.preheader7._crit_edge:                           ; preds = %.preheader7._crit_edge.loopexit, %12, %.preheader10.preheader, %.preheader8.preheader, %.preheader7.preheader
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %13
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %11, %.lr.ph
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !9, !5, !10}
!9 = distinct !{!9, !3}
!10 = distinct !{!10, !3}
!11 = !{!9}
!12 = !{!10}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !14, !15}
!25 = distinct !{!25, !14, !15}

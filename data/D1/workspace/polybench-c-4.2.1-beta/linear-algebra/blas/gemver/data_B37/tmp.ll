; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  call fastcc void @kernel_gemver(double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %._crit_edge

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %._crit_edge

; <label>:29:                                     ; preds = %26
  %30 = bitcast i8* %10 to double*
  call fastcc void @print_array(double* %30)
  br label %._crit_edge

._crit_edge:                                      ; preds = %26, %2, %29
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

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.loopexit._crit_edge

.loopexit:                                        ; preds = %._crit_edge
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond1, label %43, label %.loopexit._crit_edge

.loopexit._crit_edge:                             ; preds = %.loopexit, %11
  %indvars.iv14 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %.loopexit ]
  %12 = trunc i64 %indvars.iv14 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  store double %13, double* %14, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv14, 1
  %15 = trunc i64 %indvars.iv.next2 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv14
  store double %18, double* %19, align 8
  %20 = fmul double %17, 2.500000e-01
  %21 = getelementptr inbounds double, double* %4, i64 %indvars.iv14
  store double %20, double* %21, align 8
  %22 = fdiv double %17, 6.000000e+00
  %23 = getelementptr inbounds double, double* %6, i64 %indvars.iv14
  store double %22, double* %23, align 8
  %24 = fmul double %17, 1.250000e-01
  %25 = getelementptr inbounds double, double* %9, i64 %indvars.iv14
  store double %24, double* %25, align 8
  %26 = fdiv double %17, 9.000000e+00
  %27 = getelementptr inbounds double, double* %10, i64 %indvars.iv14
  store double %26, double* %27, align 8
  %28 = getelementptr inbounds double, double* %8, i64 %indvars.iv14
  store double 0.000000e+00, double* %28, align 8
  %29 = getelementptr inbounds double, double* %7, i64 %indvars.iv14
  store double 0.000000e+00, double* %29, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.loopexit._crit_edge
  %indvars.iv3 = phi i64 [ 0, %.loopexit._crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %30 = mul nuw nsw i64 %indvars.iv3, %indvars.iv14
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 2000
  %33 = sitofp i32 %32 to double
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv3
  %indvars.iv.next = or i64 %indvars.iv3, 1
  %35 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv14
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 2000
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %33, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fdiv <2 x double> %40, <double 2.000000e+03, double 2.000000e+03>
  %42 = bitcast double* %34 to <2 x double>*
  store <2 x double> %41, <2 x double>* %42, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv3, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.loopexit, label %._crit_edge

; <label>:43:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %scevgep12 = getelementptr double, double* %4, i64 2000
  %scevgep14 = getelementptr double, double* %6, i64 2000
  br label %.preheader21

.preheader21:                                     ; preds = %middle.block, %11
  %indvars.iv1528 = phi i64 [ 0, %11 ], [ %12, %middle.block ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %indvars.iv1528, i64 0
  %12 = add i64 %indvars.iv1528, 1
  %scevgep10 = getelementptr [2000 x double], [2000 x double]* %2, i64 %12, i64 0
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv1528
  %14 = getelementptr inbounds double, double* %5, i64 %indvars.iv1528
  %bound0 = icmp ult double* %scevgep, %13
  %bound1 = icmp ult double* %13, %scevgep10
  %found.conflict = and i1 %bound0, %bound1
  %bound017 = icmp ult double* %scevgep, %scevgep12
  %bound118 = icmp ugt double* %scevgep10, %4
  %found.conflict19 = and i1 %bound017, %bound118
  %conflict.rdx = or i1 %found.conflict, %found.conflict19
  %bound022 = icmp ult double* %scevgep, %14
  %bound123 = icmp ult double* %14, %scevgep10
  %found.conflict24 = and i1 %bound022, %bound123
  %conflict.rdx25 = or i1 %conflict.rdx, %found.conflict24
  %bound026 = icmp ult double* %scevgep, %scevgep14
  %bound127 = icmp ugt double* %scevgep10, %6
  %found.conflict28 = and i1 %bound026, %bound127
  %conflict.rdx29 = or i1 %conflict.rdx25, %found.conflict28
  br i1 %conflict.rdx29, label %._crit_edge.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader21
  br label %vector.body

._crit_edge.preheader:                            ; preds = %.preheader21
  br label %._crit_edge

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1528, i64 %offset.idx
  %16 = bitcast double* %15 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %16, align 8, !alias.scope !1, !noalias !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec30 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = load double, double* %13, align 8, !alias.scope !9
  %18 = insertelement <2 x double> undef, double %17, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = getelementptr inbounds double, double* %4, i64 %offset.idx
  %21 = bitcast double* %20 to <4 x double>*
  %wide.vec31 = load <4 x double>, <4 x double>* %21, align 8, !alias.scope !10
  %strided.vec32 = shufflevector <4 x double> %wide.vec31, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec33 = shufflevector <4 x double> %wide.vec31, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %22 = fmul <2 x double> %19, %strided.vec32
  %23 = fadd <2 x double> %strided.vec, %22
  %24 = load double, double* %14, align 8, !alias.scope !11
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = getelementptr inbounds double, double* %6, i64 %offset.idx
  %28 = bitcast double* %27 to <4 x double>*
  %wide.vec34 = load <4 x double>, <4 x double>* %28, align 8, !alias.scope !12
  %strided.vec35 = shufflevector <4 x double> %wide.vec34, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec36 = shufflevector <4 x double> %wide.vec34, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %29 = fmul <2 x double> %26, %strided.vec35
  %30 = fadd <2 x double> %23, %29
  %31 = or i64 %offset.idx, 1
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1528, i64 %31
  %33 = fmul <2 x double> %19, %strided.vec33
  %34 = fadd <2 x double> %strided.vec30, %33
  %35 = fmul <2 x double> %26, %strided.vec36
  %36 = fadd <2 x double> %34, %35
  %37 = getelementptr double, double* %32, i64 -1
  %38 = bitcast double* %37 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %30, <2 x double> %36, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %38, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %39 = icmp eq i64 %index.next, 1000
  br i1 %39, label %middle.block.loopexit53, label %vector.body, !llvm.loop !13

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv1127 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next12.1, %._crit_edge ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1528, i64 %indvars.iv1127
  %41 = load double, double* %40, align 8
  %42 = load double, double* %13, align 8
  %43 = getelementptr inbounds double, double* %4, i64 %indvars.iv1127
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %41, %45
  %47 = load double, double* %14, align 8
  %48 = getelementptr inbounds double, double* %6, i64 %indvars.iv1127
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %46, %50
  store double %51, double* %40, align 8
  %indvars.iv.next12 = or i64 %indvars.iv1127, 1
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1528, i64 %indvars.iv.next12
  %53 = load double, double* %52, align 8
  %54 = load double, double* %13, align 8
  %55 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next12
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %53, %57
  %59 = load double, double* %14, align 8
  %60 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %58, %62
  store double %63, double* %52, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv1127, 2
  %exitcond14.1 = icmp eq i64 %indvars.iv.next12.1, 2000
  br i1 %exitcond14.1, label %middle.block.loopexit, label %._crit_edge, !llvm.loop !16

middle.block.loopexit:                            ; preds = %._crit_edge
  br label %middle.block

middle.block.loopexit53:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit53, %middle.block.loopexit
  %exitcond4 = icmp eq i64 %12, 2000
  br i1 %exitcond4, label %.preheader19.preheader, label %.preheader21

.preheader19.preheader:                           ; preds = %middle.block
  br label %.preheader19

.preheader19:                                     ; preds = %80, %.preheader19.preheader
  %indvars.iv926 = phi i64 [ 0, %.preheader19.preheader ], [ %indvars.iv.next10, %80 ]
  %64 = getelementptr inbounds double, double* %8, i64 %indvars.iv926
  %.pre = load double, double* %64, align 8
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5, %.preheader19
  %65 = phi double [ %.pre, %.preheader19 ], [ %79, %._crit_edge5 ]
  %indvars.iv525 = phi i64 [ 0, %.preheader19 ], [ %indvars.iv.next6.1, %._crit_edge5 ]
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv525, i64 %indvars.iv926
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %1
  %69 = getelementptr inbounds double, double* %9, i64 %indvars.iv525
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %65, %71
  %sunkaddr = ptrtoint double* %8 to i64
  %sunkaddr45 = shl i64 %indvars.iv926, 3
  %sunkaddr46 = add i64 %sunkaddr, %sunkaddr45
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to double*
  store double %72, double* %sunkaddr47, align 8
  %indvars.iv.next6 = or i64 %indvars.iv525, 1
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next6, i64 %indvars.iv926
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %1
  %76 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next6
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fadd double %72, %78
  store double %79, double* %sunkaddr47, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv525, 2
  %exitcond8.1 = icmp eq i64 %indvars.iv.next6.1, 2000
  br i1 %exitcond8.1, label %80, label %._crit_edge5

; <label>:80:                                     ; preds = %._crit_edge5
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv926, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond3, label %.preheader18.preheader, label %.preheader19

.preheader18.preheader:                           ; preds = %80
  br label %.preheader18

.preheader18:                                     ; preds = %.preheader18, %.preheader18.preheader
  %indvars.iv324 = phi i64 [ 0, %.preheader18.preheader ], [ %indvars.iv.next4.4, %.preheader18 ]
  %81 = getelementptr inbounds double, double* %8, i64 %indvars.iv324
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds double, double* %10, i64 %indvars.iv324
  %84 = load double, double* %83, align 8
  %85 = fadd double %82, %84
  store double %85, double* %81, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv324, 1
  %86 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next4
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next4
  %89 = load double, double* %88, align 8
  %90 = fadd double %87, %89
  store double %90, double* %86, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv324, 2
  %91 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next4.1
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next4.1
  %94 = load double, double* %93, align 8
  %95 = fadd double %92, %94
  store double %95, double* %91, align 8
  %indvars.iv.next4.2 = add nsw i64 %indvars.iv324, 3
  %96 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next4.2
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next4.2
  %99 = load double, double* %98, align 8
  %100 = fadd double %97, %99
  store double %100, double* %96, align 8
  %indvars.iv.next4.3 = add nsw i64 %indvars.iv324, 4
  %101 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next4.3
  %102 = load double, double* %101, align 8
  %103 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next4.3
  %104 = load double, double* %103, align 8
  %105 = fadd double %102, %104
  store double %105, double* %101, align 8
  %indvars.iv.next4.4 = add nsw i64 %indvars.iv324, 5
  %exitcond2.4 = icmp eq i64 %indvars.iv.next4.4, 2000
  br i1 %exitcond2.4, label %.preheader.preheader, label %.preheader18

.preheader.preheader:                             ; preds = %.preheader18
  br label %.preheader

.preheader:                                       ; preds = %122, %.preheader.preheader
  %indvars.iv123 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next2, %122 ]
  %106 = getelementptr inbounds double, double* %7, i64 %indvars.iv123
  %.pre8 = load double, double* %106, align 8
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7, %.preheader
  %107 = phi double [ %.pre8, %.preheader ], [ %121, %._crit_edge7 ]
  %indvars.iv22 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge7 ]
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv123, i64 %indvars.iv22
  %109 = load double, double* %108, align 8
  %110 = fmul double %109, %0
  %111 = getelementptr inbounds double, double* %8, i64 %indvars.iv22
  %112 = load double, double* %111, align 8
  %113 = fmul double %110, %112
  %114 = fadd double %107, %113
  %sunkaddr48 = ptrtoint double* %7 to i64
  %sunkaddr49 = shl i64 %indvars.iv123, 3
  %sunkaddr50 = add i64 %sunkaddr48, %sunkaddr49
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to double*
  store double %114, double* %sunkaddr51, align 8
  %indvars.iv.next = or i64 %indvars.iv22, 1
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv123, i64 %indvars.iv.next
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, %0
  %118 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %119 = load double, double* %118, align 8
  %120 = fmul double %117, %119
  %121 = fadd double %114, %120
  store double %121, double* %sunkaddr51, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv22, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %122, label %._crit_edge7

; <label>:122:                                    ; preds = %._crit_edge7
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond1, label %123, label %.preheader

; <label>:123:                                    ; preds = %122
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv1 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge._crit_edge
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge._crit_edge

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5, !6, !7, !8}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = distinct !{!7, !3}
!8 = distinct !{!8, !3}
!9 = !{!5}
!10 = !{!6}
!11 = !{!7}
!12 = !{!8}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}

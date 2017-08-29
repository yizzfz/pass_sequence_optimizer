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
  %25 = bitcast i8* %5 to [2000 x double]*
  %26 = bitcast i8* %6 to double*
  %27 = bitcast i8* %7 to double*
  %28 = bitcast i8* %8 to double*
  %29 = bitcast i8* %9 to double*
  %30 = bitcast i8* %10 to double*
  %31 = bitcast i8* %11 to double*
  %32 = bitcast i8* %12 to double*
  %33 = bitcast i8* %13 to double*
  call fastcc void @kernel_gemver(double %23, double %24, [2000 x double]* %25, double* %26, double* %27, double* %28, double* %29, double* %30, double* %31, double* %32, double* %33)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %34 = icmp sgt i32 %0, 42
  br i1 %34, label %35, label %._crit_edge

; <label>:35:                                     ; preds = %2
  %36 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %36, align 1
  %37 = icmp eq i8 %strcmpload, 0
  br i1 %37, label %38, label %._crit_edge

; <label>:38:                                     ; preds = %35
  %39 = bitcast i8* %10 to double*
  call fastcc void @print_array(double* %39)
  br label %._crit_edge

._crit_edge:                                      ; preds = %35, %2, %38
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
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %59, %11
  %indvars.iv1 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %59 ]
  %12 = trunc i64 %indvars.iv1 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv1
  store double %13, double* %14, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %15 = trunc i64 %indvars.iv.next2 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %5, i64 %indvars.iv1
  %18 = trunc i64 %indvars.iv.next2 to i32
  %19 = sitofp i32 %18 to double
  %20 = insertelement <2 x double> undef, double %16, i32 0
  %21 = insertelement <2 x double> %20, double %19, i32 1
  %22 = fdiv <2 x double> %21, <double 2.000000e+03, double 2.000000e+03>
  %23 = fdiv <2 x double> %22, <double 2.000000e+00, double 4.000000e+00>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  store double %24, double* %17, align 8
  %26 = getelementptr inbounds double, double* %4, i64 %indvars.iv1
  store double %25, double* %26, align 8
  %27 = trunc i64 %indvars.iv.next2 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %6, i64 %indvars.iv1
  %30 = trunc i64 %indvars.iv.next2 to i32
  %31 = sitofp i32 %30 to double
  %32 = insertelement <2 x double> undef, double %28, i32 0
  %33 = insertelement <2 x double> %32, double %31, i32 1
  %34 = fdiv <2 x double> %33, <double 2.000000e+03, double 2.000000e+03>
  %35 = fdiv <2 x double> %34, <double 6.000000e+00, double 8.000000e+00>
  %36 = extractelement <2 x double> %35, i32 0
  %37 = extractelement <2 x double> %35, i32 1
  store double %36, double* %29, align 8
  %38 = getelementptr inbounds double, double* %9, i64 %indvars.iv1
  store double %37, double* %38, align 8
  %39 = trunc i64 %indvars.iv.next2 to i32
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, 2.000000e+03
  %42 = fdiv double %41, 9.000000e+00
  %43 = getelementptr inbounds double, double* %10, i64 %indvars.iv1
  store double %42, double* %43, align 8
  %44 = getelementptr inbounds double, double* %8, i64 %indvars.iv1
  store double 0.000000e+00, double* %44, align 8
  %45 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  store double 0.000000e+00, double* %45, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge4
  %indvars.iv = phi i64 [ 0, %._crit_edge4 ], [ %indvars.iv.next.1, %._crit_edge ]
  %46 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, 2000
  %49 = sitofp i32 %48 to double
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %51 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %52 = trunc i64 %51 to i32
  %53 = srem i32 %52, 2000
  %54 = sitofp i32 %53 to double
  %55 = insertelement <2 x double> undef, double %49, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = fdiv <2 x double> %56, <double 2.000000e+03, double 2.000000e+03>
  %58 = bitcast double* %50 to <2 x double>*
  store <2 x double> %57, <2 x double>* %58, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %59, label %._crit_edge

; <label>:59:                                     ; preds = %._crit_edge
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %60, label %._crit_edge4

; <label>:60:                                     ; preds = %59
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]*, double* readonly, double* readonly, double* readonly, double* readonly, double*, double*, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %scevgep25 = getelementptr double, double* %4, i64 2000
  %scevgep27 = getelementptr double, double* %6, i64 2000
  br label %.preheader67

.preheader67:                                     ; preds = %middle.block, %11
  %indvars.iv16 = phi i64 [ 0, %11 ], [ %indvars.iv.next17, %middle.block ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 0
  %12 = add i64 %indvars.iv16, 1
  %scevgep23 = getelementptr [2000 x double], [2000 x double]* %2, i64 %12, i64 0
  %13 = getelementptr inbounds double, double* %3, i64 %indvars.iv16
  %14 = getelementptr inbounds double, double* %5, i64 %indvars.iv16
  %bound0 = icmp ult double* %scevgep, %13
  %bound1 = icmp ult double* %13, %scevgep23
  %found.conflict = and i1 %bound0, %bound1
  %bound030 = icmp ult double* %scevgep, %scevgep25
  %bound131 = icmp ugt double* %scevgep23, %4
  %found.conflict32 = and i1 %bound030, %bound131
  %conflict.rdx = or i1 %found.conflict, %found.conflict32
  %bound035 = icmp ult double* %scevgep, %14
  %bound136 = icmp ult double* %14, %scevgep23
  %found.conflict37 = and i1 %bound035, %bound136
  %conflict.rdx38 = or i1 %conflict.rdx, %found.conflict37
  %bound039 = icmp ult double* %scevgep, %scevgep27
  %bound140 = icmp ugt double* %scevgep23, %6
  %found.conflict41 = and i1 %bound039, %bound140
  %conflict.rdx42 = or i1 %conflict.rdx38, %found.conflict41
  br i1 %conflict.rdx42, label %.preheader67.._crit_edge_crit_edge, label %.preheader67.vector.body_crit_edge

.preheader67.vector.body_crit_edge:               ; preds = %.preheader67
  br label %vector.body

.preheader67.._crit_edge_crit_edge:               ; preds = %.preheader67
  br label %._crit_edge

vector.body:                                      ; preds = %vector.body, %.preheader67.vector.body_crit_edge
  %index = phi i64 [ 0, %.preheader67.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %offset.idx
  %16 = bitcast double* %15 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %16, align 8, !alias.scope !1, !noalias !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec43 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = load double, double* %13, align 8, !alias.scope !9
  %18 = insertelement <2 x double> undef, double %17, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = getelementptr inbounds double, double* %4, i64 %offset.idx
  %21 = bitcast double* %20 to <4 x double>*
  %wide.vec44 = load <4 x double>, <4 x double>* %21, align 8, !alias.scope !10
  %strided.vec45 = shufflevector <4 x double> %wide.vec44, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec46 = shufflevector <4 x double> %wide.vec44, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %22 = fmul <2 x double> %19, %strided.vec45
  %23 = fadd <2 x double> %strided.vec, %22
  %24 = load double, double* %14, align 8, !alias.scope !11
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = getelementptr inbounds double, double* %6, i64 %offset.idx
  %28 = bitcast double* %27 to <4 x double>*
  %wide.vec47 = load <4 x double>, <4 x double>* %28, align 8, !alias.scope !12
  %strided.vec48 = shufflevector <4 x double> %wide.vec47, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec49 = shufflevector <4 x double> %wide.vec47, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %29 = fmul <2 x double> %26, %strided.vec48
  %30 = fadd <2 x double> %23, %29
  %31 = or i64 %offset.idx, 1
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %31
  %33 = load double, double* %13, align 8, !alias.scope !9
  %34 = insertelement <2 x double> undef, double %33, i32 0
  %35 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> zeroinitializer
  %36 = fmul <2 x double> %35, %strided.vec46
  %37 = fadd <2 x double> %strided.vec43, %36
  %38 = load double, double* %14, align 8, !alias.scope !11
  %39 = insertelement <2 x double> undef, double %38, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = fmul <2 x double> %40, %strided.vec49
  %42 = fadd <2 x double> %37, %41
  %43 = getelementptr double, double* %32, i64 -1
  %44 = bitcast double* %43 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %30, <2 x double> %42, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %44, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %45 = icmp eq i64 %index.next, 1000
  br i1 %45, label %middle.block.loopexit80, label %vector.body, !llvm.loop !13

._crit_edge:                                      ; preds = %._crit_edge, %.preheader67.._crit_edge_crit_edge
  %indvars.iv13 = phi i64 [ 0, %.preheader67.._crit_edge_crit_edge ], [ %indvars.iv.next14.1, %._crit_edge ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %47 = load double, double* %46, align 8
  %48 = load double, double* %13, align 8
  %49 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %47, %51
  %53 = load double, double* %14, align 8
  %54 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %52, %56
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  store double %57, double* %58, align 8
  %indvars.iv.next14 = or i64 %indvars.iv13, 1
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  %60 = load double, double* %59, align 8
  %61 = load double, double* %13, align 8
  %62 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next14
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %60, %64
  %66 = load double, double* %14, align 8
  %67 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next14
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fadd double %65, %69
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  store double %70, double* %71, align 8
  %indvars.iv.next14.1 = add nuw nsw i64 %indvars.iv13, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next14.1, 2000
  br i1 %exitcond15.1, label %middle.block.loopexit, label %._crit_edge, !llvm.loop !16

middle.block.loopexit:                            ; preds = %._crit_edge
  br label %middle.block

middle.block.loopexit80:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit80, %middle.block.loopexit
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond18, label %middle.block..preheader65_crit_edge, label %.preheader67

middle.block..preheader65_crit_edge:              ; preds = %middle.block
  br label %.preheader65

.preheader65:                                     ; preds = %87, %middle.block..preheader65_crit_edge
  %indvars.iv10 = phi i64 [ 0, %middle.block..preheader65_crit_edge ], [ %indvars.iv.next11, %87 ]
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19, %.preheader65
  %indvars.iv7 = phi i64 [ 0, %.preheader65 ], [ %indvars.iv.next8.1, %._crit_edge19 ]
  %sunkaddr = ptrtoint double* %8 to i64
  %sunkaddr65 = mul i64 %indvars.iv10, 8
  %sunkaddr66 = add i64 %sunkaddr, %sunkaddr65
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to double*
  %72 = load double, double* %sunkaddr67, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv10
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %1
  %76 = getelementptr inbounds double, double* %9, i64 %indvars.iv7
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fadd double %72, %78
  %sunkaddr68 = ptrtoint double* %8 to i64
  %sunkaddr69 = mul i64 %indvars.iv10, 8
  %sunkaddr70 = add i64 %sunkaddr68, %sunkaddr69
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to double*
  store double %79, double* %sunkaddr71, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv10
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %1
  %83 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next8
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fadd double %79, %85
  store double %86, double* %sunkaddr71, align 8
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2000
  br i1 %exitcond9.1, label %87, label %._crit_edge19

; <label>:87:                                     ; preds = %._crit_edge19
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %..preheader64_crit_edge, label %.preheader65

..preheader64_crit_edge:                          ; preds = %87
  br label %.preheader64

.preheader64:                                     ; preds = %.preheader64, %..preheader64_crit_edge
  %indvars.iv4 = phi i64 [ 0, %..preheader64_crit_edge ], [ %indvars.iv.next5.4, %.preheader64 ]
  %88 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds double, double* %10, i64 %indvars.iv4
  %91 = load double, double* %90, align 8
  %92 = fadd double %89, %91
  %93 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  store double %92, double* %93, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %94 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5
  %97 = load double, double* %96, align 8
  %98 = fadd double %95, %97
  %99 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  store double %98, double* %99, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %100 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.1
  %103 = load double, double* %102, align 8
  %104 = fadd double %101, %103
  %105 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  store double %104, double* %105, align 8
  %indvars.iv.next5.2 = add nuw nsw i64 %indvars.iv4, 3
  %106 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.2
  %109 = load double, double* %108, align 8
  %110 = fadd double %107, %109
  %111 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  store double %110, double* %111, align 8
  %indvars.iv.next5.3 = add nuw nsw i64 %indvars.iv4, 4
  %112 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.3
  %115 = load double, double* %114, align 8
  %116 = fadd double %113, %115
  %117 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  store double %116, double* %117, align 8
  %indvars.iv.next5.4 = add nuw nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 2000
  br i1 %exitcond6.4, label %.preheader64..preheader_crit_edge, label %.preheader64

.preheader64..preheader_crit_edge:                ; preds = %.preheader64
  br label %.preheader

.preheader:                                       ; preds = %133, %.preheader64..preheader_crit_edge
  %indvars.iv1 = phi i64 [ 0, %.preheader64..preheader_crit_edge ], [ %indvars.iv.next2, %133 ]
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge21 ]
  %sunkaddr72 = ptrtoint double* %7 to i64
  %sunkaddr73 = mul i64 %indvars.iv1, 8
  %sunkaddr74 = add i64 %sunkaddr72, %sunkaddr73
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to double*
  %118 = load double, double* %sunkaddr75, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %120 = load double, double* %119, align 8
  %121 = fmul double %120, %0
  %122 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %123 = load double, double* %122, align 8
  %124 = fmul double %121, %123
  %125 = fadd double %118, %124
  %sunkaddr76 = ptrtoint double* %7 to i64
  %sunkaddr77 = mul i64 %indvars.iv1, 8
  %sunkaddr78 = add i64 %sunkaddr76, %sunkaddr77
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to double*
  store double %125, double* %sunkaddr79, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %127 = load double, double* %126, align 8
  %128 = fmul double %127, %0
  %129 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %130 = load double, double* %129, align 8
  %131 = fmul double %128, %130
  %132 = fadd double %125, %131
  store double %132, double* %sunkaddr79, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %133, label %._crit_edge21

; <label>:133:                                    ; preds = %._crit_edge21
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %134, label %.preheader

; <label>:134:                                    ; preds = %133
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge._crit_edge
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge._crit_edge

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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

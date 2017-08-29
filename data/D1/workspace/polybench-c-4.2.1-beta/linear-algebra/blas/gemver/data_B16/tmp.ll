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
  br i1 %25, label %26, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %.._crit_edge_crit_edge33

.._crit_edge_crit_edge33:                         ; preds = %26
  br label %._crit_edge

; <label>:29:                                     ; preds = %26
  call fastcc void @print_array(double* %19)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge33, %.._crit_edge_crit_edge, %29
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
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %43, label %.loopexit..loopexit._crit_edge_crit_edge

.loopexit..loopexit._crit_edge_crit_edge:         ; preds = %.loopexit
  br label %.loopexit._crit_edge

.loopexit._crit_edge:                             ; preds = %.loopexit..loopexit._crit_edge_crit_edge, %11
  %indvars.iv1 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %.loopexit..loopexit._crit_edge_crit_edge ]
  %12 = trunc i64 %indvars.iv1 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv1
  store double %13, double* %14, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %15 = trunc i64 %indvars.iv.next2 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv1
  store double %18, double* %19, align 8
  %20 = fmul double %17, 2.500000e-01
  %21 = getelementptr inbounds double, double* %4, i64 %indvars.iv1
  store double %20, double* %21, align 8
  %22 = fdiv double %17, 6.000000e+00
  %23 = getelementptr inbounds double, double* %6, i64 %indvars.iv1
  store double %22, double* %23, align 8
  %24 = fmul double %17, 1.250000e-01
  %25 = getelementptr inbounds double, double* %9, i64 %indvars.iv1
  store double %24, double* %25, align 8
  %26 = fdiv double %17, 9.000000e+00
  %27 = getelementptr inbounds double, double* %10, i64 %indvars.iv1
  store double %26, double* %27, align 8
  %28 = getelementptr inbounds double, double* %8, i64 %indvars.iv1
  store double 0.000000e+00, double* %28, align 8
  %29 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  store double 0.000000e+00, double* %29, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.loopexit._crit_edge
  %indvars.iv = phi i64 [ 0, %.loopexit._crit_edge ], [ %indvars.iv.next.1, %._crit_edge.._crit_edge_crit_edge ]
  %30 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 2000
  %33 = sitofp i32 %32 to double
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %35 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 2000
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %33, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fdiv <2 x double> %40, <double 2.000000e+03, double 2.000000e+03>
  %42 = bitcast double* %34 to <2 x double>*
  store <2 x double> %41, <2 x double>* %42, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.loopexit, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:43:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %scevgep25 = getelementptr double, double* %4, i64 2000
  %scevgep27 = getelementptr double, double* %6, i64 2000
  br label %.preheader67

.preheader67:                                     ; preds = %middle.block..preheader67_crit_edge, %11
  %indvars.iv16 = phi i64 [ 0, %11 ], [ %12, %middle.block..preheader67_crit_edge ]
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
  br i1 %conflict.rdx42, label %._crit_edge.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader67
  br label %vector.body

._crit_edge.preheader:                            ; preds = %.preheader67
  br label %._crit_edge

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
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
  %33 = fmul <2 x double> %19, %strided.vec46
  %34 = fadd <2 x double> %strided.vec43, %33
  %35 = fmul <2 x double> %26, %strided.vec49
  %36 = fadd <2 x double> %34, %35
  %37 = getelementptr double, double* %32, i64 -1
  %38 = bitcast double* %37 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %30, <2 x double> %36, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %38, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %39 = icmp eq i64 %index.next, 1000
  br i1 %39, label %middle.block.loopexit51, label %vector.body.vector.body_crit_edge, !llvm.loop !13

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge.preheader
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.1, %._crit_edge.._crit_edge_crit_edge ], [ 0, %._crit_edge.preheader ]
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %41 = load double, double* %40, align 8
  %42 = load double, double* %13, align 8
  %43 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %41, %45
  %47 = load double, double* %14, align 8
  %48 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %46, %50
  store double %51, double* %40, align 8
  %indvars.iv.next14 = or i64 %indvars.iv13, 1
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  %53 = load double, double* %52, align 8
  %54 = load double, double* %13, align 8
  %55 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next14
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %53, %57
  %59 = load double, double* %14, align 8
  %60 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next14
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %58, %62
  store double %63, double* %52, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next14.1, 2000
  br i1 %exitcond15.1, label %middle.block.loopexit, label %._crit_edge.._crit_edge_crit_edge, !llvm.loop !16

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

middle.block.loopexit:                            ; preds = %._crit_edge
  br label %middle.block

middle.block.loopexit51:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit51, %middle.block.loopexit
  %exitcond18 = icmp eq i64 %12, 2000
  br i1 %exitcond18, label %.preheader65.preheader, label %middle.block..preheader67_crit_edge

middle.block..preheader67_crit_edge:              ; preds = %middle.block
  br label %.preheader67

.preheader65.preheader:                           ; preds = %middle.block
  br label %.preheader65

.preheader65:                                     ; preds = %..preheader65_crit_edge, %.preheader65.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %..preheader65_crit_edge ], [ 0, %.preheader65.preheader ]
  %64 = getelementptr inbounds double, double* %8, i64 %indvars.iv10
  %.pre = load double, double* %64, align 8
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.._crit_edge19_crit_edge, %.preheader65
  %65 = phi double [ %.pre, %.preheader65 ], [ %79, %._crit_edge19.._crit_edge19_crit_edge ]
  %indvars.iv7 = phi i64 [ 0, %.preheader65 ], [ %indvars.iv.next8.1, %._crit_edge19.._crit_edge19_crit_edge ]
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv10
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %1
  %69 = getelementptr inbounds double, double* %9, i64 %indvars.iv7
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %65, %71
  store double %72, double* %64, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv10
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, %1
  %76 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next8
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = fadd double %72, %78
  store double %79, double* %64, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2000
  br i1 %exitcond9.1, label %80, label %._crit_edge19.._crit_edge19_crit_edge

._crit_edge19.._crit_edge19_crit_edge:            ; preds = %._crit_edge19
  br label %._crit_edge19

; <label>:80:                                     ; preds = %._crit_edge19
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.preheader64.preheader, label %..preheader65_crit_edge

..preheader65_crit_edge:                          ; preds = %80
  br label %.preheader65

.preheader64.preheader:                           ; preds = %80
  br label %.preheader64

.preheader64:                                     ; preds = %.preheader64..preheader64_crit_edge, %.preheader64.preheader
  %indvars.iv4 = phi i64 [ %indvars.iv.next5.4, %.preheader64..preheader64_crit_edge ], [ 0, %.preheader64.preheader ]
  %81 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds double, double* %10, i64 %indvars.iv4
  %84 = load double, double* %83, align 8
  %85 = fadd double %82, %84
  store double %85, double* %81, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %86 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5
  %89 = load double, double* %88, align 8
  %90 = fadd double %87, %89
  store double %90, double* %86, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv4, 2
  %91 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  %92 = load double, double* %91, align 8
  %93 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.1
  %94 = load double, double* %93, align 8
  %95 = fadd double %92, %94
  store double %95, double* %91, align 8
  %indvars.iv.next5.2 = add nsw i64 %indvars.iv4, 3
  %96 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.2
  %99 = load double, double* %98, align 8
  %100 = fadd double %97, %99
  store double %100, double* %96, align 8
  %indvars.iv.next5.3 = add nsw i64 %indvars.iv4, 4
  %101 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  %102 = load double, double* %101, align 8
  %103 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.3
  %104 = load double, double* %103, align 8
  %105 = fadd double %102, %104
  store double %105, double* %101, align 8
  %indvars.iv.next5.4 = add nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 2000
  br i1 %exitcond6.4, label %.preheader.preheader, label %.preheader64..preheader64_crit_edge

.preheader64..preheader64_crit_edge:              ; preds = %.preheader64
  br label %.preheader64

.preheader.preheader:                             ; preds = %.preheader64
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %.preheader.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %106 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  %.pre50 = load double, double* %106, align 8
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.._crit_edge21_crit_edge, %.preheader
  %107 = phi double [ %.pre50, %.preheader ], [ %121, %._crit_edge21.._crit_edge21_crit_edge ]
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge21.._crit_edge21_crit_edge ]
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %109 = load double, double* %108, align 8
  %110 = fmul double %109, %0
  %111 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %112 = load double, double* %111, align 8
  %113 = fmul double %110, %112
  %114 = fadd double %107, %113
  store double %114, double* %106, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, %0
  %118 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %119 = load double, double* %118, align 8
  %120 = fmul double %117, %119
  %121 = fadd double %114, %120
  store double %121, double* %106, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %122, label %._crit_edge21.._crit_edge21_crit_edge

._crit_edge21.._crit_edge21_crit_edge:            ; preds = %._crit_edge21
  br label %._crit_edge21

; <label>:122:                                    ; preds = %._crit_edge21
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %123, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %122
  br label %.preheader

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
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge.._crit_edge1_crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge.._crit_edge1_crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge1.._crit_edge_crit_edge

._crit_edge1.._crit_edge_crit_edge:               ; preds = %._crit_edge1
  br label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge1
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1.._crit_edge_crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge.._crit_edge1_crit_edge

._crit_edge.._crit_edge1_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge1

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

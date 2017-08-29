; ModuleID = 'A.ll'
source_filename = "gemm.c"
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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_gemm(double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array([1100 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1100 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader7

.preheader7:                                      ; preds = %..preheader7_crit_edge, %5
  %indvars.iv26 = phi i64 [ 0, %5 ], [ %indvars.iv.next27, %..preheader7_crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader7
  %indvars.iv23 = phi i64 [ 0, %.preheader7 ], [ %indvars.iv.next24, %._crit_edge.._crit_edge_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv23, %indvars.iv26
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.000000e+03
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv23
  store double %11, double* %12, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 1100
  br i1 %exitcond25, label %13, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond28, label %..preheader5_crit_edge, label %..preheader7_crit_edge

..preheader7_crit_edge:                           ; preds = %13
  br label %.preheader7

..preheader5_crit_edge:                           ; preds = %13
  br label %.preheader5

.preheader5:                                      ; preds = %..preheader5_crit_edge1, %..preheader5_crit_edge
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %..preheader5_crit_edge1 ], [ 0, %..preheader5_crit_edge ]
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.._crit_edge29_crit_edge, %.preheader5
  %indvars.iv17 = phi i64 [ 0, %.preheader5 ], [ %indvars.iv.next18.1, %._crit_edge29.._crit_edge29_crit_edge ]
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %14 = mul nuw nsw i64 %indvars.iv.next18, %indvars.iv20
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1200
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.200000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv17
  store double %18, double* %19, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %20 = mul nuw nsw i64 %indvars.iv.next18.1, %indvars.iv20
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 1200
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 1.200000e+03
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv.next18
  store double %24, double* %25, align 8
  %exitcond19.1 = icmp eq i64 %indvars.iv.next18.1, 1200
  br i1 %exitcond19.1, label %26, label %._crit_edge29.._crit_edge29_crit_edge

._crit_edge29.._crit_edge29_crit_edge:            ; preds = %._crit_edge29
  br label %._crit_edge29

; <label>:26:                                     ; preds = %._crit_edge29
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond22, label %..preheader_crit_edge, label %..preheader5_crit_edge1

..preheader5_crit_edge1:                          ; preds = %26
  br label %.preheader5

..preheader_crit_edge:                            ; preds = %26
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge2, %..preheader_crit_edge
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %..preheader_crit_edge2 ], [ 0, %..preheader_crit_edge ]
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30.._crit_edge30_crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge30.._crit_edge30_crit_edge ]
  %27 = add nuw nsw i64 %indvars.iv, 2
  %28 = mul nuw nsw i64 %27, %indvars.iv14
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 1100
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 1.100000e+03
  %33 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv
  store double %32, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %34, label %._crit_edge30.._crit_edge30_crit_edge

._crit_edge30.._crit_edge30_crit_edge:            ; preds = %._crit_edge30
  br label %._crit_edge30

; <label>:34:                                     ; preds = %._crit_edge30
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %35, label %..preheader_crit_edge2

..preheader_crit_edge2:                           ; preds = %34
  br label %.preheader

; <label>:35:                                     ; preds = %34
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
  %broadcast.splatinsert12 = insertelement <2 x double> undef, double %0, i32 0
  br label %.preheader4

.preheader4:                                      ; preds = %..preheader4_crit_edge, %5
  %indvars.iv13 = phi i64 [ 0, %5 ], [ %6, %..preheader4_crit_edge ]
  %scevgep = getelementptr [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 0
  %6 = add i64 %indvars.iv13, 1
  %scevgep2 = getelementptr [1100 x double], [1100 x double]* %2, i64 %6, i64 0
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader4
  %indvars.iv = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next.4, %._crit_edge.._crit_edge_crit_edge ]
  %7 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %1
  store double %9, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv.next
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %1
  store double %12, double* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv.next.1
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %1
  store double %15, double* %13, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv.next.2
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %1
  store double %18, double* %16, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv.next.3
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %1
  store double %21, double* %19, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1100
  br i1 %exitcond.4, label %._crit_edge..preheader_crit_edge, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  br label %.preheader

.preheader:                                       ; preds = %middle.block..preheader_crit_edge, %._crit_edge..preheader_crit_edge
  %indvars.iv11 = phi i64 [ %22, %middle.block..preheader_crit_edge ], [ 0, %._crit_edge..preheader_crit_edge ]
  %scevgep4 = getelementptr [1100 x double], [1100 x double]* %4, i64 %indvars.iv11, i64 0
  %22 = add i64 %indvars.iv11, 1
  %scevgep6 = getelementptr [1100 x double], [1100 x double]* %4, i64 %22, i64 0
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv11
  %bound0 = icmp ult double* %scevgep, %23
  %bound1 = icmp ult double* %23, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult double* %scevgep, %scevgep6
  %bound110 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %.preheader.._crit_edge16_crit_edge, label %vector.ph

.preheader.._crit_edge16_crit_edge:               ; preds = %.preheader
  br label %._crit_edge16

vector.ph:                                        ; preds = %.preheader
  %.pre = load double, double* %23, align 8, !alias.scope !1
  %24 = insertelement <2 x double> undef, double %.pre, i32 0
  %25 = fmul <2 x double> %24, %broadcast.splatinsert12
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %offset.idx = shl i64 %index, 1
  %27 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv11, i64 %offset.idx
  %28 = bitcast double* %27 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %28, align 8, !alias.scope !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec14 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %29 = fmul <2 x double> %26, %strided.vec
  %30 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %offset.idx
  %31 = bitcast double* %30 to <4 x double>*
  %wide.vec15 = load <4 x double>, <4 x double>* %31, align 8, !alias.scope !6, !noalias !8
  %strided.vec16 = shufflevector <4 x double> %wide.vec15, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec17 = shufflevector <4 x double> %wide.vec15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %32 = fadd <2 x double> %strided.vec16, %29
  %33 = or i64 %offset.idx, 1
  %34 = fmul <2 x double> %26, %strided.vec14
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %33
  %36 = fadd <2 x double> %strided.vec17, %34
  %37 = getelementptr double, double* %35, i64 -1
  %38 = bitcast double* %37 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %32, <2 x double> %36, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %38, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %39 = icmp eq i64 %index.next, 550
  br i1 %39, label %vector.body.middle.block_crit_edge, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

vector.body.middle.block_crit_edge:               ; preds = %vector.body
  br label %middle.block

._crit_edge16:                                    ; preds = %._crit_edge16.._crit_edge16_crit_edge, %.preheader.._crit_edge16_crit_edge
  %indvars.iv9 = phi i64 [ %indvars.iv.next10.1, %._crit_edge16.._crit_edge16_crit_edge ], [ 0, %.preheader.._crit_edge16_crit_edge ]
  %40 = load double, double* %23, align 8
  %41 = fmul double %40, %0
  %42 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv11, i64 %indvars.iv9
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv9
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %45, align 8
  %indvars.iv.next10 = or i64 %indvars.iv9, 1
  %48 = load double, double* %23, align 8
  %49 = fmul double %48, %0
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv11, i64 %indvars.iv.next10
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv.next10
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %53, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next10.1, 1100
  br i1 %exitcond.1, label %._crit_edge16.middle.block_crit_edge, label %._crit_edge16.._crit_edge16_crit_edge, !llvm.loop !12

._crit_edge16.._crit_edge16_crit_edge:            ; preds = %._crit_edge16
  br label %._crit_edge16

._crit_edge16.middle.block_crit_edge:             ; preds = %._crit_edge16
  br label %middle.block

middle.block:                                     ; preds = %._crit_edge16.middle.block_crit_edge, %vector.body.middle.block_crit_edge
  %exitcond = icmp eq i64 %22, 1200
  br i1 %exitcond, label %56, label %middle.block..preheader_crit_edge

middle.block..preheader_crit_edge:                ; preds = %middle.block
  br label %.preheader

; <label>:56:                                     ; preds = %middle.block
  %exitcond15 = icmp eq i64 %6, 1000
  br i1 %exitcond15, label %57, label %..preheader4_crit_edge

..preheader4_crit_edge:                           ; preds = %56
  br label %.preheader4

; <label>:57:                                     ; preds = %56
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %..preheader_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv4, 1000
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge.._crit_edge._crit_edge_crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge.._crit_edge._crit_edge_crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge._crit_edge.._crit_edge_crit_edge

._crit_edge._crit_edge.._crit_edge_crit_edge:     ; preds = %._crit_edge._crit_edge
  br label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.._crit_edge_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %17, label %._crit_edge.._crit_edge._crit_edge_crit_edge

._crit_edge.._crit_edge._crit_edge_crit_edge:     ; preds = %._crit_edge
  br label %._crit_edge._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond6, label %18, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %17
  br label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
!8 = !{!2, !5}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}

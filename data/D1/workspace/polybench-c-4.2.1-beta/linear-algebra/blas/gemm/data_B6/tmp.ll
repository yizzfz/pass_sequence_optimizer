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
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_gemm(double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array([1100 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1100 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader4

.preheader4:                                      ; preds = %..preheader4_crit_edge, %5
  %indvars.iv17 = phi i64 [ 0, %5 ], [ %indvars.iv.next18, %..preheader4_crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader4
  %indvars.iv14 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next15, %._crit_edge.._crit_edge_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv14, %indvars.iv17
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.000000e+03
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv14
  store double %11, double* %12, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1100
  br i1 %exitcond16, label %13, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 1000
  br i1 %exitcond19, label %.preheader2.preheader, label %..preheader4_crit_edge

..preheader4_crit_edge:                           ; preds = %13
  br label %.preheader4

.preheader2.preheader:                            ; preds = %13
  br label %.preheader2

.preheader2:                                      ; preds = %..preheader2_crit_edge, %.preheader2.preheader
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %..preheader2_crit_edge ], [ 0, %.preheader2.preheader ]
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.._crit_edge20_crit_edge, %.preheader2
  %indvars.iv8 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next9.1, %._crit_edge20.._crit_edge20_crit_edge ]
  %indvars.iv.next9 = or i64 %indvars.iv8, 1
  %14 = mul nuw nsw i64 %indvars.iv.next9, %indvars.iv11
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1200
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv11, i64 %indvars.iv8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, 2
  %19 = mul nuw nsw i64 %indvars.iv.next9.1, %indvars.iv11
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1200
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %17, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fdiv <2 x double> %24, <double 1.200000e+03, double 1.200000e+03>
  %26 = bitcast double* %18 to <2 x double>*
  store <2 x double> %25, <2 x double>* %26, align 8
  %exitcond10.1 = icmp eq i64 %indvars.iv.next9.1, 1200
  br i1 %exitcond10.1, label %27, label %._crit_edge20.._crit_edge20_crit_edge

._crit_edge20.._crit_edge20_crit_edge:            ; preds = %._crit_edge20
  br label %._crit_edge20

; <label>:27:                                     ; preds = %._crit_edge20
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond13, label %.preheader.preheader, label %..preheader2_crit_edge

..preheader2_crit_edge:                           ; preds = %27
  br label %.preheader2

.preheader.preheader:                             ; preds = %27
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %.preheader.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.._crit_edge21_crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge21.._crit_edge21_crit_edge ]
  %28 = add nuw nsw i64 %indvars.iv, 2
  %29 = mul nuw nsw i64 %28, %indvars.iv5
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 1100
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 1.100000e+03
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv5, i64 %indvars.iv
  store double %33, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %35, label %._crit_edge21.._crit_edge21_crit_edge

._crit_edge21.._crit_edge21_crit_edge:            ; preds = %._crit_edge21
  br label %._crit_edge21

; <label>:35:                                     ; preds = %._crit_edge21
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond7, label %36, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %35
  br label %.preheader

; <label>:36:                                     ; preds = %35
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
  %6 = insertelement <2 x double> undef, double %1, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %8 = insertelement <2 x double> undef, double %1, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert21 = insertelement <2 x double> undef, double %0, i32 0
  br label %.preheader2

.preheader2:                                      ; preds = %..preheader2_crit_edge, %5
  %indvars.iv7 = phi i64 [ 0, %5 ], [ %indvars.iv.next8, %..preheader2_crit_edge ]
  %scevgep = getelementptr [1100 x double], [1100 x double]* %2, i64 %indvars.iv7, i64 0
  %10 = add i64 %indvars.iv7, 1
  %scevgep11 = getelementptr [1100 x double], [1100 x double]* %2, i64 %10, i64 0
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader2
  %indvars.iv = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next.4, %._crit_edge.._crit_edge_crit_edge ]
  %11 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv
  %12 = bitcast double* %11 to <2 x double>*
  %13 = load <2 x double>, <2 x double>* %12, align 8
  %14 = fmul <2 x double> %13, %7
  %15 = bitcast double* %11 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv.next.1
  %17 = bitcast double* %16 to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %19 = fmul <2 x double> %18, %9
  %20 = bitcast double* %16 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv.next.3
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %1
  store double %23, double* %21, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1100
  br i1 %exitcond.4, label %.preheader.preheader, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

.preheader.preheader:                             ; preds = %._crit_edge
  br label %.preheader

.preheader:                                       ; preds = %middle.block._crit_edge..preheader_crit_edge, %.preheader.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %middle.block._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %scevgep13 = getelementptr [1100 x double], [1100 x double]* %4, i64 %indvars.iv5, i64 0
  %24 = add i64 %indvars.iv5, 1
  %scevgep15 = getelementptr [1100 x double], [1100 x double]* %4, i64 %24, i64 0
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv7, i64 %indvars.iv5
  %bound0 = icmp ult double* %scevgep, %25
  %bound1 = icmp ult double* %25, %scevgep11
  %found.conflict = and i1 %bound0, %bound1
  %bound018 = icmp ult double* %scevgep, %scevgep15
  %bound119 = icmp ult double* %scevgep13, %scevgep11
  %found.conflict20 = and i1 %bound018, %bound119
  %conflict.rdx = or i1 %found.conflict, %found.conflict20
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.ph

scalar.ph.preheader:                              ; preds = %.preheader
  br label %scalar.ph

vector.ph:                                        ; preds = %.preheader
  %26 = load double, double* %25, align 8, !alias.scope !1
  %27 = insertelement <2 x double> undef, double %26, i32 0
  %28 = fmul <2 x double> %27, %broadcast.splatinsert21
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = load double, double* %25, align 8, !alias.scope !1
  %31 = insertelement <2 x double> undef, double %30, i32 0
  %32 = fmul <2 x double> %31, %broadcast.splatinsert21
  %33 = shufflevector <2 x double> %32, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %offset.idx = shl i64 %index, 1
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv5, i64 %offset.idx
  %35 = bitcast double* %34 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %35, align 8, !alias.scope !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec23 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %36 = fmul <2 x double> %29, %strided.vec
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv7, i64 %offset.idx
  %38 = bitcast double* %37 to <4 x double>*
  %wide.vec24 = load <4 x double>, <4 x double>* %38, align 8, !alias.scope !6, !noalias !8
  %strided.vec25 = shufflevector <4 x double> %wide.vec24, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec26 = shufflevector <4 x double> %wide.vec24, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %39 = fadd <2 x double> %strided.vec25, %36
  %40 = or i64 %offset.idx, 1
  %41 = fmul <2 x double> %33, %strided.vec23
  %42 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv7, i64 %40
  %43 = fadd <2 x double> %strided.vec26, %41
  %44 = getelementptr double, double* %42, i64 -1
  %45 = bitcast double* %44 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %39, <2 x double> %43, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %45, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %46 = icmp eq i64 %index.next, 550
  br i1 %46, label %middle.block._crit_edge.loopexit28, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv3 = phi i64 [ %indvars.iv.next4.1, %scalar.ph.scalar.ph_crit_edge ], [ 0, %scalar.ph.preheader ]
  %47 = load double, double* %25, align 8
  %48 = fmul double %47, %0
  %49 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv5, i64 %indvars.iv3
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv3
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %52, align 8
  %indvars.iv.next4 = or i64 %indvars.iv3, 1
  %55 = load double, double* %25, align 8
  %56 = fmul double %55, %0
  %57 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv5, i64 %indvars.iv.next4
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv.next4
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %60, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv3, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next4.1, 1100
  br i1 %exitcond.1, label %middle.block._crit_edge.loopexit, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !12

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

middle.block._crit_edge.loopexit:                 ; preds = %scalar.ph
  br label %middle.block._crit_edge

middle.block._crit_edge.loopexit28:               ; preds = %vector.body
  br label %middle.block._crit_edge

middle.block._crit_edge:                          ; preds = %middle.block._crit_edge.loopexit28, %middle.block._crit_edge.loopexit
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond, label %63, label %middle.block._crit_edge..preheader_crit_edge

middle.block._crit_edge..preheader_crit_edge:     ; preds = %middle.block._crit_edge
  br label %.preheader

; <label>:63:                                     ; preds = %middle.block._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %64, label %..preheader2_crit_edge

..preheader2_crit_edge:                           ; preds = %63
  br label %.preheader2

; <label>:64:                                     ; preds = %63
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
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %..preheader_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge.._crit_edge4_crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge.._crit_edge4_crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge4.._crit_edge_crit_edge

._crit_edge4.._crit_edge_crit_edge:               ; preds = %._crit_edge4
  br label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4.._crit_edge_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %17, label %._crit_edge.._crit_edge4_crit_edge

._crit_edge.._crit_edge4_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge4

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %18, label %..preheader_crit_edge

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
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !5}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}

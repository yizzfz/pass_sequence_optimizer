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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array([1100 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
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
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %13, %5
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %13 ], [ 0, %5 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge ], [ 0, %._crit_edge.preheader ]
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
  br i1 %exitcond25, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond28, label %._crit_edge5.preheader.preheader, label %._crit_edge.preheader

._crit_edge5.preheader.preheader:                 ; preds = %13
  br label %._crit_edge5.preheader

._crit_edge5.preheader:                           ; preds = %._crit_edge5.preheader.preheader, %._crit_edge4
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge4 ], [ 0, %._crit_edge5.preheader.preheader ]
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5, %._crit_edge5.preheader
  %indvars.iv17 = phi i64 [ 0, %._crit_edge5.preheader ], [ %indvars.iv.next18.1, %._crit_edge5 ]
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %14 = mul nuw nsw i64 %indvars.iv.next18, %indvars.iv20
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1200
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv17
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %19 = mul nuw nsw i64 %indvars.iv.next18.1, %indvars.iv20
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1200
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %17, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fdiv <2 x double> %24, <double 1.200000e+03, double 1.200000e+03>
  %26 = bitcast double* %18 to <2 x double>*
  store <2 x double> %25, <2 x double>* %26, align 8
  %exitcond19.1 = icmp eq i64 %indvars.iv.next18.1, 1200
  br i1 %exitcond19.1, label %._crit_edge4, label %._crit_edge5

._crit_edge4:                                     ; preds = %._crit_edge5
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond22, label %._crit_edge7.preheader.preheader, label %._crit_edge5.preheader

._crit_edge7.preheader.preheader:                 ; preds = %._crit_edge4
  br label %._crit_edge7.preheader

._crit_edge7.preheader:                           ; preds = %._crit_edge7.preheader.preheader, %._crit_edge6
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge6 ], [ 0, %._crit_edge7.preheader.preheader ]
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7, %._crit_edge7.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge7 ], [ 0, %._crit_edge7.preheader ]
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
  br i1 %exitcond, label %._crit_edge6, label %._crit_edge7

._crit_edge6:                                     ; preds = %._crit_edge7
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %34, label %._crit_edge7.preheader

; <label>:34:                                     ; preds = %._crit_edge6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
  %6 = insertelement <2 x double> undef, double %1, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert12 = insertelement <2 x double> undef, double %0, i32 0
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %55, %5
  %indvars.iv15 = phi i64 [ %8, %55 ], [ 0, %5 ]
  %scevgep = getelementptr [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 0
  %8 = add i64 %indvars.iv15, 1
  %scevgep2 = getelementptr [1100 x double], [1100 x double]* %2, i64 %8, i64 0
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next.4, %._crit_edge ]
  %9 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %10 = bitcast double* %9 to <2 x double>*
  %11 = load <2 x double>, <2 x double>* %10, align 8
  %12 = fmul <2 x double> %11, %7
  store <2 x double> %12, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv.next.1
  %14 = bitcast double* %13 to <2 x double>*
  %15 = load <2 x double>, <2 x double>* %14, align 8
  %16 = fmul <2 x double> %15, %7
  store <2 x double> %16, <2 x double>* %14, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv.next.3
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %1
  store double %19, double* %17, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1100
  br i1 %exitcond.4, label %._crit_edge4.preheader.preheader, label %._crit_edge

._crit_edge4.preheader.preheader:                 ; preds = %._crit_edge
  br label %._crit_edge4.preheader

._crit_edge4.preheader:                           ; preds = %._crit_edge4.preheader.preheader, %._crit_edge3
  %indvars.iv12 = phi i64 [ %20, %._crit_edge3 ], [ 0, %._crit_edge4.preheader.preheader ]
  %scevgep4 = getelementptr [1100 x double], [1100 x double]* %4, i64 %indvars.iv12, i64 0
  %20 = add i64 %indvars.iv12, 1
  %scevgep6 = getelementptr [1100 x double], [1100 x double]* %4, i64 %20, i64 0
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv15, i64 %indvars.iv12
  %bound0 = icmp ult double* %scevgep, %21
  %bound1 = icmp ult double* %21, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult double* %scevgep, %scevgep6
  %bound110 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %._crit_edge4.preheader18, label %vector.ph

._crit_edge4.preheader18:                         ; preds = %._crit_edge4.preheader
  br label %._crit_edge4

vector.ph:                                        ; preds = %._crit_edge4.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %22 = load double, double* %21, align 8, !alias.scope !1
  %23 = insertelement <2 x double> undef, double %22, i32 0
  %24 = fmul <2 x double> %23, %broadcast.splatinsert12
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv12, i64 %offset.idx
  %27 = bitcast double* %26 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %27, align 8, !alias.scope !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec14 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %28 = fmul <2 x double> %25, %strided.vec
  %29 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %offset.idx
  %30 = bitcast double* %29 to <4 x double>*
  %wide.vec15 = load <4 x double>, <4 x double>* %30, align 8, !alias.scope !6, !noalias !8
  %strided.vec16 = shufflevector <4 x double> %wide.vec15, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec17 = shufflevector <4 x double> %wide.vec15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %31 = fadd <2 x double> %strided.vec16, %28
  %32 = or i64 %offset.idx, 1
  %33 = fmul <2 x double> %25, %strided.vec14
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %32
  %35 = fadd <2 x double> %strided.vec17, %33
  %36 = getelementptr double, double* %34, i64 -1
  %37 = bitcast double* %36 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %31, <2 x double> %35, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %37, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %38 = icmp eq i64 %index.next, 550
  br i1 %38, label %._crit_edge3.loopexit19, label %vector.body, !llvm.loop !9

._crit_edge4:                                     ; preds = %._crit_edge4.preheader18, %._crit_edge4
  %indvars.iv9 = phi i64 [ %indvars.iv.next10.1, %._crit_edge4 ], [ 0, %._crit_edge4.preheader18 ]
  %39 = load double, double* %21, align 8
  %40 = fmul double %39, %0
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv12, i64 %indvars.iv9
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv9
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next10 = or i64 %indvars.iv9, 1
  %47 = load double, double* %21, align 8
  %48 = fmul double %47, %0
  %49 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv12, i64 %indvars.iv.next10
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv.next10
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %52, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %exitcond11.1 = icmp eq i64 %indvars.iv.next10.1, 1100
  br i1 %exitcond11.1, label %._crit_edge3.loopexit, label %._crit_edge4, !llvm.loop !12

._crit_edge3.loopexit:                            ; preds = %._crit_edge4
  br label %._crit_edge3

._crit_edge3.loopexit19:                          ; preds = %vector.body
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit19, %._crit_edge3.loopexit
  %exitcond14 = icmp eq i64 %20, 1200
  br i1 %exitcond14, label %55, label %._crit_edge4.preheader

; <label>:55:                                     ; preds = %._crit_edge3
  %exitcond17 = icmp eq i64 %8, 1000
  br i1 %exitcond17, label %56, label %._crit_edge.preheader

; <label>:56:                                     ; preds = %55
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
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %17, %1
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %17 ], [ 0, %1 ]
  %6 = mul nuw nsw i64 %indvars.iv5, 1000
  br label %._crit_edge2._crit_edge

._crit_edge2._crit_edge:                          ; preds = %._crit_edge2, %._crit_edge.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2 ], [ 0, %._crit_edge.preheader ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge2

; <label>:11:                                     ; preds = %._crit_edge2._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %17, label %._crit_edge2._crit_edge

; <label>:17:                                     ; preds = %._crit_edge2
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %18, label %._crit_edge.preheader

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

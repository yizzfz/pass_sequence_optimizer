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
  %indvars.iv26 = phi i64 [ 0, %5 ], [ %indvars.iv.next27, %13 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv23 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next24, %._crit_edge ]
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
  %18 = fdiv double %17, 1.200000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv17
  store double %18, double* %19, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv17, 2
  %20 = mul nuw nsw i64 %indvars.iv.next18.1, %indvars.iv20
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 1200
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 1.200000e+03
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv.next18
  store double %24, double* %25, align 8
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
  %indvars.iv = phi i64 [ 0, %._crit_edge7.preheader ], [ %indvars.iv.next, %._crit_edge7 ]
  %26 = add nuw nsw i64 %indvars.iv, 2
  %27 = mul nuw nsw i64 %26, %indvars.iv14
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1100
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.100000e+03
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv
  store double %31, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge6, label %._crit_edge7

._crit_edge6:                                     ; preds = %._crit_edge7
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %33, label %._crit_edge7.preheader

; <label>:33:                                     ; preds = %._crit_edge6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
  %broadcast.splatinsert12 = insertelement <2 x double> undef, double %0, i32 0
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %57, %5
  %indvars.iv15 = phi i64 [ 0, %5 ], [ %6, %57 ]
  %scevgep = getelementptr [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 0
  %6 = add i64 %indvars.iv15, 1
  %scevgep2 = getelementptr [1100 x double], [1100 x double]* %2, i64 %6, i64 0
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next.4, %._crit_edge ]
  %7 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %1
  store double %9, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv.next
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %1
  store double %12, double* %10, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv.next.1
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %1
  store double %15, double* %13, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv.next.2
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %1
  store double %18, double* %16, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv.next.3
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %1
  store double %21, double* %19, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1100
  br i1 %exitcond.4, label %._crit_edge4.preheader.preheader, label %._crit_edge

._crit_edge4.preheader.preheader:                 ; preds = %._crit_edge
  br label %._crit_edge4.preheader

._crit_edge4.preheader:                           ; preds = %._crit_edge4.preheader.preheader, %._crit_edge3
  %indvars.iv12 = phi i64 [ %22, %._crit_edge3 ], [ 0, %._crit_edge4.preheader.preheader ]
  %scevgep4 = getelementptr [1100 x double], [1100 x double]* %4, i64 %indvars.iv12, i64 0
  %22 = add i64 %indvars.iv12, 1
  %scevgep6 = getelementptr [1100 x double], [1100 x double]* %4, i64 %22, i64 0
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv15, i64 %indvars.iv12
  %bound0 = icmp ult double* %scevgep, %23
  %bound1 = icmp ult double* %23, %scevgep2
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
  %24 = load double, double* %23, align 8, !alias.scope !1
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = fmul <2 x double> %25, %broadcast.splatinsert12
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv12, i64 %offset.idx
  %29 = bitcast double* %28 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %29, align 8, !alias.scope !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec14 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %30 = fmul <2 x double> %27, %strided.vec
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %offset.idx
  %32 = bitcast double* %31 to <4 x double>*
  %wide.vec15 = load <4 x double>, <4 x double>* %32, align 8, !alias.scope !6, !noalias !8
  %strided.vec16 = shufflevector <4 x double> %wide.vec15, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec17 = shufflevector <4 x double> %wide.vec15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %33 = fadd <2 x double> %strided.vec16, %30
  %34 = or i64 %offset.idx, 1
  %35 = fmul <2 x double> %27, %strided.vec14
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %34
  %37 = fadd <2 x double> %strided.vec17, %35
  %38 = getelementptr double, double* %36, i64 -1
  %39 = bitcast double* %38 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %33, <2 x double> %37, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %39, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %40 = icmp eq i64 %index.next, 550
  br i1 %40, label %._crit_edge3.loopexit19, label %vector.body, !llvm.loop !9

._crit_edge4:                                     ; preds = %._crit_edge4.preheader18, %._crit_edge4
  %indvars.iv9 = phi i64 [ %indvars.iv.next10.1, %._crit_edge4 ], [ 0, %._crit_edge4.preheader18 ]
  %41 = load double, double* %23, align 8
  %42 = fmul double %41, %0
  %43 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv12, i64 %indvars.iv9
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv9
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  store double %48, double* %46, align 8
  %indvars.iv.next10 = or i64 %indvars.iv9, 1
  %49 = load double, double* %23, align 8
  %50 = fmul double %49, %0
  %51 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv12, i64 %indvars.iv.next10
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv.next10
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  store double %56, double* %54, align 8
  %indvars.iv.next10.1 = add nuw nsw i64 %indvars.iv9, 2
  %exitcond11.1 = icmp eq i64 %indvars.iv.next10.1, 1100
  br i1 %exitcond11.1, label %._crit_edge3.loopexit, label %._crit_edge4, !llvm.loop !12

._crit_edge3.loopexit:                            ; preds = %._crit_edge4
  br label %._crit_edge3

._crit_edge3.loopexit19:                          ; preds = %vector.body
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit19, %._crit_edge3.loopexit
  %exitcond14 = icmp eq i64 %22, 1200
  br i1 %exitcond14, label %57, label %._crit_edge4.preheader

; <label>:57:                                     ; preds = %._crit_edge3
  %exitcond17 = icmp eq i64 %6, 1000
  br i1 %exitcond17, label %58, label %._crit_edge.preheader

; <label>:58:                                     ; preds = %57
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
  %indvars.iv5 = phi i64 [ 0, %1 ], [ %indvars.iv.next6, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv5, 1000
  br label %._crit_edge2._crit_edge

._crit_edge2._crit_edge:                          ; preds = %._crit_edge2, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge2 ]
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

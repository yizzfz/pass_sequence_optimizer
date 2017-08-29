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
  %indvars.iv13 = phi i64 [ 0, %5 ], [ %indvars.iv.next14, %13 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv10 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next11, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv10, %indvars.iv13
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.000000e+03
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv10
  store double %11, double* %12, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1100
  br i1 %exitcond12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond15, label %._crit_edge5.preheader.preheader, label %._crit_edge.preheader

._crit_edge5.preheader.preheader:                 ; preds = %13
  br label %._crit_edge5.preheader

._crit_edge5.preheader:                           ; preds = %._crit_edge5.preheader.preheader, %._crit_edge4
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge4 ], [ 0, %._crit_edge5.preheader.preheader ]
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5, %._crit_edge5.preheader
  %indvars.iv4 = phi i64 [ 0, %._crit_edge5.preheader ], [ %indvars.iv.next5.1, %._crit_edge5 ]
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %14 = mul nuw nsw i64 %indvars.iv.next5, %indvars.iv7
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1200
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv7, i64 %indvars.iv4
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %19 = mul nuw nsw i64 %indvars.iv.next5.1, %indvars.iv7
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1200
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %17, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fdiv <2 x double> %24, <double 1.200000e+03, double 1.200000e+03>
  %26 = bitcast double* %18 to <2 x double>*
  store <2 x double> %25, <2 x double>* %26, align 8
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5.1, 1200
  br i1 %exitcond6.1, label %._crit_edge4, label %._crit_edge5

._crit_edge4:                                     ; preds = %._crit_edge5
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %._crit_edge7.preheader.preheader, label %._crit_edge5.preheader

._crit_edge7.preheader.preheader:                 ; preds = %._crit_edge4
  br label %._crit_edge7.preheader

._crit_edge7.preheader:                           ; preds = %._crit_edge7.preheader.preheader, %._crit_edge6
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge6 ], [ 0, %._crit_edge7.preheader.preheader ]
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7, %._crit_edge7.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge7.preheader ], [ %indvars.iv.next, %._crit_edge7 ]
  %27 = add nuw nsw i64 %indvars.iv, 2
  %28 = mul nuw nsw i64 %27, %indvars.iv1
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 1100
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 1.100000e+03
  %33 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv1, i64 %indvars.iv
  store double %32, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge6, label %._crit_edge7

._crit_edge6:                                     ; preds = %._crit_edge7
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %34, label %._crit_edge7.preheader

; <label>:34:                                     ; preds = %._crit_edge6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
  %broadcast.splatinsert19 = insertelement <2 x double> undef, double %0, i32 0
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %59, %5
  %indvars.iv5 = phi i64 [ 0, %5 ], [ %6, %59 ]
  %scevgep = getelementptr [1100 x double], [1100 x double]* %2, i64 %indvars.iv5, i64 0
  %6 = add i64 %indvars.iv5, 1
  %scevgep9 = getelementptr [1100 x double], [1100 x double]* %2, i64 %6, i64 0
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next.4, %._crit_edge ]
  %7 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  %8 = bitcast double* %7 to <2 x double>*
  %9 = load <2 x double>, <2 x double>* %8, align 8
  %10 = insertelement <2 x double> undef, double %1, i32 0
  %11 = insertelement <2 x double> %10, double %1, i32 1
  %12 = fmul <2 x double> %9, %11
  %13 = bitcast double* %7 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv.next.1
  %15 = bitcast double* %14 to <2 x double>*
  %16 = load <2 x double>, <2 x double>* %15, align 8
  %17 = insertelement <2 x double> undef, double %1, i32 0
  %18 = insertelement <2 x double> %17, double %1, i32 1
  %19 = fmul <2 x double> %16, %18
  %20 = bitcast double* %14 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv.next.3
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %1
  store double %23, double* %21, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1100
  br i1 %exitcond.4, label %._crit_edge4.preheader.preheader, label %._crit_edge

._crit_edge4.preheader.preheader:                 ; preds = %._crit_edge
  br label %._crit_edge4.preheader

._crit_edge4.preheader:                           ; preds = %._crit_edge4.preheader.preheader, %._crit_edge3
  %indvars.iv3 = phi i64 [ %24, %._crit_edge3 ], [ 0, %._crit_edge4.preheader.preheader ]
  %scevgep11 = getelementptr [1100 x double], [1100 x double]* %4, i64 %indvars.iv3, i64 0
  %24 = add i64 %indvars.iv3, 1
  %scevgep13 = getelementptr [1100 x double], [1100 x double]* %4, i64 %24, i64 0
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv3
  %bound0 = icmp ult double* %scevgep, %25
  %bound1 = icmp ult double* %25, %scevgep9
  %found.conflict = and i1 %bound0, %bound1
  %bound016 = icmp ult double* %scevgep, %scevgep13
  %bound117 = icmp ult double* %scevgep11, %scevgep9
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx = or i1 %found.conflict, %found.conflict18
  br i1 %conflict.rdx, label %._crit_edge4.preheader25, label %vector.ph

._crit_edge4.preheader25:                         ; preds = %._crit_edge4.preheader
  br label %._crit_edge4

vector.ph:                                        ; preds = %._crit_edge4.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %26 = load double, double* %25, align 8, !alias.scope !1
  %27 = insertelement <2 x double> undef, double %26, i32 0
  %28 = fmul <2 x double> %27, %broadcast.splatinsert19
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv3, i64 %offset.idx
  %31 = bitcast double* %30 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %31, align 8, !alias.scope !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec21 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %32 = fmul <2 x double> %29, %strided.vec
  %33 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv5, i64 %offset.idx
  %34 = bitcast double* %33 to <4 x double>*
  %wide.vec22 = load <4 x double>, <4 x double>* %34, align 8, !alias.scope !6, !noalias !8
  %strided.vec23 = shufflevector <4 x double> %wide.vec22, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec24 = shufflevector <4 x double> %wide.vec22, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %35 = fadd <2 x double> %strided.vec23, %32
  %36 = or i64 %offset.idx, 1
  %37 = fmul <2 x double> %29, %strided.vec21
  %38 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv5, i64 %36
  %39 = fadd <2 x double> %strided.vec24, %37
  %40 = getelementptr double, double* %38, i64 -1
  %41 = bitcast double* %40 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %35, <2 x double> %39, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %41, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %42 = icmp eq i64 %index.next, 550
  br i1 %42, label %._crit_edge3.loopexit26, label %vector.body, !llvm.loop !9

._crit_edge4:                                     ; preds = %._crit_edge4.preheader25, %._crit_edge4
  %indvars.iv1 = phi i64 [ %indvars.iv.next2.1, %._crit_edge4 ], [ 0, %._crit_edge4.preheader25 ]
  %43 = load double, double* %25, align 8
  %44 = fmul double %43, %0
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv3, i64 %indvars.iv1
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv1
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %48, align 8
  %indvars.iv.next2 = or i64 %indvars.iv1, 1
  %51 = load double, double* %25, align 8
  %52 = fmul double %51, %0
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv3, i64 %indvars.iv.next2
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv.next2
  %57 = load double, double* %56, align 8
  %58 = fadd double %57, %55
  store double %58, double* %56, align 8
  %indvars.iv.next2.1 = add nuw nsw i64 %indvars.iv1, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next2.1, 1100
  br i1 %exitcond.1, label %._crit_edge3.loopexit, label %._crit_edge4, !llvm.loop !12

._crit_edge3.loopexit:                            ; preds = %._crit_edge4
  br label %._crit_edge3

._crit_edge3.loopexit26:                          ; preds = %vector.body
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit26, %._crit_edge3.loopexit
  %exitcond = icmp eq i64 %24, 1200
  br i1 %exitcond, label %59, label %._crit_edge4.preheader

; <label>:59:                                     ; preds = %._crit_edge3
  %exitcond7 = icmp eq i64 %6, 1000
  br i1 %exitcond7, label %60, label %._crit_edge.preheader

; <label>:60:                                     ; preds = %59
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

._crit_edge.preheader:                            ; preds = %18, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge2, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge2 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge2
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %19, label %._crit_edge.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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

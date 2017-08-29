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
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %16, %8
  %indvars.iv65 = phi i64 [ 0, %8 ], [ %indvars.iv.next66, %16 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv62 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next63, %._crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv62, %indvars.iv65
  %10 = add nuw nsw i64 %9, 1
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 1000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv65, i64 %indvars.iv62
  store double %14, double* %15, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next63, 1100
  br i1 %exitcond64, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next66, 1000
  br i1 %exitcond67, label %._crit_edge44.preheader.preheader, label %._crit_edge.preheader

._crit_edge44.preheader.preheader:                ; preds = %16
  br label %._crit_edge44.preheader

._crit_edge44.preheader:                          ; preds = %._crit_edge44.preheader.preheader, %._crit_edge43
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge43 ], [ 0, %._crit_edge44.preheader.preheader ]
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44, %._crit_edge44.preheader
  %indvars.iv56 = phi i64 [ 0, %._crit_edge44.preheader ], [ %indvars.iv.next57.1, %._crit_edge44 ]
  %indvars.iv.next57 = or i64 %indvars.iv56, 1
  %17 = mul nuw nsw i64 %indvars.iv.next57, %indvars.iv59
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 1200
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 1.200000e+03
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv59, i64 %indvars.iv56
  store double %21, double* %22, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %23 = mul nuw nsw i64 %indvars.iv.next57.1, %indvars.iv59
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 1200
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.200000e+03
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv59, i64 %indvars.iv.next57
  store double %27, double* %28, align 8
  %exitcond58.1 = icmp eq i64 %indvars.iv.next57.1, 1200
  br i1 %exitcond58.1, label %._crit_edge43, label %._crit_edge44

._crit_edge43:                                    ; preds = %._crit_edge44
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next60, 1000
  br i1 %exitcond61, label %._crit_edge46.preheader.preheader, label %._crit_edge44.preheader

._crit_edge46.preheader.preheader:                ; preds = %._crit_edge43
  br label %._crit_edge46.preheader

._crit_edge46.preheader:                          ; preds = %._crit_edge46.preheader.preheader, %._crit_edge45
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge45 ], [ 0, %._crit_edge46.preheader.preheader ]
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge46, %._crit_edge46.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge46.preheader ], [ %indvars.iv.next, %._crit_edge46 ]
  %29 = add nuw nsw i64 %indvars.iv, 2
  %30 = mul nuw nsw i64 %29, %indvars.iv53
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 1100
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 1.100000e+03
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv53, i64 %indvars.iv
  store double %34, double* %35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge45, label %._crit_edge46

._crit_edge45:                                    ; preds = %._crit_edge46
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next54, 1200
  br i1 %exitcond55, label %36, label %._crit_edge46.preheader

; <label>:36:                                     ; preds = %._crit_edge45
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
  %broadcast.splatinsert51 = insertelement <2 x double> undef, double %3, i32 0
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %59, %8
  %indvars.iv37 = phi i64 [ 0, %8 ], [ %9, %59 ]
  %scevgep = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv37, i64 0
  %9 = add i64 %indvars.iv37, 1
  %scevgep41 = getelementptr [1100 x double], [1100 x double]* %5, i64 %9, i64 0
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next.4, %._crit_edge ]
  %10 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %4
  store double %12, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %4
  store double %15, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv.next.1
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %4
  store double %18, double* %16, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv.next.2
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %4
  store double %21, double* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %22 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv.next.3
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %4
  store double %24, double* %22, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1100
  br i1 %exitcond.4, label %._crit_edge28.preheader.preheader, label %._crit_edge

._crit_edge28.preheader.preheader:                ; preds = %._crit_edge
  br label %._crit_edge28.preheader

._crit_edge28.preheader:                          ; preds = %._crit_edge28.preheader.preheader, %._crit_edge27
  %indvars.iv35 = phi i64 [ %25, %._crit_edge27 ], [ 0, %._crit_edge28.preheader.preheader ]
  %scevgep43 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv35, i64 0
  %25 = add i64 %indvars.iv35, 1
  %scevgep45 = getelementptr [1100 x double], [1100 x double]* %7, i64 %25, i64 0
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv35
  %bound0 = icmp ult double* %scevgep, %26
  %bound1 = icmp ult double* %26, %scevgep41
  %found.conflict = and i1 %bound0, %bound1
  %bound048 = icmp ult double* %scevgep, %scevgep45
  %bound149 = icmp ult double* %scevgep43, %scevgep41
  %found.conflict50 = and i1 %bound048, %bound149
  %conflict.rdx = or i1 %found.conflict, %found.conflict50
  br i1 %conflict.rdx, label %._crit_edge28.preheader57, label %vector.ph

._crit_edge28.preheader57:                        ; preds = %._crit_edge28.preheader
  br label %._crit_edge28

vector.ph:                                        ; preds = %._crit_edge28.preheader
  %.pre = load double, double* %26, align 8, !alias.scope !1
  %27 = insertelement <2 x double> undef, double %.pre, i32 0
  %28 = fmul <2 x double> %27, %broadcast.splatinsert51
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %30 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv35, i64 %offset.idx
  %31 = bitcast double* %30 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %31, align 8, !alias.scope !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec53 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %32 = fmul <2 x double> %29, %strided.vec
  %33 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv37, i64 %offset.idx
  %34 = bitcast double* %33 to <4 x double>*
  %wide.vec54 = load <4 x double>, <4 x double>* %34, align 8, !alias.scope !6, !noalias !8
  %strided.vec55 = shufflevector <4 x double> %wide.vec54, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec56 = shufflevector <4 x double> %wide.vec54, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %35 = fadd <2 x double> %strided.vec55, %32
  %36 = or i64 %offset.idx, 1
  %37 = fmul <2 x double> %29, %strided.vec53
  %38 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv37, i64 %36
  %39 = fadd <2 x double> %strided.vec56, %37
  %40 = getelementptr double, double* %38, i64 -1
  %41 = bitcast double* %40 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %35, <2 x double> %39, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %41, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %42 = icmp eq i64 %index.next, 550
  br i1 %42, label %._crit_edge27.loopexit58, label %vector.body, !llvm.loop !9

._crit_edge28:                                    ; preds = %._crit_edge28.preheader57, %._crit_edge28
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %._crit_edge28 ], [ 0, %._crit_edge28.preheader57 ]
  %43 = load double, double* %26, align 8
  %44 = fmul double %43, %3
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv35, i64 %indvars.iv33
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv33
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %48, align 8
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %51 = load double, double* %26, align 8
  %52 = fmul double %51, %3
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv35, i64 %indvars.iv.next34
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv.next34
  %57 = load double, double* %56, align 8
  %58 = fadd double %57, %55
  store double %58, double* %56, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next34.1, 1100
  br i1 %exitcond.1, label %._crit_edge27.loopexit, label %._crit_edge28, !llvm.loop !12

._crit_edge27.loopexit:                           ; preds = %._crit_edge28
  br label %._crit_edge27

._crit_edge27.loopexit58:                         ; preds = %vector.body
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit58, %._crit_edge27.loopexit
  %exitcond = icmp eq i64 %25, 1200
  br i1 %exitcond, label %59, label %._crit_edge28.preheader

; <label>:59:                                     ; preds = %._crit_edge27
  %exitcond39 = icmp eq i64 %9, 1000
  br i1 %exitcond39, label %60, label %._crit_edge.preheader

; <label>:60:                                     ; preds = %59
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %20, %3
  %indvars.iv15 = phi i64 [ 0, %3 ], [ %indvars.iv.next16, %20 ]
  %8 = mul nuw nsw i64 %indvars.iv15, 1000
  br label %9

; <label>:9:                                      ; preds = %._crit_edge12, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge12 ]
  %10 = add nuw nsw i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge12

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %20, label %9

; <label>:20:                                     ; preds = %._crit_edge12
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %21, label %._crit_edge.preheader

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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

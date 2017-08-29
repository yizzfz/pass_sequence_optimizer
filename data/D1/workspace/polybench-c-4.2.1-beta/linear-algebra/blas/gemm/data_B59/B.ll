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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array([1100 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
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
  br label %.preheader46

.preheader46:                                     ; preds = %14, %5
  %indvars.iv65 = phi i64 [ 0, %5 ], [ %indvars.iv.next66, %14 ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader46
  %indvars.iv62 = phi i64 [ 0, %.preheader46 ], [ %indvars.iv.next63, %6 ]
  %7 = mul nuw nsw i64 %indvars.iv62, %indvars.iv65
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.000000e+03
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv65, i64 %indvars.iv62
  store double %12, double* %13, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next63, 1100
  br i1 %exitcond64, label %14, label %6

; <label>:14:                                     ; preds = %6
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next66, 1000
  br i1 %exitcond67, label %.preheader44.preheader, label %.preheader46

.preheader44.preheader:                           ; preds = %14
  br label %.preheader44

.preheader44:                                     ; preds = %.preheader44.preheader, %28
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %28 ], [ 0, %.preheader44.preheader ]
  br label %15

; <label>:15:                                     ; preds = %15, %.preheader44
  %indvars.iv56 = phi i64 [ 0, %.preheader44 ], [ %indvars.iv.next57.1, %15 ]
  %indvars.iv.next57 = or i64 %indvars.iv56, 1
  %16 = mul nuw nsw i64 %indvars.iv.next57, %indvars.iv59
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 1200
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.200000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv59, i64 %indvars.iv56
  store double %20, double* %21, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %22 = mul nuw nsw i64 %indvars.iv.next57.1, %indvars.iv59
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 1200
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 1.200000e+03
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv59, i64 %indvars.iv.next57
  store double %26, double* %27, align 8
  %exitcond58.1 = icmp eq i64 %indvars.iv.next57.1, 1200
  br i1 %exitcond58.1, label %28, label %15

; <label>:28:                                     ; preds = %15
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next60, 1000
  br i1 %exitcond61, label %.preheader.preheader, label %.preheader44

.preheader.preheader:                             ; preds = %28
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %37
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %37 ], [ 0, %.preheader.preheader ]
  br label %29

; <label>:29:                                     ; preds = %29, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %29 ]
  %30 = add nuw nsw i64 %indvars.iv, 2
  %31 = mul nuw nsw i64 %30, %indvars.iv53
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1100
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 1.100000e+03
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv
  store double %35, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %37, label %29

; <label>:37:                                     ; preds = %29
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next54, 1200
  br i1 %exitcond55, label %38, label %.preheader

; <label>:38:                                     ; preds = %37
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
  %broadcast.splatinsert12 = insertelement <2 x double> undef, double %0, i32 0
  br label %.preheader28

.preheader28:                                     ; preds = %58, %5
  %indvars.iv39 = phi i64 [ 0, %5 ], [ %6, %58 ]
  %scevgep = getelementptr [1100 x double], [1100 x double]* %2, i64 %indvars.iv39, i64 0
  %6 = add i64 %indvars.iv39, 1
  %scevgep2 = getelementptr [1100 x double], [1100 x double]* %2, i64 %6, i64 0
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader28
  %indvars.iv = phi i64 [ 0, %.preheader28 ], [ %indvars.iv.next.4, %7 ]
  %8 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %1
  store double %10, double* %8, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %1
  store double %13, double* %11, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next.1
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %1
  store double %16, double* %14, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next.2
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %1
  store double %19, double* %17, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next.3
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %1
  store double %22, double* %20, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1100
  br i1 %exitcond.4, label %.preheader.preheader, label %7

.preheader.preheader:                             ; preds = %7
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %middle.block
  %indvars.iv36 = phi i64 [ %23, %middle.block ], [ 0, %.preheader.preheader ]
  %scevgep4 = getelementptr [1100 x double], [1100 x double]* %4, i64 %indvars.iv36, i64 0
  %23 = add i64 %indvars.iv36, 1
  %scevgep6 = getelementptr [1100 x double], [1100 x double]* %4, i64 %23, i64 0
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv36
  %bound0 = icmp ult double* %scevgep, %24
  %bound1 = icmp ult double* %24, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult double* %scevgep, %scevgep6
  %bound110 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.ph

scalar.ph.preheader:                              ; preds = %.preheader
  br label %scalar.ph

vector.ph:                                        ; preds = %.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %25 = load double, double* %24, align 8, !alias.scope !1
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = fmul <2 x double> %26, %broadcast.splatinsert12
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv36, i64 %offset.idx
  %30 = bitcast double* %29 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %30, align 8, !alias.scope !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec14 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %31 = fmul <2 x double> %28, %strided.vec
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv39, i64 %offset.idx
  %33 = bitcast double* %32 to <4 x double>*
  %wide.vec15 = load <4 x double>, <4 x double>* %33, align 8, !alias.scope !6, !noalias !8
  %strided.vec16 = shufflevector <4 x double> %wide.vec15, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec17 = shufflevector <4 x double> %wide.vec15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %34 = fadd <2 x double> %strided.vec16, %31
  %35 = or i64 %offset.idx, 1
  %36 = fmul <2 x double> %28, %strided.vec14
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv39, i64 %35
  %38 = fadd <2 x double> %strided.vec17, %36
  %39 = getelementptr double, double* %37, i64 -1
  %40 = bitcast double* %39 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %34, <2 x double> %38, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %40, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %41 = icmp eq i64 %index.next, 550
  br i1 %41, label %middle.block.loopexit18, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %42 = load double, double* %24, align 8
  %43 = fmul double %42, %0
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv33
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv33
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  store double %49, double* %47, align 8
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %50 = load double, double* %24, align 8
  %51 = fmul double %50, %0
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv.next34
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next34
  %56 = load double, double* %55, align 8
  %57 = fadd double %56, %54
  store double %57, double* %55, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next34.1, 1100
  br i1 %exitcond35.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit18:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit18, %middle.block.loopexit
  %exitcond38 = icmp eq i64 %23, 1200
  br i1 %exitcond38, label %58, label %.preheader

; <label>:58:                                     ; preds = %middle.block
  %exitcond41 = icmp eq i64 %6, 1000
  br i1 %exitcond41, label %59, label %.preheader28

; <label>:59:                                     ; preds = %58
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

.preheader:                                       ; preds = %18, %1
  %indvars.iv14 = phi i64 [ 0, %1 ], [ %indvars.iv.next15, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv14, 1000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond16, label %19, label %.preheader

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

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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #3
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_start() #3
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
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
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double*, double*, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #0 {
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  br label %.preheader7

.preheader7:                                      ; preds = %17, %8
  %indvars.iv26 = phi i64 [ 0, %8 ], [ %indvars.iv.next27, %17 ]
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader7
  %indvars.iv23 = phi i64 [ 0, %.preheader7 ], [ %indvars.iv.next24, %9 ]
  %10 = mul nuw nsw i64 %indvars.iv23, %indvars.iv26
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 1000
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.000000e+03
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv23
  store double %15, double* %16, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 1100
  br i1 %exitcond25, label %17, label %9

; <label>:17:                                     ; preds = %9
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond28, label %.preheader5.preheader, label %.preheader7

.preheader5.preheader:                            ; preds = %17
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.preheader, %31
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %31 ], [ 0, %.preheader5.preheader ]
  br label %18

; <label>:18:                                     ; preds = %18, %.preheader5
  %indvars.iv17 = phi i64 [ 0, %.preheader5 ], [ %indvars.iv.next18.1, %18 ]
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %19 = mul nuw nsw i64 %indvars.iv.next18, %indvars.iv20
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1200
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 1.200000e+03
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv20, i64 %indvars.iv17
  store double %23, double* %24, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %25 = mul nuw nsw i64 %indvars.iv.next18.1, %indvars.iv20
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 1200
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, 1.200000e+03
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv20, i64 %indvars.iv.next18
  store double %29, double* %30, align 8
  %exitcond19.1 = icmp eq i64 %indvars.iv.next18.1, 1200
  br i1 %exitcond19.1, label %31, label %18

; <label>:31:                                     ; preds = %18
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond22, label %.preheader.preheader, label %.preheader5

.preheader.preheader:                             ; preds = %31
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %40
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %40 ], [ 0, %.preheader.preheader ]
  br label %32

; <label>:32:                                     ; preds = %32, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %32 ]
  %33 = add nuw nsw i64 %indvars.iv, 2
  %34 = mul nuw nsw i64 %33, %indvars.iv14
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 1100
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 1.100000e+03
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv14, i64 %indvars.iv
  store double %38, double* %39, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %40, label %32

; <label>:40:                                     ; preds = %32
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %41, label %.preheader

; <label>:41:                                     ; preds = %40
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #0 {
  %broadcast.splatinsert27 = insertelement <2 x double> undef, double %3, i32 0
  br label %.preheader4

.preheader4:                                      ; preds = %61, %8
  %indvars.iv13 = phi i64 [ 0, %8 ], [ %9, %61 ]
  %scevgep = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 0
  %9 = add i64 %indvars.iv13, 1
  %scevgep17 = getelementptr [1100 x double], [1100 x double]* %5, i64 %9, i64 0
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader4
  %indvars.iv = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next.4, %10 ]
  %11 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %4
  store double %13, double* %11, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv.next
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %4
  store double %16, double* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv.next.1
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %4
  store double %19, double* %17, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv.next.2
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %4
  store double %22, double* %20, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %23 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv.next.3
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %4
  store double %25, double* %23, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1100
  br i1 %exitcond.4, label %.preheader.preheader, label %10

.preheader.preheader:                             ; preds = %10
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %middle.block
  %indvars.iv11 = phi i64 [ %26, %middle.block ], [ 0, %.preheader.preheader ]
  %scevgep19 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv11, i64 0
  %26 = add i64 %indvars.iv11, 1
  %scevgep21 = getelementptr [1100 x double], [1100 x double]* %7, i64 %26, i64 0
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv13, i64 %indvars.iv11
  %bound0 = icmp ult double* %scevgep, %27
  %bound1 = icmp ult double* %27, %scevgep17
  %found.conflict = and i1 %bound0, %bound1
  %bound024 = icmp ult double* %scevgep, %scevgep21
  %bound125 = icmp ult double* %scevgep19, %scevgep17
  %found.conflict26 = and i1 %bound024, %bound125
  %conflict.rdx = or i1 %found.conflict, %found.conflict26
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.ph

scalar.ph.preheader:                              ; preds = %.preheader
  br label %scalar.ph

vector.ph:                                        ; preds = %.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %28 = load double, double* %27, align 8, !alias.scope !1
  %29 = insertelement <2 x double> undef, double %28, i32 0
  %30 = fmul <2 x double> %29, %broadcast.splatinsert27
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv11, i64 %offset.idx
  %33 = bitcast double* %32 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %33, align 8, !alias.scope !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec29 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %34 = fmul <2 x double> %31, %strided.vec
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %offset.idx
  %36 = bitcast double* %35 to <4 x double>*
  %wide.vec30 = load <4 x double>, <4 x double>* %36, align 8, !alias.scope !6, !noalias !8
  %strided.vec31 = shufflevector <4 x double> %wide.vec30, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec32 = shufflevector <4 x double> %wide.vec30, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %37 = fadd <2 x double> %strided.vec31, %34
  %38 = or i64 %offset.idx, 1
  %39 = fmul <2 x double> %31, %strided.vec29
  %40 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %38
  %41 = fadd <2 x double> %strided.vec32, %39
  %42 = getelementptr double, double* %40, i64 -1
  %43 = bitcast double* %42 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %37, <2 x double> %41, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %43, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %44 = icmp eq i64 %index.next, 550
  br i1 %44, label %middle.block.loopexit33, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv9 = phi i64 [ %indvars.iv.next10.1, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %45 = load double, double* %27, align 8
  %46 = fmul double %45, %3
  %47 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv11, i64 %indvars.iv9
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv9
  %51 = load double, double* %50, align 8
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8
  %indvars.iv.next10 = or i64 %indvars.iv9, 1
  %53 = load double, double* %27, align 8
  %54 = fmul double %53, %3
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv11, i64 %indvars.iv.next10
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv.next10
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  store double %60, double* %58, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next10.1, 1100
  br i1 %exitcond.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit33:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit33, %middle.block.loopexit
  %exitcond = icmp eq i64 %26, 1200
  br i1 %exitcond, label %61, label %.preheader

; <label>:61:                                     ; preds = %middle.block
  %exitcond15 = icmp eq i64 %9, 1000
  br i1 %exitcond15, label %62, label %.preheader4

; <label>:62:                                     ; preds = %61
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %20, %3
  %indvars.iv4 = phi i64 [ 0, %3 ], [ %indvars.iv.next5, %20 ]
  %8 = mul nuw nsw i64 %indvars.iv4, 1000
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nuw nsw i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %20, label %9

; <label>:20:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond6, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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

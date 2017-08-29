; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #3
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #3
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(double*, [1200 x double]*) unnamed_addr #0 {
  store double 1.400000e+03, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %18, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %18 ]
  %3 = trunc i64 %indvars.iv4 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %10 = trunc i64 %indvars.iv to i32
  %11 = or i32 %10, 1
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %6, %14
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = bitcast double* %9 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond6, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_covariance(double, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr66 = ptrtoint double* %3 to i64
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %22, %4
  %indvars.iv29 = phi i64 [ 0, %4 ], [ %indvars.iv.next30, %22 ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv29
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr42 = shl i64 %indvars.iv29, 3
  %sunkaddr43 = add i64 %sunkaddr, %sunkaddr42
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to double*
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33, %._crit_edge34
  %indvars.iv26 = phi i64 [ 0, %._crit_edge34 ], [ %indvars.iv.next27.4, %._crit_edge33 ]
  %6 = phi double [ 0.000000e+00, %._crit_edge34 ], [ %21, %._crit_edge33 ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv29
  %8 = load double, double* %7, align 8
  %9 = fadd double %6, %8
  store double %9, double* %sunkaddr44, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next27, i64 %indvars.iv29
  %11 = load double, double* %10, align 8
  %12 = fadd double %9, %11
  store double %12, double* %sunkaddr44, align 8
  %indvars.iv.next27.1 = add nuw nsw i64 %indvars.iv26, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next27.1, i64 %indvars.iv29
  %14 = load double, double* %13, align 8
  %15 = fadd double %12, %14
  store double %15, double* %sunkaddr44, align 8
  %indvars.iv.next27.2 = add nuw nsw i64 %indvars.iv26, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next27.2, i64 %indvars.iv29
  %17 = load double, double* %16, align 8
  %18 = fadd double %15, %17
  store double %18, double* %sunkaddr44, align 8
  %indvars.iv.next27.3 = add nuw nsw i64 %indvars.iv26, 4
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next27.3, i64 %indvars.iv29
  %20 = load double, double* %19, align 8
  %21 = fadd double %18, %20
  store double %21, double* %sunkaddr44, align 8
  %indvars.iv.next27.4 = add nuw nsw i64 %indvars.iv26, 5
  %exitcond28.4 = icmp eq i64 %indvars.iv.next27.4, 1400
  br i1 %exitcond28.4, label %22, label %._crit_edge33

; <label>:22:                                     ; preds = %._crit_edge33
  %23 = fdiv double %21, %0
  %sunkaddr67 = shl i64 %indvars.iv29, 3
  %sunkaddr68 = add i64 %sunkaddr66, %sunkaddr67
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to double*
  store double %23, double* %sunkaddr69, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 1200
  br i1 %exitcond31, label %..preheader6_crit_edge, label %._crit_edge34

..preheader6_crit_edge:                           ; preds = %22
  %scevgep53 = getelementptr double, double* %3, i64 1200
  br label %.preheader6

.preheader6:                                      ; preds = %middle.block._crit_edge, %..preheader6_crit_edge
  %indvars.iv23 = phi i64 [ 0, %..preheader6_crit_edge ], [ %24, %middle.block._crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv23, i64 0
  %24 = add nuw nsw i64 %indvars.iv23, 1
  %scevgep51 = getelementptr [1200 x double], [1200 x double]* %1, i64 %24, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep53
  %bound1 = icmp ugt double* %scevgep51, %3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge35.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader6
  br label %vector.body

._crit_edge35.preheader:                          ; preds = %.preheader6
  br label %._crit_edge35

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 2
  %25 = getelementptr inbounds double, double* %3, i64 %offset.idx
  %26 = bitcast double* %25 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %26, align 8, !alias.scope !1
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv23, i64 %offset.idx
  %28 = bitcast double* %27 to <8 x double>*
  %wide.vec58 = load <8 x double>, <8 x double>* %28, align 8, !alias.scope !4, !noalias !1
  %29 = fsub <8 x double> %wide.vec58, %wide.vec
  %30 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %31 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %32 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %33 = or i64 %offset.idx, 3
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv23, i64 %33
  %35 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %36 = getelementptr double, double* %34, i64 -3
  %37 = bitcast double* %36 to <8 x double>*
  %38 = shufflevector <2 x double> %30, <2 x double> %31, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %39 = shufflevector <2 x double> %32, <2 x double> %35, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %38, <4 x double> %39, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %37, align 8, !alias.scope !4, !noalias !1
  %index.next = add nuw nsw i64 %index, 2
  %40 = icmp eq i64 %index.next, 300
  br i1 %40, label %middle.block._crit_edge.loopexit70, label %vector.body, !llvm.loop !6

.preheader5:                                      ; preds = %middle.block._crit_edge
  %41 = fadd double %0, -1.000000e+00
  br label %.lr.ph

._crit_edge35:                                    ; preds = %._crit_edge35.preheader, %._crit_edge35
  %indvars.iv20 = phi i64 [ %indvars.iv.next21.3, %._crit_edge35 ], [ 0, %._crit_edge35.preheader ]
  %42 = getelementptr inbounds double, double* %3, i64 %indvars.iv20
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv23, i64 %indvars.iv20
  %45 = load double, double* %44, align 8
  %46 = fsub double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next21 = or i64 %indvars.iv20, 1
  %47 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next21
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv23, i64 %indvars.iv.next21
  %50 = load double, double* %49, align 8
  %51 = fsub double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next21.1 = or i64 %indvars.iv20, 2
  %52 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next21.1
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv23, i64 %indvars.iv.next21.1
  %55 = load double, double* %54, align 8
  %56 = fsub double %55, %53
  store double %56, double* %54, align 8
  %indvars.iv.next21.2 = or i64 %indvars.iv20, 3
  %57 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next21.2
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv23, i64 %indvars.iv.next21.2
  %60 = load double, double* %59, align 8
  %61 = fsub double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next21.3 = add nuw nsw i64 %indvars.iv20, 4
  %exitcond22.3 = icmp eq i64 %indvars.iv.next21.3, 1200
  br i1 %exitcond22.3, label %middle.block._crit_edge.loopexit, label %._crit_edge35, !llvm.loop !9

middle.block._crit_edge.loopexit:                 ; preds = %._crit_edge35
  br label %middle.block._crit_edge

middle.block._crit_edge.loopexit70:               ; preds = %vector.body
  br label %middle.block._crit_edge

middle.block._crit_edge:                          ; preds = %middle.block._crit_edge.loopexit70, %middle.block._crit_edge.loopexit
  %exitcond25 = icmp eq i64 %24, 1400
  br i1 %exitcond25, label %.preheader5, label %.preheader6

.lr.ph:                                           ; preds = %._crit_edge, %.preheader5
  %indvars.iv17 = phi i64 [ 0, %.preheader5 ], [ %indvars.iv.next18, %._crit_edge ]
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %76, %.lr.ph
  %indvars.iv14 = phi i64 [ %indvars.iv17, %.lr.ph ], [ %indvars.iv.next15, %76 ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv14
  store double 0.000000e+00, double* %62, align 8
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37, %._crit_edge38
  %indvars.iv = phi i64 [ 0, %._crit_edge38 ], [ %indvars.iv.next.1, %._crit_edge37 ]
  %63 = phi double [ 0.000000e+00, %._crit_edge38 ], [ %75, %._crit_edge37 ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv17
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv14
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %62, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv17
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv14
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %69, %74
  store double %75, double* %62, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %76, label %._crit_edge37

; <label>:76:                                     ; preds = %._crit_edge37
  %77 = fdiv double %75, %41
  store double %77, double* %62, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv17
  store double %77, double* %78, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %._crit_edge, label %._crit_edge38

._crit_edge:                                      ; preds = %76
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 1200
  br i1 %exitcond19, label %79, label %.lr.ph

; <label>:79:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge7, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %17, label %._crit_edge7

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

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
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}

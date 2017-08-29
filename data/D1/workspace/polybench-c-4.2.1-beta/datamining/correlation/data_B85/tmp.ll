; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
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
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %19, %2
  %indvars.iv15 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %19 ]
  %3 = trunc i64 %indvars.iv15 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv4 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv4, %indvars.iv15
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv4
  %indvars.iv.next = or i64 %indvars.iv4, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv15
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv4, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond3, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  %sunkaddr100 = ptrtoint double* %3 to i64
  br label %6

; <label>:6:                                      ; preds = %22, %5
  %indvars.iv2645 = phi i64 [ 0, %5 ], [ %indvars.iv.next27, %22 ]
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv2645
  store double 0.000000e+00, double* %7, align 8
  %sunkaddr77 = shl i64 %indvars.iv2645, 3
  %sunkaddr78 = add i64 %sunkaddr, %sunkaddr77
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to double*
  %sunkaddr77.1 = shl i64 %indvars.iv2645, 3
  %sunkaddr78.1 = add i64 %sunkaddr.1, %sunkaddr77.1
  %sunkaddr79.1 = inttoptr i64 %sunkaddr78.1 to double*
  br label %8

; <label>:8:                                      ; preds = %8, %6
  %9 = phi double [ 0.000000e+00, %6 ], [ %21, %8 ]
  %indvars.iv2344 = phi i64 [ 0, %6 ], [ %indvars.iv.next24.1.1, %8 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv2344, i64 %indvars.iv2645
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %sunkaddr79, align 8
  %indvars.iv.next24 = or i64 %indvars.iv2344, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next24, i64 %indvars.iv2645
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr79, align 8
  %indvars.iv.next24.1 = or i64 %indvars.iv2344, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next24.1, i64 %indvars.iv2645
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr79.1, align 8
  %indvars.iv.next24.1110 = or i64 %indvars.iv2344, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next24.1110, i64 %indvars.iv2645
  %20 = load double, double* %19, align 8
  %21 = fadd double %20, %18
  store double %21, double* %sunkaddr79.1, align 8
  %indvars.iv.next24.1.1 = add nsw i64 %indvars.iv2344, 4
  %exitcond25.1.1 = icmp eq i64 %indvars.iv.next24.1.1, 1400
  br i1 %exitcond25.1.1, label %22, label %8

; <label>:22:                                     ; preds = %8
  %23 = fdiv double %21, %0
  %sunkaddr101 = shl i64 %indvars.iv2645, 3
  %sunkaddr102 = add i64 %sunkaddr100, %sunkaddr101
  %sunkaddr103 = inttoptr i64 %sunkaddr102 to double*
  store double %23, double* %sunkaddr103, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv2645, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 1200
  br i1 %exitcond28, label %.._crit_edge_crit_edge.preheader, label %6

.._crit_edge_crit_edge.preheader:                 ; preds = %22
  %24 = ptrtoint double* %3 to i64
  %sunkaddr88 = ptrtoint double* %4 to i64
  %sunkaddr104 = ptrtoint double* %4 to i64
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %.._crit_edge_crit_edge.preheader, %._crit_edge10
  %indvars.iv2043 = phi i64 [ %indvars.iv.next21, %._crit_edge10 ], [ 0, %.._crit_edge_crit_edge.preheader ]
  %25 = getelementptr inbounds double, double* %4, i64 %indvars.iv2043
  store double 0.000000e+00, double* %25, align 8
  %sunkaddr85 = shl i64 %indvars.iv2043, 3
  %sunkaddr86 = add i64 %24, %sunkaddr85
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to double*
  %sunkaddr90 = add i64 %sunkaddr88, %sunkaddr85
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to double*
  br label %26

; <label>:26:                                     ; preds = %26, %.._crit_edge_crit_edge
  %27 = phi double [ 0.000000e+00, %.._crit_edge_crit_edge ], [ %39, %26 ]
  %indvars.iv1742 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next18.1, %26 ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1742, i64 %indvars.iv2043
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr87, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %27, %32
  store double %33, double* %sunkaddr91, align 8
  %indvars.iv.next18 = or i64 %indvars.iv1742, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next18, i64 %indvars.iv2043
  %35 = load double, double* %34, align 8
  %36 = load double, double* %sunkaddr87, align 8
  %37 = fsub double %35, %36
  %38 = fmul double %37, %37
  %39 = fadd double %33, %38
  store double %39, double* %sunkaddr91, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv1742, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next18.1, 1400
  br i1 %exitcond19.1, label %._crit_edge10, label %26

._crit_edge10:                                    ; preds = %26
  %40 = fdiv double %39, %0
  %sunkaddr105 = shl i64 %indvars.iv2043, 3
  %sunkaddr106 = add i64 %sunkaddr104, %sunkaddr105
  %sunkaddr107 = inttoptr i64 %sunkaddr106 to double*
  store double %40, double* %sunkaddr107, align 8
  %41 = tail call double @sqrt(double %40) #4
  %42 = fcmp ugt double %41, 1.000000e-01
  %. = select i1 %42, double %41, double 1.000000e+00
  store double %., double* %sunkaddr107, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2043, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 1200
  br i1 %exitcond22, label %._crit_edge9.._crit_edge11_crit_edge.preheader, label %.._crit_edge_crit_edge

._crit_edge9.._crit_edge11_crit_edge.preheader:   ; preds = %._crit_edge10
  br label %._crit_edge9.._crit_edge11_crit_edge

._crit_edge9.._crit_edge11_crit_edge:             ; preds = %._crit_edge9.._crit_edge11_crit_edge.preheader, %._crit_edge9
  %indvars.iv1441 = phi i64 [ %indvars.iv.next15, %._crit_edge9 ], [ 0, %._crit_edge9.._crit_edge11_crit_edge.preheader ]
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11, %._crit_edge9.._crit_edge11_crit_edge
  %indvars.iv1140 = phi i64 [ 0, %._crit_edge9.._crit_edge11_crit_edge ], [ %indvars.iv.next12, %._crit_edge11 ]
  %43 = getelementptr inbounds double, double* %3, i64 %indvars.iv1140
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1441, i64 %indvars.iv1140
  %46 = load double, double* %45, align 8
  %47 = fsub double %46, %44
  store double %47, double* %45, align 8
  %48 = tail call double @sqrt(double %0) #4
  %49 = getelementptr inbounds double, double* %4, i64 %indvars.iv1140
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = load double, double* %45, align 8
  %53 = fdiv double %52, %51
  store double %53, double* %45, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1140, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond13, label %._crit_edge9, label %._crit_edge11

._crit_edge9:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1441, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1400
  br i1 %exitcond16, label %._crit_edge9.._crit_edge12_crit_edge..lr.ph_crit_edge.preheader, label %._crit_edge9.._crit_edge11_crit_edge

._crit_edge9.._crit_edge12_crit_edge..lr.ph_crit_edge.preheader: ; preds = %._crit_edge9
  br label %._crit_edge9.._crit_edge12_crit_edge..lr.ph_crit_edge

._crit_edge9.._crit_edge12_crit_edge..lr.ph_crit_edge: ; preds = %._crit_edge9.._crit_edge12_crit_edge..lr.ph_crit_edge.preheader, %._crit_edge12
  %indvars.iv838 = phi i64 [ %indvars.iv.next9, %._crit_edge12 ], [ 0, %._crit_edge9.._crit_edge12_crit_edge..lr.ph_crit_edge.preheader ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv838, i64 %indvars.iv838
  store double 1.000000e+00, double* %54, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %70, %._crit_edge9.._crit_edge12_crit_edge..lr.ph_crit_edge
  %indvars.iv.next635.in = phi i64 [ %indvars.iv838, %._crit_edge9.._crit_edge12_crit_edge..lr.ph_crit_edge ], [ %indvars.iv.next635, %70 ]
  %indvars.iv.next635 = add nuw nsw i64 %indvars.iv.next635.in, 1
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv838, i64 %indvars.iv.next635
  store double 0.000000e+00, double* %55, align 8
  br label %56

; <label>:56:                                     ; preds = %56, %.lr.ph
  %57 = phi double [ 0.000000e+00, %.lr.ph ], [ %69, %56 ]
  %indvars.iv31 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %56 ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv838
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv.next635
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %57, %62
  store double %63, double* %55, align 8
  %indvars.iv.next = or i64 %indvars.iv31, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv838
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv.next635
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %55, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv31, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %70, label %56

; <label>:70:                                     ; preds = %56
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next635, i64 %indvars.iv838
  store double %69, double* %71, align 8
  %exitcond7 = icmp eq i64 %indvars.iv.next635, 1199
  br i1 %exitcond7, label %._crit_edge12, label %.lr.ph

._crit_edge12:                                    ; preds = %70
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv838, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1199
  br i1 %exitcond10, label %72, label %._crit_edge9.._crit_edge12_crit_edge..lr.ph_crit_edge

; <label>:72:                                     ; preds = %._crit_edge12
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %73, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %18, %1
  %indvars.iv15 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv15, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge2, %.._crit_edge_crit_edge
  %indvars.iv4 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next, %._crit_edge2 ]
  %8 = add nuw nsw i64 %indvars.iv4, %6
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
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv4
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge2
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %19, label %.._crit_edge_crit_edge

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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

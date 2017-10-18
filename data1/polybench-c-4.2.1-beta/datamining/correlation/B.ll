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
  %4 = call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
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
  %18 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2
  %indvars.iv13 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %18 ]
  %3 = trunc i64 %indvars.iv13 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %._crit_edge
  %indvars.iv2 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv13, %indvars.iv2
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = fadd double %9, %4
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv2
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv2, 1
  %12 = mul nuw nsw i64 %indvars.iv13, %indvars.iv.next
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = fadd double %15, %4
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv2, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %5

; <label>:18:                                     ; preds = %5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond3, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
  %6 = alloca double, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca [1200 x double]*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double, align 8
  store double %0, double* %6, align 8
  store [1200 x double]* %1, [1200 x double]** %7, align 8
  store [1200 x double]* %2, [1200 x double]** %8, align 8
  store double* %4, double** %9, align 8
  store double 1.000000e-01, double* %10, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  %sunkaddr25 = ptrtoint double* %3 to i64
  br label %11

; <label>:11:                                     ; preds = %21, %5
  %indvars.iv5218 = phi i64 [ 0, %5 ], [ %indvars.iv.next53, %21 ]
  %12 = getelementptr inbounds double, double* %3, i64 %indvars.iv5218
  store double 0.000000e+00, double* %12, align 8
  %sunkaddr19 = shl i64 %indvars.iv5218, 3
  %sunkaddr20 = add i64 %sunkaddr, %sunkaddr19
  %sunkaddr22 = inttoptr i64 %sunkaddr20 to double*
  %sunkaddr19.1 = shl i64 %indvars.iv5218, 3
  %sunkaddr20.1 = add i64 %sunkaddr.1, %sunkaddr19.1
  %sunkaddr22.1 = inttoptr i64 %sunkaddr20.1 to double*
  br label %13

; <label>:13:                                     ; preds = %13, %11
  %14 = phi double [ 0.000000e+00, %11 ], [ %20, %13 ]
  %indvars.iv4917 = phi i64 [ 0, %11 ], [ %indvars.iv.next50.1, %13 ]
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4917, i64 %indvars.iv5218
  %16 = load double, double* %15, align 8
  %17 = fadd double %14, %16
  store double %17, double* %sunkaddr22, align 8
  %indvars.iv.next50 = or i64 %indvars.iv4917, 1
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next50, i64 %indvars.iv5218
  %19 = load double, double* %18, align 8
  %20 = fadd double %17, %19
  store double %20, double* %sunkaddr22.1, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv4917, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next50.1, 1400
  br i1 %exitcond51.1, label %21, label %13

; <label>:21:                                     ; preds = %13
  %22 = fdiv double %20, %0
  %sunkaddr26 = shl i64 %indvars.iv5218, 3
  %sunkaddr27 = add i64 %sunkaddr25, %sunkaddr26
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to double*
  store double %22, double* %sunkaddr28, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv5218, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next53, 1200
  br i1 %exitcond54, label %..._crit_edge_crit_edge_crit_edge, label %11

..._crit_edge_crit_edge_crit_edge:                ; preds = %21
  %sunkaddr29 = ptrtoint double* %3 to i64
  %sunkaddr29.1 = ptrtoint double* %3 to i64
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %._crit_edge, %..._crit_edge_crit_edge_crit_edge
  %23 = phi double* [ %4, %..._crit_edge_crit_edge_crit_edge ], [ %40, %._crit_edge ]
  %indvars.iv4616 = phi i64 [ 0, %..._crit_edge_crit_edge_crit_edge ], [ %indvars.iv.next47, %._crit_edge ]
  %24 = getelementptr inbounds double, double* %23, i64 %indvars.iv4616
  store double 0.000000e+00, double* %24, align 8
  %sunkaddr30 = shl i64 %indvars.iv4616, 3
  %sunkaddr31 = add i64 %sunkaddr29, %sunkaddr30
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to double*
  %sunkaddr33 = ptrtoint double* %23 to i64
  %sunkaddr34 = shl i64 %indvars.iv4616, 3
  %sunkaddr35 = add i64 %sunkaddr33, %sunkaddr34
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to double*
  %sunkaddr30.1 = shl i64 %indvars.iv4616, 3
  %sunkaddr31.1 = add i64 %sunkaddr29.1, %sunkaddr30.1
  %sunkaddr32.1 = inttoptr i64 %sunkaddr31.1 to double*
  %sunkaddr33.1 = ptrtoint double* %23 to i64
  %sunkaddr34.1 = shl i64 %indvars.iv4616, 3
  %sunkaddr35.1 = add i64 %sunkaddr33.1, %sunkaddr34.1
  %sunkaddr36.1 = inttoptr i64 %sunkaddr35.1 to double*
  br label %25

; <label>:25:                                     ; preds = %25, %.._crit_edge_crit_edge
  %26 = phi double [ 0.000000e+00, %.._crit_edge_crit_edge ], [ %38, %25 ]
  %indvars.iv4315 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next44.1, %25 ]
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4315, i64 %indvars.iv4616
  %28 = load double, double* %27, align 8
  %29 = load double, double* %sunkaddr32, align 8
  %30 = fsub double %28, %29
  %31 = fmul double %30, %30
  %32 = fadd double %26, %31
  store double %32, double* %sunkaddr36, align 8
  %indvars.iv.next44 = or i64 %indvars.iv4315, 1
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next44, i64 %indvars.iv4616
  %34 = load double, double* %33, align 8
  %35 = load double, double* %sunkaddr32.1, align 8
  %36 = fsub double %34, %35
  %37 = fmul double %36, %36
  %38 = fadd double %32, %37
  store double %38, double* %sunkaddr36.1, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv4315, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next44.1, 1400
  br i1 %exitcond45.1, label %._crit_edge, label %25

._crit_edge:                                      ; preds = %25
  %39 = fdiv double %38, %0
  %sunkaddr37 = ptrtoint double* %23 to i64
  %sunkaddr38 = shl i64 %indvars.iv4616, 3
  %sunkaddr39 = add i64 %sunkaddr37, %sunkaddr38
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to double*
  store double %39, double* %sunkaddr40, align 8
  %40 = load double*, double** %9, align 8
  %41 = getelementptr inbounds double, double* %40, i64 %indvars.iv4616
  %42 = load double, double* %41, align 8
  %43 = call double @sqrt(double %42) #4
  store double %43, double* %41, align 8
  %44 = load double, double* %10, align 8
  %45 = fcmp ole double %43, %44
  %46 = select i1 %45, double 1.000000e+00, double %43
  %sunkaddr41 = ptrtoint double* %40 to i64
  %sunkaddr42 = shl i64 %indvars.iv4616, 3
  %sunkaddr43 = add i64 %sunkaddr41, %sunkaddr42
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to double*
  store double %46, double* %sunkaddr44, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv4616, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next47, 1200
  br i1 %exitcond48, label %._crit_edge.._crit_edge55.._crit_edge57_crit_edge_crit_edge, label %.._crit_edge_crit_edge

._crit_edge.._crit_edge55.._crit_edge57_crit_edge_crit_edge: ; preds = %._crit_edge
  br label %._crit_edge55.._crit_edge57_crit_edge

._crit_edge55.._crit_edge57_crit_edge:            ; preds = %._crit_edge55, %._crit_edge.._crit_edge55.._crit_edge57_crit_edge_crit_edge
  %47 = phi [1200 x double]* [ %1, %._crit_edge.._crit_edge55.._crit_edge57_crit_edge_crit_edge ], [ %60, %._crit_edge55 ]
  %indvars.iv4014 = phi i64 [ 0, %._crit_edge.._crit_edge55.._crit_edge57_crit_edge_crit_edge ], [ %indvars.iv.next41, %._crit_edge55 ]
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge57, %._crit_edge55.._crit_edge57_crit_edge
  %48 = phi [1200 x double]* [ %47, %._crit_edge55.._crit_edge57_crit_edge ], [ %60, %._crit_edge57 ]
  %indvars.iv3713 = phi i64 [ 0, %._crit_edge55.._crit_edge57_crit_edge ], [ %indvars.iv.next38, %._crit_edge57 ]
  %49 = getelementptr inbounds double, double* %3, i64 %indvars.iv3713
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %48, i64 %indvars.iv4014, i64 %indvars.iv3713
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %50
  store double %53, double* %51, align 8
  %54 = load double, double* %6, align 8
  %55 = call double @sqrt(double %54) #4
  %56 = load double*, double** %9, align 8
  %57 = getelementptr inbounds double, double* %56, i64 %indvars.iv3713
  %58 = load double, double* %57, align 8
  %59 = fmul double %55, %58
  %60 = load [1200 x double]*, [1200 x double]** %7, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %60, i64 %indvars.iv4014, i64 %indvars.iv3713
  %62 = load double, double* %61, align 8
  %63 = fdiv double %62, %59
  store double %63, double* %61, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv3713, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next38, 1200
  br i1 %exitcond39, label %._crit_edge55, label %._crit_edge57

._crit_edge55:                                    ; preds = %._crit_edge57
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv4014, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next41, 1400
  br i1 %exitcond42, label %._crit_edge55.._crit_edge55.._crit_edge56_crit_edge_crit_edge, label %._crit_edge55.._crit_edge57_crit_edge

._crit_edge55.._crit_edge55.._crit_edge56_crit_edge_crit_edge: ; preds = %._crit_edge55
  br label %._crit_edge55.._crit_edge56_crit_edge..lr.ph_crit_edge

._crit_edge55.._crit_edge56_crit_edge..lr.ph_crit_edge: ; preds = %._crit_edge55.._crit_edge55.._crit_edge56_crit_edge_crit_edge, %._crit_edge56
  %64 = phi [1200 x double]* [ %2, %._crit_edge55.._crit_edge55.._crit_edge56_crit_edge_crit_edge ], [ %69, %._crit_edge56 ]
  %indvars.iv2912 = phi i64 [ 1, %._crit_edge55.._crit_edge55.._crit_edge56_crit_edge_crit_edge ], [ %indvars.iv.next30, %._crit_edge56 ]
  %indvars.iv3410 = phi i64 [ 0, %._crit_edge55.._crit_edge55.._crit_edge56_crit_edge_crit_edge ], [ %indvars.iv.next35, %._crit_edge56 ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %64, i64 %indvars.iv3410, i64 %indvars.iv3410
  store double 1.000000e+00, double* %65, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %86, %._crit_edge55.._crit_edge56_crit_edge..lr.ph_crit_edge
  %66 = phi [1200 x double]* [ %64, %._crit_edge55.._crit_edge56_crit_edge..lr.ph_crit_edge ], [ %69, %86 ]
  %indvars.iv317 = phi i64 [ %indvars.iv2912, %._crit_edge55.._crit_edge56_crit_edge..lr.ph_crit_edge ], [ %indvars.iv.next32, %86 ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv3410, i64 %indvars.iv317
  store double 0.000000e+00, double* %67, align 8
  %68 = load [1200 x double]*, [1200 x double]** %7, align 8
  %69 = load [1200 x double]*, [1200 x double]** %8, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %indvars.iv3410, i64 %indvars.iv317
  br label %71

; <label>:71:                                     ; preds = %71, %.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %71 ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv5, i64 %indvars.iv3410
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv5, i64 %indvars.iv317
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = load double, double* %70, align 8
  %78 = fadd double %77, %76
  store double %78, double* %70, align 8
  %indvars.iv.next = or i64 %indvars.iv5, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv.next, i64 %indvars.iv3410
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv.next, i64 %indvars.iv317
  %82 = load double, double* %81, align 8
  %83 = fmul double %80, %82
  %84 = load double, double* %70, align 8
  %85 = fadd double %84, %83
  store double %85, double* %70, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv5, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %86, label %71

; <label>:86:                                     ; preds = %71
  %87 = bitcast double* %70 to i64*
  %88 = load i64, i64* %87, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 %indvars.iv317, i64 %indvars.iv3410
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv317, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond33, label %._crit_edge56, label %.lr.ph

._crit_edge56:                                    ; preds = %86
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv3410, 1
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv2912, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next35, 1199
  br i1 %exitcond36, label %91, label %._crit_edge55.._crit_edge56_crit_edge..lr.ph_crit_edge

; <label>:91:                                     ; preds = %._crit_edge56
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %69, i64 1199, i64 1199
  store double 1.000000e+00, double* %92, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %6

; <label>:6:                                      ; preds = %19, %1
  %indvars.iv13 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %19 ]
  %7 = mul nuw nsw i64 %indvars.iv13, 1200
  br label %8

; <label>:8:                                      ; preds = %._crit_edge, %6
  %indvars.iv2 = phi i64 [ 0, %6 ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add nuw nsw i64 %7, %indvars.iv2
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv2
  %17 = load double, double* %16, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %8

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %20, label %6

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

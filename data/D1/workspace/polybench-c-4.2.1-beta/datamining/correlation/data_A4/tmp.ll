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
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
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
  br label %.preheader

.preheader:                                       ; preds = %18, %2
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %18 ]
  %3 = trunc i64 %indvars.iv1 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = fadd double %4, %9
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = fadd double %4, %15
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %18, label %5

; <label>:18:                                     ; preds = %5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double*, double*) unnamed_addr #0 {
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr7 = ptrtoint double* %3 to i64
  br label %7

.preheader37:                                     ; preds = %26
  %sunkaddr11 = ptrtoint double* %4 to i64
  %sunkaddr15 = ptrtoint double* %4 to i64
  %sunkaddr31 = ptrtoint double* %4 to i64
  %6 = ptrtoint double* %4 to i64
  br label %28

; <label>:7:                                      ; preds = %26, %5
  %indvars.iv65 = phi i64 [ 0, %5 ], [ %indvars.iv.next66, %26 ]
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv65
  store double 0.000000e+00, double* %8, align 8
  %sunkaddr4 = shl nsw i64 %indvars.iv65, 3
  %sunkaddr5 = add i64 %sunkaddr4, %sunkaddr
  %sunkaddr6 = inttoptr i64 %sunkaddr5 to double*
  br label %9

; <label>:9:                                      ; preds = %9, %7
  %indvars.iv62 = phi i64 [ 0, %7 ], [ %indvars.iv.next63.4, %9 ]
  %10 = phi double [ 0.000000e+00, %7 ], [ %25, %9 ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv62, i64 %indvars.iv65
  %12 = load double, double* %11, align 8
  %13 = fadd double %10, %12
  store double %13, double* %sunkaddr6, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next63, i64 %indvars.iv65
  %15 = load double, double* %14, align 8
  %16 = fadd double %13, %15
  store double %16, double* %sunkaddr6, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next63.1, i64 %indvars.iv65
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  store double %19, double* %sunkaddr6, align 8
  %indvars.iv.next63.2 = add nsw i64 %indvars.iv62, 3
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next63.2, i64 %indvars.iv65
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  store double %22, double* %sunkaddr6, align 8
  %indvars.iv.next63.3 = add nsw i64 %indvars.iv62, 4
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next63.3, i64 %indvars.iv65
  %24 = load double, double* %23, align 8
  %25 = fadd double %22, %24
  store double %25, double* %sunkaddr6, align 8
  %indvars.iv.next63.4 = add nsw i64 %indvars.iv62, 5
  %exitcond64.4 = icmp eq i64 %indvars.iv.next63.4, 1400
  br i1 %exitcond64.4, label %26, label %9

; <label>:26:                                     ; preds = %9
  %27 = fdiv double %25, %0
  %sunkaddr8 = shl nsw i64 %indvars.iv65, 3
  %sunkaddr9 = add i64 %sunkaddr8, %sunkaddr7
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to double*
  store double %27, double* %sunkaddr10, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next66, 1200
  br i1 %exitcond67, label %.preheader37, label %7

; <label>:28:                                     ; preds = %45, %.preheader37
  %indvars.iv59 = phi i64 [ 0, %.preheader37 ], [ %indvars.iv.next60, %45 ]
  %29 = getelementptr inbounds double, double* %4, i64 %indvars.iv59
  store double 0.000000e+00, double* %29, align 8
  %30 = getelementptr inbounds double, double* %3, i64 %indvars.iv59
  %sunkaddr12 = shl nsw i64 %indvars.iv59, 3
  %sunkaddr13 = add i64 %sunkaddr12, %sunkaddr11
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to double*
  br label %31

; <label>:31:                                     ; preds = %31, %28
  %indvars.iv56 = phi i64 [ 0, %28 ], [ %indvars.iv.next57.1, %31 ]
  %32 = phi double [ 0.000000e+00, %28 ], [ %44, %31 ]
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv59
  %34 = load double, double* %33, align 8
  %35 = load double, double* %30, align 8
  %36 = fsub double %34, %35
  %37 = fmul double %36, %36
  %38 = fadd double %32, %37
  store double %38, double* %sunkaddr14, align 8
  %indvars.iv.next57 = or i64 %indvars.iv56, 1
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next57, i64 %indvars.iv59
  %40 = load double, double* %39, align 8
  %41 = load double, double* %30, align 8
  %42 = fsub double %40, %41
  %43 = fmul double %42, %42
  %44 = fadd double %38, %43
  store double %44, double* %sunkaddr14, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next57.1, 1400
  br i1 %exitcond58.1, label %45, label %31

; <label>:45:                                     ; preds = %31
  %46 = fdiv double %44, %0
  %sunkaddr16 = shl nsw i64 %indvars.iv59, 3
  %sunkaddr17 = add i64 %sunkaddr16, %sunkaddr15
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to double*
  store double %46, double* %sunkaddr18, align 8
  %sunkaddr32 = shl nsw i64 %indvars.iv59, 3
  %sunkaddr33 = add i64 %sunkaddr32, %sunkaddr31
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to double*
  %47 = load double, double* %sunkaddr34, align 8
  %48 = tail call double @sqrt(double %47) #4
  %49 = getelementptr inbounds double, double* %4, i64 %indvars.iv59
  store double %48, double* %49, align 8
  %50 = fcmp ugt double %48, 1.000000e-01
  %51 = select i1 %50, double %48, double 1.000000e+00
  %sunkaddr20 = shl nsw i64 %indvars.iv59, 3
  %sunkaddr21 = add i64 %sunkaddr20, %6
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to double*
  store double %51, double* %sunkaddr22, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next60, 1200
  br i1 %exitcond61, label %.preheader35.preheader, label %28

.preheader35.preheader:                           ; preds = %45
  br label %.preheader35

.preheader35:                                     ; preds = %.preheader35.preheader, %65
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %65 ], [ 0, %.preheader35.preheader ]
  br label %52

; <label>:52:                                     ; preds = %52, %.preheader35
  %indvars.iv50 = phi i64 [ 0, %.preheader35 ], [ %indvars.iv.next51, %52 ]
  %53 = getelementptr inbounds double, double* %3, i64 %indvars.iv50
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv50
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %54
  store double %57, double* %55, align 8
  %58 = tail call double @sqrt(double %0) #4
  %59 = getelementptr inbounds double, double* %4, i64 %indvars.iv50
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv50
  %63 = load double, double* %62, align 8
  %64 = fdiv double %63, %61
  store double %64, double* %62, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next51, 1200
  br i1 %exitcond52, label %65, label %52

; <label>:65:                                     ; preds = %52
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next54, 1400
  br i1 %exitcond55, label %.lr.ph.preheader.preheader, label %.preheader35

.lr.ph.preheader.preheader:                       ; preds = %65
  br label %.lr.ph.preheader

.loopexit:                                        ; preds = %84
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next48, 1199
  br i1 %exitcond49, label %90, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph.preheader.preheader, %.loopexit
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %.loopexit ], [ 0, %.lr.ph.preheader.preheader ]
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %.loopexit ], [ 1, %.lr.ph.preheader.preheader ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv47, i64 %indvars.iv47
  store double 1.000000e+00, double* %66, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  br label %.lr.ph

.lr.ph:                                           ; preds = %84, %.lr.ph.preheader
  %indvars.iv44 = phi i64 [ %indvars.iv42, %.lr.ph.preheader ], [ %indvars.iv.next45, %84 ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv47, i64 %indvars.iv44
  store double 0.000000e+00, double* %67, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv47, i64 %indvars.iv44
  br label %69

; <label>:69:                                     ; preds = %69, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %69 ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv47
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv44
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = load double, double* %68, align 8
  %76 = fadd double %75, %74
  store double %76, double* %68, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv47
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv44
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = load double, double* %68, align 8
  %83 = fadd double %82, %81
  store double %83, double* %68, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %84, label %69

; <label>:84:                                     ; preds = %69
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv47, i64 %indvars.iv44
  %86 = bitcast double* %85 to i64*
  %87 = load i64, i64* %86, align 8
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv44, i64 %indvars.iv47
  %89 = bitcast double* %88 to i64*
  store i64 %87, i64* %89, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond = icmp eq i64 %indvars.iv.next45, 1200
  br i1 %exitcond, label %.loopexit, label %.lr.ph

; <label>:90:                                     ; preds = %.loopexit
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %91, align 8
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
  br label %.preheader

.preheader:                                       ; preds = %19, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %19 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %7

; <label>:19:                                     ; preds = %14
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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

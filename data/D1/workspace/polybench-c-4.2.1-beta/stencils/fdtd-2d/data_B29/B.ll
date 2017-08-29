; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
  %8 = alloca [1200 x double]*, align 8
  %9 = alloca [1200 x double]*, align 8
  store [1200 x double]* %4, [1200 x double]** %8, align 8
  store [1200 x double]* %5, [1200 x double]** %9, align 8
  br label %._crit_edge

.preheader3:                                      ; preds = %._crit_edge
  %10 = load [1200 x double]*, [1200 x double]** %8, align 8
  %11 = load [1200 x double]*, [1200 x double]** %9, align 8
  br label %.preheader

._crit_edge:                                      ; preds = %._crit_edge, %7
  %indvars.iv610 = phi i64 [ 0, %7 ], [ %indvars.iv.next7.4, %._crit_edge ]
  %12 = trunc i64 %indvars.iv610 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %6, i64 %indvars.iv610
  %15 = bitcast double* %14 to <2 x double>*
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv610, 1
  %16 = trunc i64 %indvars.iv.next7 to i32
  %17 = sitofp i32 %16 to double
  %18 = insertelement <2 x double> undef, double %13, i32 0
  %19 = insertelement <2 x double> %18, double %17, i32 1
  store <2 x double> %19, <2 x double>* %15, align 8
  %indvars.iv.next7.1 = add nsw i64 %indvars.iv610, 2
  %20 = trunc i64 %indvars.iv.next7.1 to i32
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next7.1
  %23 = bitcast double* %22 to <2 x double>*
  %indvars.iv.next7.2 = add nsw i64 %indvars.iv610, 3
  %24 = trunc i64 %indvars.iv.next7.2 to i32
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %21, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  store <2 x double> %27, <2 x double>* %23, align 8
  %indvars.iv.next7.3 = add nsw i64 %indvars.iv610, 4
  %28 = trunc i64 %indvars.iv.next7.3 to i32
  %29 = sitofp i32 %28 to double
  %30 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next7.3
  store double %29, double* %30, align 8
  %indvars.iv.next7.4 = add nsw i64 %indvars.iv610, 5
  %exitcond12.4 = icmp eq i64 %indvars.iv.next7.4, 500
  br i1 %exitcond12.4, label %.preheader3, label %._crit_edge

.preheader:                                       ; preds = %54, %.preheader3
  %indvars.iv49 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next5, %54 ]
  %31 = trunc i64 %indvars.iv49 to i32
  %32 = sitofp i32 %31 to double
  %33 = insertelement <2 x double> undef, double %32, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13, %.preheader
  %indvars.iv8 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge13 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %35 = trunc i64 %indvars.iv.next to i32
  %36 = sitofp i32 %35 to double
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv8
  %38 = add nuw nsw i64 %indvars.iv8, 2
  %39 = trunc i64 %38 to i32
  %40 = sitofp i32 %39 to double
  %41 = insertelement <2 x double> undef, double %36, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  %43 = fmul <2 x double> %34, %42
  %44 = fdiv <2 x double> %43, <double 1.000000e+03, double 1.200000e+03>
  %45 = extractelement <2 x double> %44, i32 0
  %46 = extractelement <2 x double> %44, i32 1
  store double %45, double* %37, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv49, i64 %indvars.iv8
  store double %46, double* %47, align 8
  %48 = add nuw nsw i64 %indvars.iv8, 3
  %49 = trunc i64 %48 to i32
  %50 = sitofp i32 %49 to double
  %51 = fmul double %32, %50
  %52 = fdiv double %51, 1.000000e+03
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %indvars.iv49, i64 %indvars.iv8
  store double %52, double* %53, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %54, label %._crit_edge13

; <label>:54:                                     ; preds = %._crit_edge13
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond11, label %55, label %.preheader

; <label>:55:                                     ; preds = %54
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
  br label %.preheader13

.preheader13:                                     ; preds = %81, %7
  %indvars.iv2635 = phi i64 [ 0, %7 ], [ %indvars.iv.next27, %81 ]
  %8 = getelementptr inbounds double, double* %6, i64 %indvars.iv2635
  %9 = bitcast double* %8 to i64*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader13
  %indvars.iv28 = phi i64 [ 0, %.preheader13 ], [ %indvars.iv.next.7, %._crit_edge ]
  %10 = load i64, i64* %9, align 8
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv28
  %12 = bitcast double* %11 to i64*
  store i64 %10, i64* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv28, 1
  %13 = load i64, i64* %9, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %15 = bitcast double* %14 to i64*
  store i64 %13, i64* %15, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv28, 2
  %16 = load i64, i64* %9, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %18 = bitcast double* %17 to i64*
  store i64 %16, i64* %18, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv28, 3
  %19 = load i64, i64* %9, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %21 = bitcast double* %20 to i64*
  store i64 %19, i64* %21, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv28, 4
  %22 = load i64, i64* %9, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %24 = bitcast double* %23 to i64*
  store i64 %22, i64* %24, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv28, 5
  %25 = load i64, i64* %9, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %27 = bitcast double* %26 to i64*
  store i64 %25, i64* %27, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv28, 6
  %28 = load i64, i64* %9, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv28, 7
  %31 = load i64, i64* %9, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %33 = bitcast double* %32 to i64*
  store i64 %31, i64* %33, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv28, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader9.preheader, label %._crit_edge

.preheader9.preheader:                            ; preds = %._crit_edge
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.preheader, %53
  %indvars.iv1630 = phi i64 [ %indvars.iv.next17, %53 ], [ 1, %.preheader9.preheader ]
  %34 = add nsw i64 %indvars.iv1630, -1
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge43, %.preheader9
  %indvars.iv1429 = phi i64 [ 0, %.preheader9 ], [ %indvars.iv.next15.1, %._crit_edge43 ]
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1630, i64 %indvars.iv1429
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1630, i64 %indvars.iv1429
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %34, i64 %indvars.iv1429
  %40 = load double, double* %39, align 8
  %41 = fsub double %38, %40
  %42 = fmul double %41, 5.000000e-01
  %43 = fsub double %36, %42
  store double %43, double* %35, align 8
  %indvars.iv.next15 = or i64 %indvars.iv1429, 1
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1630, i64 %indvars.iv.next15
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1630, i64 %indvars.iv.next15
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %34, i64 %indvars.iv.next15
  %49 = load double, double* %48, align 8
  %50 = fsub double %47, %49
  %51 = fmul double %50, 5.000000e-01
  %52 = fsub double %45, %51
  store double %52, double* %44, align 8
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv1429, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next15.1, 1200
  br i1 %exitcond.1, label %53, label %._crit_edge43

; <label>:53:                                     ; preds = %._crit_edge43
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1630, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond, label %.preheader8.preheader, label %.preheader9

.preheader8.preheader:                            ; preds = %53
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.preheader, %63
  %indvars.iv2032 = phi i64 [ %indvars.iv.next21, %63 ], [ 0, %.preheader8.preheader ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv2032, i64 1
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv2032, i64 1
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv2032, i64 0
  %59 = load double, double* %58, align 8
  %60 = fsub double %57, %59
  %61 = fmul double %60, 5.000000e-01
  %62 = fsub double %55, %61
  store double %62, double* %54, align 8
  br label %._crit_edge45

; <label>:63:                                     ; preds = %._crit_edge45
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2032, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond37, label %.preheader.preheader, label %.preheader8

.preheader.preheader:                             ; preds = %63
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %80
  %indvars.iv2434 = phi i64 [ %indvars.iv.next25, %80 ], [ 0, %.preheader.preheader ]
  %64 = add nuw nsw i64 %indvars.iv2434, 1
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44, %.preheader
  %indvars.iv2233 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next23, %._crit_edge44 ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv2434, i64 %indvars.iv2233
  %66 = load double, double* %65, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2233, 1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv2434, i64 %indvars.iv.next23
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv2434, i64 %indvars.iv2233
  %70 = load double, double* %69, align 8
  %71 = fsub double %68, %70
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %64, i64 %indvars.iv2233
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv2434, i64 %indvars.iv2233
  %76 = load double, double* %75, align 8
  %77 = fsub double %74, %76
  %78 = fmul double %77, 7.000000e-01
  %79 = fsub double %66, %78
  store double %79, double* %65, align 8
  %exitcond38 = icmp eq i64 %indvars.iv.next23, 1199
  br i1 %exitcond38, label %80, label %._crit_edge44

; <label>:80:                                     ; preds = %._crit_edge44
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv2434, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next25, 999
  br i1 %exitcond39, label %81, label %.preheader

; <label>:81:                                     ; preds = %80
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv2635, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next27, 500
  br i1 %exitcond40, label %82, label %.preheader13

; <label>:82:                                     ; preds = %81
  ret void

._crit_edge45:                                    ; preds = %._crit_edge45, %.preheader8
  %indvars.iv.next1942 = phi i64 [ 2, %.preheader8 ], [ %indvars.iv.next19, %._crit_edge45 ]
  %indvars.iv183141 = phi i64 [ 1, %.preheader8 ], [ %indvars.iv.next19.1, %._crit_edge45 ]
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv2032, i64 %indvars.iv.next1942
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv2032, i64 %indvars.iv.next1942
  %86 = load double, double* %85, align 8
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv2032, i64 %indvars.iv183141
  %88 = load double, double* %87, align 8
  %89 = fsub double %86, %88
  %90 = fmul double %89, 5.000000e-01
  %91 = fsub double %84, %90
  store double %91, double* %83, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv183141, 2
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv2032, i64 %indvars.iv.next19.1
  %93 = load double, double* %92, align 8
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv2032, i64 %indvars.iv.next19.1
  %95 = load double, double* %94, align 8
  %96 = add nsw i64 %indvars.iv183141, 1
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv2032, i64 %96
  %98 = load double, double* %97, align 8
  %99 = fsub double %95, %98
  %100 = fmul double %99, 5.000000e-01
  %101 = fsub double %93, %100
  store double %101, double* %92, align 8
  %indvars.iv.next19 = add nsw i64 %indvars.iv183141, 3
  %exitcond36 = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond36, label %63, label %._crit_edge45
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader13

.preheader13:                                     ; preds = %21, %5
  %indvars.iv2229 = phi i64 [ 0, %5 ], [ %indvars.iv.next23, %21 ]
  %10 = mul nuw nsw i64 %indvars.iv2229, 1000
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge, %.preheader13
  %indvars.iv2028 = phi i64 [ 0, %.preheader13 ], [ %indvars.iv.next21, %._crit_edge ]
  %11 = add nuw nsw i64 %indvars.iv2028, %10
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %._crit_edge35
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge35, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2229, i64 %indvars.iv2028
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2028, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next21, 1200
  br i1 %exitcond33, label %21, label %._crit_edge35

; <label>:21:                                     ; preds = %._crit_edge
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2229, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next23, 1000
  br i1 %exitcond34, label %22, label %.preheader13

; <label>:22:                                     ; preds = %21
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader12

.preheader12:                                     ; preds = %40, %22
  %indvars.iv1827 = phi i64 [ 0, %22 ], [ %indvars.iv.next19, %40 ]
  %29 = mul nuw nsw i64 %indvars.iv1827, 1000
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge36, %.preheader12
  %indvars.iv1626 = phi i64 [ 0, %.preheader12 ], [ %indvars.iv.next17, %._crit_edge36 ]
  %30 = add nuw nsw i64 %indvars.iv1626, %29
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %._crit_edge36

; <label>:34:                                     ; preds = %._crit_edge37
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %35) #5
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge37, %34
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1827, i64 %indvars.iv1626
  %38 = load double, double* %37, align 8
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %38) #6
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1626, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond31, label %40, label %._crit_edge37

; <label>:40:                                     ; preds = %._crit_edge36
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1827, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond32, label %41, label %.preheader12

; <label>:41:                                     ; preds = %40
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %57, %41
  %indvars.iv1425 = phi i64 [ 0, %41 ], [ %indvars.iv.next15, %57 ]
  %46 = mul nuw nsw i64 %indvars.iv1425, 1000
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge38, %.preheader
  %indvars.iv24 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge38 ]
  %47 = add nuw nsw i64 %indvars.iv24, %46
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, 20
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %._crit_edge38

; <label>:51:                                     ; preds = %._crit_edge39
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %52) #5
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge39, %51
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1425, i64 %indvars.iv24
  %55 = load double, double* %54, align 8
  %56 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %53, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %55) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %57, label %._crit_edge39

; <label>:57:                                     ; preds = %._crit_edge38
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1425, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond30, label %58, label %.preheader

; <label>:58:                                     ; preds = %57
  %59 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %60 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %59, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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

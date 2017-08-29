; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph40.preheader:
  br label %.lr.ph40

.lr.ph40:                                         ; preds = %.lr.ph40..lr.ph40_crit_edge, %.lr.ph40.preheader
  %indvars.iv3238 = phi i64 [ %indvars.iv.next33, %.lr.ph40..lr.ph40_crit_edge ], [ 0, %.lr.ph40.preheader ]
  %4 = trunc i64 %indvars.iv3238 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv3238
  store double %5, double* %6, align 8
  %exitcond44 = icmp eq i64 %indvars.iv3238, 499
  br i1 %exitcond44, label %.preheader.us.preheader, label %.lr.ph40..lr.ph40_crit_edge

.preheader.us.preheader:                          ; preds = %.lr.ph40
  br label %.preheader.us

.lr.ph40..lr.ph40_crit_edge:                      ; preds = %.lr.ph40
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv3238, 1
  br label %.lr.ph40

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv3035.us = phi i64 [ %indvars.iv.next31.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %7 = trunc i64 %indvars.iv3035.us to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv34.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv34.us, 1
  %11 = trunc i64 %indvars.iv.next.us to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv3035.us, i64 %indvars.iv34.us
  %14 = add nuw nsw i64 %indvars.iv34.us, 2
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fmul <2 x double> %10, %18
  %20 = fdiv <2 x double> %19, <double 1.000000e+03, double 1.200000e+03>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %13, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3035.us, i64 %indvars.iv34.us
  store double %22, double* %23, align 8
  %24 = add nuw nsw i64 %indvars.iv34.us, 3
  %25 = trunc i64 %24 to i32
  %26 = sitofp i32 %25 to double
  %27 = fmul double %8, %26
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv3035.us, i64 %indvars.iv34.us
  store double %28, double* %29, align 8
  %exitcond = icmp eq i64 %indvars.iv34.us, 1199
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next31.us = add nuw nsw i64 %indvars.iv3035.us, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next31.us, 1000
  br i1 %exitcond45, label %._crit_edge37, label %.preheader.us

._crit_edge37:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.preheader92.lr.ph:
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge108, %.preheader92.lr.ph
  %indvars.iv85109 = phi i64 [ 0, %.preheader92.lr.ph ], [ %indvars.iv.next86, %._crit_edge108 ]
  %sunkaddr128 = shl i64 %indvars.iv85109, 3
  %sunkaddr129 = add i64 %sunkaddr, %sunkaddr128
  %sunkaddr130 = inttoptr i64 %sunkaddr129 to i64*
  br label %15

.preheader88.us:                                  ; preds = %.preheader88.us.preheader, %._crit_edge.us
  %indvars.iv7596.us = phi i64 [ %indvars.iv.next76.us, %._crit_edge.us ], [ 1, %.preheader88.us.preheader ]
  %4 = add nsw i64 %indvars.iv7596.us, -1
  br label %5

; <label>:5:                                      ; preds = %._crit_edge, %.preheader88.us
  %indvars.iv7394.us = phi i64 [ 0, %.preheader88.us ], [ %indvars.iv.next74.us, %._crit_edge ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7596.us, i64 %indvars.iv7394.us
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7596.us, i64 %indvars.iv7394.us
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %4, i64 %indvars.iv7394.us
  %11 = load double, double* %10, align 8
  %12 = fsub double %9, %11
  %13 = fmul double %12, 5.000000e-01
  %14 = fsub double %7, %13
  store double %14, double* %6, align 8
  %exitcond118 = icmp eq i64 %indvars.iv7394.us, 1199
  br i1 %exitcond118, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %5
  %indvars.iv.next74.us = add nuw nsw i64 %indvars.iv7394.us, 1
  br label %5

._crit_edge.us:                                   ; preds = %5
  %indvars.iv.next76.us = add nuw nsw i64 %indvars.iv7596.us, 1
  %exitcond121 = icmp eq i64 %indvars.iv.next76.us, 1000
  br i1 %exitcond121, label %.preheader87.us.preheader, label %.preheader88.us

.preheader87.us.preheader:                        ; preds = %._crit_edge.us
  br label %.preheader87.us

; <label>:15:                                     ; preds = %._crit_edge126, %.lr.ph
  %indvars.iv93 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge126 ]
  %16 = load i64, i64* %sunkaddr130, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv93
  %18 = bitcast double* %17 to i64*
  store i64 %16, i64* %18, align 8
  %exitcond = icmp eq i64 %indvars.iv93, 1199
  br i1 %exitcond, label %.preheader88.us.preheader, label %._crit_edge126

.preheader88.us.preheader:                        ; preds = %15
  br label %.preheader88.us

._crit_edge126:                                   ; preds = %15
  %indvars.iv.next = add nuw nsw i64 %indvars.iv93, 1
  br label %15

.preheader87.us:                                  ; preds = %.preheader87.us.preheader, %._crit_edge100.us
  %indvars.iv79101.us = phi i64 [ %indvars.iv.next80.us, %._crit_edge100.us ], [ 0, %.preheader87.us.preheader ]
  br label %19

; <label>:19:                                     ; preds = %._crit_edge127, %.preheader87.us
  %indvars.iv7798.us = phi i64 [ 1, %.preheader87.us ], [ %indvars.iv.next78.us, %._crit_edge127 ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv79101.us, i64 %indvars.iv7798.us
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv79101.us, i64 %indvars.iv7798.us
  %23 = load double, double* %22, align 8
  %24 = add nsw i64 %indvars.iv7798.us, -1
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv79101.us, i64 %24
  %26 = load double, double* %25, align 8
  %27 = fsub double %23, %26
  %28 = fmul double %27, 5.000000e-01
  %29 = fsub double %21, %28
  store double %29, double* %20, align 8
  %exitcond120 = icmp eq i64 %indvars.iv7798.us, 1199
  br i1 %exitcond120, label %._crit_edge100.us, label %._crit_edge127

._crit_edge127:                                   ; preds = %19
  %indvars.iv.next78.us = add nuw nsw i64 %indvars.iv7798.us, 1
  br label %19

._crit_edge100.us:                                ; preds = %19
  %indvars.iv.next80.us = add nuw nsw i64 %indvars.iv79101.us, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next80.us, 1000
  br i1 %exitcond122, label %.preheader.us.preheader, label %.preheader87.us

.preheader.us.preheader:                          ; preds = %._crit_edge100.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge105.us
  %indvars.iv83106.us = phi i64 [ %30, %._crit_edge105.us ], [ 0, %.preheader.us.preheader ]
  %30 = add nuw nsw i64 %indvars.iv83106.us, 1
  br label %._crit_edge116

._crit_edge116:                                   ; preds = %._crit_edge116, %.preheader.us
  %indvars.iv81103.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next82.us, %._crit_edge116 ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv83106.us, i64 %indvars.iv81103.us
  %32 = load double, double* %31, align 8
  %indvars.iv.next82.us = add nuw nsw i64 %indvars.iv81103.us, 1
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv83106.us, i64 %indvars.iv.next82.us
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv83106.us, i64 %indvars.iv81103.us
  %36 = load double, double* %35, align 8
  %37 = fsub double %34, %36
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %30, i64 %indvars.iv81103.us
  %39 = load double, double* %38, align 8
  %40 = fadd double %37, %39
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv83106.us, i64 %indvars.iv81103.us
  %42 = load double, double* %41, align 8
  %43 = fsub double %40, %42
  %44 = fmul double %43, 7.000000e-01
  %45 = fsub double %32, %44
  store double %45, double* %31, align 8
  %exitcond123 = icmp eq i64 %indvars.iv.next82.us, 1199
  br i1 %exitcond123, label %._crit_edge105.us, label %._crit_edge116

._crit_edge105.us:                                ; preds = %._crit_edge116
  %exitcond124 = icmp eq i64 %30, 999
  br i1 %exitcond124, label %._crit_edge108, label %.preheader.us

._crit_edge108:                                   ; preds = %._crit_edge105.us
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85109, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next86, 500
  br i1 %exitcond125, label %._crit_edge110, label %.lr.ph

._crit_edge110:                                   ; preds = %._crit_edge108
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
.preheader55.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader55.us

.preheader55.us:                                  ; preds = %._crit_edge68.us, %.preheader55.us.preheader
  %indvars.iv4669.us = phi i64 [ 0, %.preheader55.us.preheader ], [ %indvars.iv.next47.us, %._crit_edge68.us ]
  %7 = mul nuw nsw i64 %indvars.iv4669.us, 1000
  br label %._crit_edge75

._crit_edge75:                                    ; preds = %._crit_edge, %.preheader55.us
  %indvars.iv4466.us = phi i64 [ 0, %.preheader55.us ], [ %indvars.iv.next45.us, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv4466.us, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge75
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc53.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge75, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4669.us, i64 %indvars.iv4466.us
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next45.us = add nuw nsw i64 %indvars.iv4466.us, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next45.us, 1200
  br i1 %exitcond85, label %._crit_edge68.us, label %._crit_edge75

._crit_edge68.us:                                 ; preds = %._crit_edge
  %indvars.iv.next47.us = add nuw nsw i64 %indvars.iv4669.us, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next47.us, 1000
  br i1 %exitcond86, label %.preheader54.us.preheader, label %.preheader55.us

.preheader54.us.preheader:                        ; preds = %._crit_edge68.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader54.us

.preheader54.us:                                  ; preds = %._crit_edge62.us, %.preheader54.us.preheader
  %indvars.iv4263.us = phi i64 [ 0, %.preheader54.us.preheader ], [ %indvars.iv.next43.us, %._crit_edge62.us ]
  %24 = mul nuw nsw i64 %indvars.iv4263.us, 1000
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge76, %.preheader54.us
  %indvars.iv4060.us = phi i64 [ 0, %.preheader54.us ], [ %indvars.iv.next41.us, %._crit_edge76 ]
  %25 = add nuw nsw i64 %indvars.iv4060.us, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge76

; <label>:29:                                     ; preds = %._crit_edge77
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc50.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge77, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4263.us, i64 %indvars.iv4060.us
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next41.us = add nuw nsw i64 %indvars.iv4060.us, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next41.us, 1200
  br i1 %exitcond83, label %._crit_edge62.us, label %._crit_edge77

._crit_edge62.us:                                 ; preds = %._crit_edge76
  %indvars.iv.next43.us = add nuw nsw i64 %indvars.iv4263.us, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next43.us, 1000
  br i1 %exitcond84, label %.preheader.us.preheader, label %.preheader54.us

.preheader.us.preheader:                          ; preds = %._crit_edge62.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv3857.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next39.us, %._crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv3857.us, 1000
  br label %._crit_edge79

._crit_edge79:                                    ; preds = %._crit_edge78, %.preheader.us
  %indvars.iv56.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge78 ]
  %40 = add nuw nsw i64 %indvars.iv56.us, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge78

; <label>:44:                                     ; preds = %._crit_edge79
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #4
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge79, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv3857.us, i64 %indvars.iv56.us
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv56.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge79

._crit_edge.us:                                   ; preds = %._crit_edge78
  %indvars.iv.next39.us = add nuw nsw i64 %indvars.iv3857.us, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next39.us, 1000
  br i1 %exitcond82, label %._crit_edge59, label %.preheader.us

._crit_edge59:                                    ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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

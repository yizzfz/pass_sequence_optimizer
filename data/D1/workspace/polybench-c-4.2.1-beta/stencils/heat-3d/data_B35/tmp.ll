; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader3.lr.ph, label %._crit_edge10

.preheader3.lr.ph:                                ; preds = %3
  %wide.trip.count34 = zext i32 %0 to i64
  %5 = sext i32 %0 to i64
  %6 = sitofp i32 %0 to double
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us, %.preheader3.lr.ph
  %indvars.iv36 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next37, %._crit_edge5.us ]
  %7 = trunc i64 %indvars.iv36 to i32
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, %5
  br i1 %exitcond39, label %._crit_edge10.loopexit, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge.us.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %8 = trunc i64 %indvars.iv32 to i32
  br label %9

._crit_edge.us.us:                                ; preds = %9
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge5.us, label %.preheader.us.us

; <label>:9:                                      ; preds = %9, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %9 ], [ 0, %.preheader.us.us ]
  %10 = trunc i64 %indvars.iv to i32
  %11 = sub i32 %0, %10
  %12 = add i32 %11, %7
  %13 = add i32 %12, %8
  %14 = sitofp i32 %13 to double
  %15 = fmul double %14, 1.000000e+01
  %16 = fdiv double %15, %6
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  store double %16, double* %17, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  store double %16, double* %18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count34
  br i1 %exitcond, label %._crit_edge.us.us, label %9

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %5 = add nsw i32 %1, -1
  %6 = sext i32 %1 to i64
  %7 = add nsw i64 %6, -1
  %wide.trip.count63 = zext i32 %5 to i64
  %8 = icmp sgt i32 %5, 1
  br label %.preheader11

.preheader11:                                     ; preds = %._crit_edge34, %4
  %9 = phi i32 [ 1, %4 ], [ %96, %._crit_edge34 ]
  br i1 %8, label %.preheader9.preheader, label %._crit_edge34

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10:                                     ; preds = %._crit_edge13
  br i1 %8, label %.preheader8.preheader, label %._crit_edge34

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge13
  %indvars.iv65 = phi i64 [ %10, %._crit_edge13 ], [ 1, %.preheader9.preheader ]
  %10 = add nuw nsw i64 %indvars.iv65, 1
  %11 = add nsw i64 %indvars.iv65, -1
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader9, %._crit_edge.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us ], [ 1, %.preheader9 ]
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %12 = add nsw i64 %indvars.iv61, -1
  br label %13

; <label>:13:                                     ; preds = %13, %.preheader7.us
  %indvars.iv = phi i64 [ 1, %.preheader7.us ], [ %indvars.iv.next, %13 ]
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %10, i64 %indvars.iv61, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, 2.000000e+00
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %11, i64 %indvars.iv61, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv.next62, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = insertelement <2 x double> undef, double %18, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = insertelement <2 x double> undef, double %15, i32 0
  %26 = insertelement <2 x double> %25, double %22, i32 1
  %27 = fsub <2 x double> %26, %24
  %28 = extractelement <2 x double> %27, i32 0
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %12, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = insertelement <2 x double> undef, double %28, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  %33 = insertelement <2 x double> undef, double %20, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> %27, <2 x i32> <i32 0, i32 3>
  %35 = fadd <2 x double> %34, %32
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = extractelement <2 x double> %36, i32 0
  %38 = extractelement <2 x double> %36, i32 1
  %39 = fadd double %37, %38
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv.next
  %41 = load double, double* %40, align 8
  %42 = fsub double %41, %18
  %43 = add nsw i64 %indvars.iv, -1
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv61, i64 %43
  %45 = load double, double* %44, align 8
  %46 = fadd double %42, %45
  %47 = fmul double %46, 1.250000e-01
  %48 = fadd double %39, %47
  %49 = fadd double %17, %48
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv
  store double %49, double* %50, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count63
  br i1 %exitcond, label %._crit_edge.us, label %13

._crit_edge.us:                                   ; preds = %13
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %._crit_edge13, label %.preheader7.us

._crit_edge13:                                    ; preds = %._crit_edge.us
  %51 = icmp slt i64 %10, %7
  br i1 %51, label %.preheader9, label %.preheader10

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge29
  %indvars.iv74 = phi i64 [ %52, %._crit_edge29 ], [ 1, %.preheader8.preheader ]
  %52 = add nuw nsw i64 %indvars.iv74, 1
  %53 = add nsw i64 %indvars.iv74, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader8, %._crit_edge26.us
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge26.us ], [ 1, %.preheader8 ]
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %54 = add nsw i64 %indvars.iv71, -1
  br label %55

; <label>:55:                                     ; preds = %.preheader.us, %55
  %indvars.iv68 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next69, %55 ]
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %52, i64 %indvars.iv71, i64 %indvars.iv68
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv68
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, 2.000000e+00
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %53, i64 %indvars.iv71, i64 %indvars.iv68
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %indvars.iv.next72, i64 %indvars.iv68
  %64 = load double, double* %63, align 8
  %65 = insertelement <2 x double> undef, double %60, i32 0
  %66 = shufflevector <2 x double> %65, <2 x double> undef, <2 x i32> zeroinitializer
  %67 = insertelement <2 x double> undef, double %57, i32 0
  %68 = insertelement <2 x double> %67, double %64, i32 1
  %69 = fsub <2 x double> %68, %66
  %70 = extractelement <2 x double> %69, i32 0
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %54, i64 %indvars.iv68
  %72 = load double, double* %71, align 8
  %73 = insertelement <2 x double> undef, double %70, i32 0
  %74 = insertelement <2 x double> %73, double %72, i32 1
  %75 = insertelement <2 x double> undef, double %62, i32 0
  %76 = shufflevector <2 x double> %75, <2 x double> %69, <2 x i32> <i32 0, i32 3>
  %77 = fadd <2 x double> %76, %74
  %78 = fmul <2 x double> %77, <double 1.250000e-01, double 1.250000e-01>
  %79 = extractelement <2 x double> %78, i32 0
  %80 = extractelement <2 x double> %78, i32 1
  %81 = fadd double %79, %80
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv.next69
  %83 = load double, double* %82, align 8
  %84 = fsub double %83, %60
  %85 = add nsw i64 %indvars.iv68, -1
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %indvars.iv71, i64 %85
  %87 = load double, double* %86, align 8
  %88 = fadd double %84, %87
  %89 = fmul double %88, 1.250000e-01
  %90 = fadd double %81, %89
  %91 = fadd double %59, %90
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv68
  store double %91, double* %92, align 8
  %93 = icmp slt i64 %indvars.iv.next69, %7
  br i1 %93, label %55, label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %55
  %94 = icmp slt i64 %indvars.iv.next72, %7
  br i1 %94, label %.preheader.us, label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge26.us
  %95 = icmp slt i64 %52, %7
  br i1 %95, label %.preheader8, label %._crit_edge34.loopexit

._crit_edge34.loopexit:                           ; preds = %._crit_edge29
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %.preheader11, %.preheader10
  %96 = add nuw nsw i32 %9, 1
  %exitcond78 = icmp eq i32 %96, 501
  br i1 %exitcond78, label %97, label %.preheader11

; <label>:97:                                     ; preds = %._crit_edge34
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader3.lr.ph, label %._crit_edge10

.preheader3.lr.ph:                                ; preds = %2
  %wide.trip.count34 = zext i32 %0 to i64
  %8 = sext i32 %0 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us, %.preheader3.lr.ph
  %indvars.iv36 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next37, %._crit_edge5.us ]
  %9 = mul nsw i64 %indvars.iv36, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, %8
  br i1 %exitcond39, label %._crit_edge10.loopexit, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge.us.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %11 = trunc i64 %indvars.iv32 to i32
  %12 = add i32 %10, %11
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %15

._crit_edge.us.us:                                ; preds = %22
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge5.us, label %.preheader.us.us

; <label>:15:                                     ; preds = %22, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %22 ], [ 0, %.preheader.us.us ]
  %16 = add i64 %14, %indvars.iv
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %15
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %22

; <label>:22:                                     ; preds = %20, %15
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %25) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count34
  br i1 %exitcond, label %._crit_edge.us.us, label %15

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %2
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
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

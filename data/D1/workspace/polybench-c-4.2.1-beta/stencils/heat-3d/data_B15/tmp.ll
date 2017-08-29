; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
  tail call void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) #2 {
  %4 = sext i32 %0 to i64
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader3.preheader.preheader, label %._crit_edge

.preheader3.preheader.preheader:                  ; preds = %3
  %wide.trip.count6 = zext i32 %0 to i64
  %6 = sitofp i32 %0 to double
  %xtraiter = and i64 %wide.trip.count6, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  br label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader3.preheader.preheader, %.preheader3._crit_edge
  %indvars.iv815 = phi i64 [ %indvars.iv.next9, %.preheader3._crit_edge ], [ 0, %.preheader3.preheader.preheader ]
  %8 = add nsw i64 %indvars.iv815, %4
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader3
  %indvars.iv413 = phi i64 [ %indvars.iv.next5, %.preheader3 ], [ 0, %.preheader.preheader.preheader ]
  %9 = add i64 %8, %indvars.iv413
  br i1 %lcmp.mod, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fmul double %11, 1.000000e+01
  %13 = fdiv double %12, %6
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv815, i64 %indvars.iv413, i64 0
  store double %13, double* %14, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv815, i64 %indvars.iv413, i64 0
  store double %13, double* %15, align 8
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol, %.preheader.preheader
  %indvars.iv11.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader ]
  br i1 %7, label %.preheader3, label %.preheader.preheader37

.preheader.preheader37:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader37, %.preheader
  %indvars.iv11 = phi i64 [ %indvars.iv.next.1, %.preheader ], [ %indvars.iv11.unr.ph, %.preheader.preheader37 ]
  %16 = sub i64 %9, %indvars.iv11
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = fmul double %18, 1.000000e+01
  %20 = fdiv double %19, %6
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv815, i64 %indvars.iv413, i64 %indvars.iv11
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv815, i64 %indvars.iv413, i64 %indvars.iv11
  store double %20, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv11, 1
  %23 = sub i64 %9, %indvars.iv.next
  %24 = trunc i64 %23 to i32
  %25 = sitofp i32 %24 to double
  %26 = fmul double %25, 1.000000e+01
  %27 = fdiv double %26, %6
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv815, i64 %indvars.iv413, i64 %indvars.iv.next
  store double %27, double* %28, align 8
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv815, i64 %indvars.iv413, i64 %indvars.iv.next
  store double %27, double* %29, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv11, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count6
  br i1 %exitcond.1, label %.preheader3.loopexit, label %.preheader

.preheader3.loopexit:                             ; preds = %.preheader
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv413, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next5, %wide.trip.count6
  br i1 %exitcond7, label %.preheader3._crit_edge, label %.preheader.preheader

.preheader3._crit_edge:                           ; preds = %.preheader3
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv815, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, %4
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader3._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_heat_3d(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) #2 {
  %4 = add i32 %0, -1
  %5 = sext i32 %4 to i64
  %6 = icmp sgt i32 %4, 1
  %wide.trip.count8 = zext i32 %4 to i64
  %exitcond925 = icmp eq i32 %4, 1
  br label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %3, %.preheader4._crit_edge
  %.0540 = phi i32 [ 1, %3 ], [ %81, %.preheader4._crit_edge ]
  br i1 %6, label %.preheader3.preheader.preheader, label %.preheader4._crit_edge

.preheader3.preheader.preheader:                  ; preds = %.preheader5.preheader
  br label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %.preheader3.preheader.preheader, %.preheader5
  %indvars.iv1028 = phi i64 [ %.pre, %.preheader5 ], [ 1, %.preheader3.preheader.preheader ]
  %.pre = add nuw nsw i64 %indvars.iv1028, 1
  br i1 %exitcond925, label %.preheader5, label %.preheader1.preheader.lr.ph

.preheader1.preheader.lr.ph:                      ; preds = %.preheader3.preheader
  %7 = add nsw i64 %indvars.iv1028, -1
  br label %.preheader1.preheader

.preheader1.preheader:                            ; preds = %.preheader1.preheader.lr.ph, %.preheader3
  %indvars.iv626 = phi i64 [ 1, %.preheader1.preheader.lr.ph ], [ %8, %.preheader3 ]
  %8 = add nuw nsw i64 %indvars.iv626, 1
  %9 = add nsw i64 %indvars.iv626, -1
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.preheader, %.preheader1
  %indvars.iv24 = phi i64 [ 1, %.preheader1.preheader ], [ %indvars.iv.next, %.preheader1 ]
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %.pre, i64 %indvars.iv626, i64 %indvars.iv24
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv1028, i64 %indvars.iv626, i64 %indvars.iv24
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, 2.000000e+00
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %7, i64 %indvars.iv626, i64 %indvars.iv24
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv1028, i64 %8, i64 %indvars.iv24
  %18 = load double, double* %17, align 8
  %19 = insertelement <2 x double> undef, double %14, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x double> undef, double %11, i32 0
  %22 = insertelement <2 x double> %21, double %18, i32 1
  %23 = fsub <2 x double> %22, %20
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv1028, i64 %9, i64 %indvars.iv24
  %25 = load double, double* %24, align 8
  %26 = insertelement <2 x double> undef, double %16, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fadd <2 x double> %23, %27
  %29 = fmul <2 x double> %28, <double 1.250000e-01, double 1.250000e-01>
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = fadd double %30, %31
  %indvars.iv.next = add nuw nsw i64 %indvars.iv24, 1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv1028, i64 %indvars.iv626, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = fsub double %34, %14
  %36 = add nsw i64 %indvars.iv24, -1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv1028, i64 %indvars.iv626, i64 %36
  %38 = load double, double* %37, align 8
  %39 = fadd double %35, %38
  %40 = fmul double %39, 1.250000e-01
  %41 = fadd double %40, %32
  %42 = fadd double %13, %41
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv1028, i64 %indvars.iv626, i64 %indvars.iv24
  store double %42, double* %43, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count8
  br i1 %exitcond, label %.preheader3, label %.preheader1

.preheader3:                                      ; preds = %.preheader1
  %exitcond9 = icmp eq i64 %8, %wide.trip.count8
  br i1 %exitcond9, label %.preheader5.loopexit, label %.preheader1.preheader

.preheader5.loopexit:                             ; preds = %.preheader3
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader3.preheader
  %exitcond41 = icmp eq i64 %.pre, %5
  br i1 %exitcond41, label %.preheader2.preheader.preheader, label %.preheader3.preheader

.preheader2.preheader.preheader:                  ; preds = %.preheader5
  br label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %.preheader2.preheader.preheader, %.preheader4
  %indvars.iv2037 = phi i64 [ %.pre43, %.preheader4 ], [ 1, %.preheader2.preheader.preheader ]
  %.pre43 = add nuw nsw i64 %indvars.iv2037, 1
  br i1 %exitcond925, label %.preheader4, label %.preheader.preheader.lr.ph

.preheader.preheader.lr.ph:                       ; preds = %.preheader2.preheader
  %44 = add nsw i64 %indvars.iv2037, -1
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.lr.ph, %.preheader2
  %indvars.iv1635 = phi i64 [ 1, %.preheader.preheader.lr.ph ], [ %45, %.preheader2 ]
  %45 = add nuw nsw i64 %indvars.iv1635, 1
  %46 = add nsw i64 %indvars.iv1635, -1
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv1232 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next13, %.preheader ]
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %.pre43, i64 %indvars.iv1635, i64 %indvars.iv1232
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv2037, i64 %indvars.iv1635, i64 %indvars.iv1232
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, 2.000000e+00
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %44, i64 %indvars.iv1635, i64 %indvars.iv1232
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv2037, i64 %45, i64 %indvars.iv1232
  %55 = load double, double* %54, align 8
  %56 = insertelement <2 x double> undef, double %51, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = insertelement <2 x double> undef, double %48, i32 0
  %59 = insertelement <2 x double> %58, double %55, i32 1
  %60 = fsub <2 x double> %59, %57
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv2037, i64 %46, i64 %indvars.iv1232
  %62 = load double, double* %61, align 8
  %63 = insertelement <2 x double> undef, double %53, i32 0
  %64 = insertelement <2 x double> %63, double %62, i32 1
  %65 = fadd <2 x double> %60, %64
  %66 = fmul <2 x double> %65, <double 1.250000e-01, double 1.250000e-01>
  %67 = extractelement <2 x double> %66, i32 0
  %68 = extractelement <2 x double> %66, i32 1
  %69 = fadd double %67, %68
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1232, 1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv2037, i64 %indvars.iv1635, i64 %indvars.iv.next13
  %71 = load double, double* %70, align 8
  %72 = fsub double %71, %51
  %73 = add nsw i64 %indvars.iv1232, -1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv2037, i64 %indvars.iv1635, i64 %73
  %75 = load double, double* %74, align 8
  %76 = fadd double %72, %75
  %77 = fmul double %76, 1.250000e-01
  %78 = fadd double %77, %69
  %79 = fadd double %50, %78
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv2037, i64 %indvars.iv1635, i64 %indvars.iv1232
  store double %79, double* %80, align 8
  %exitcond15 = icmp eq i64 %indvars.iv.next13, %wide.trip.count8
  br i1 %exitcond15, label %.preheader2, label %.preheader

.preheader2:                                      ; preds = %.preheader
  %exitcond19 = icmp eq i64 %45, %wide.trip.count8
  br i1 %exitcond19, label %.preheader4.loopexit, label %.preheader.preheader

.preheader4.loopexit:                             ; preds = %.preheader2
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader2.preheader
  %exitcond42 = icmp eq i64 %.pre43, %5
  br i1 %exitcond42, label %.preheader4._crit_edge.loopexit, label %.preheader2.preheader

.preheader4._crit_edge.loopexit:                  ; preds = %.preheader4
  br label %.preheader4._crit_edge

.preheader4._crit_edge:                           ; preds = %.preheader4._crit_edge.loopexit, %.preheader5.preheader
  %81 = add nuw nsw i32 %.0540, 1
  %exitcond22 = icmp eq i32 %81, 501
  br i1 %exitcond22, label %82, label %.preheader5.preheader

; <label>:82:                                     ; preds = %.preheader4._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [120 x [120 x double]]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader3.preheader.preheader, label %._crit_edge

.preheader3.preheader.preheader:                  ; preds = %2
  %wide.trip.count6 = zext i32 %0 to i64
  br label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader3.preheader.preheader, %.preheader3._crit_edge
  %indvars.iv815 = phi i64 [ %indvars.iv.next9, %.preheader3._crit_edge ], [ 0, %.preheader3.preheader.preheader ]
  %9 = mul nsw i64 %indvars.iv815, %7
  %10 = trunc i64 %9 to i32
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader3
  %indvars.iv413 = phi i64 [ %indvars.iv.next5, %.preheader3 ], [ 0, %.preheader.preheader.preheader ]
  %11 = trunc i64 %indvars.iv413 to i32
  %12 = add i32 %11, %10
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %15

; <label>:15:                                     ; preds = %.preheader.preheader, %.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %16 = add i64 %indvars.iv11, %14
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %.preheader

; <label>:20:                                     ; preds = %15
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %.preheader

.preheader:                                       ; preds = %20, %15
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv815, i64 %indvars.iv413, i64 %indvars.iv11
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count6
  br i1 %exitcond, label %.preheader3, label %15

.preheader3:                                      ; preds = %.preheader
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv413, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next5, %wide.trip.count6
  br i1 %exitcond7, label %.preheader3._crit_edge, label %.preheader.preheader

.preheader3._crit_edge:                           ; preds = %.preheader3
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv815, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next9, %7
  br i1 %exitcond35, label %._crit_edge.loopexit, label %.preheader.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader3._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #5
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

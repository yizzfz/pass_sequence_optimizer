; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  tail call fastcc void @init_array([1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @kernel_3mm([900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array([1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader60

.preheader60:                                     ; preds = %12, %4
  %indvars.iv19 = phi i64 [ 0, %4 ], [ %indvars.iv.next20, %12 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader60
  %indvars.iv7 = phi i64 [ 0, %.preheader60 ], [ %indvars.iv.next8, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv7, %indvars.iv19
  %6 = add nuw nsw i64 %5, 1
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 800
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 4.000000e+03
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv7
  store double %10, double* %11, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 800
  br i1 %exitcond21, label %.preheader58.preheader, label %.preheader60

.preheader58.preheader:                           ; preds = %12
  br label %.preheader58

.preheader58:                                     ; preds = %.preheader58.preheader, %20
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %20 ], [ 0, %.preheader58.preheader ]
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22, %.preheader58
  %indvars.iv4 = phi i64 [ 0, %.preheader58 ], [ %indvars.iv.next5, %._crit_edge22 ]
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %13 = mul nuw nsw i64 %indvars.iv.next5, %indvars.iv16
  %14 = add nuw nsw i64 %13, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 900
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 4.500000e+03
  %19 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv4
  store double %18, double* %19, align 8
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 900
  br i1 %exitcond6, label %20, label %._crit_edge22

; <label>:20:                                     ; preds = %._crit_edge22
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond18, label %.preheader56.preheader, label %.preheader58

.preheader56.preheader:                           ; preds = %20
  br label %.preheader56

.preheader56:                                     ; preds = %.preheader56.preheader, %28
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %28 ], [ 0, %.preheader56.preheader ]
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23, %.preheader56
  %indvars.iv1 = phi i64 [ 0, %.preheader56 ], [ %indvars.iv.next2, %._crit_edge23 ]
  %21 = add nuw nsw i64 %indvars.iv1, 3
  %22 = mul nuw nsw i64 %21, %indvars.iv13
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 1100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 5.500000e+03
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv1
  store double %26, double* %27, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %28, label %._crit_edge23

; <label>:28:                                     ; preds = %._crit_edge23
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 900
  br i1 %exitcond15, label %.preheader.preheader, label %.preheader56

.preheader.preheader:                             ; preds = %28
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %37
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %37 ], [ 0, %.preheader.preheader ]
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge24 ]
  %29 = add nuw nsw i64 %indvars.iv, 2
  %30 = mul nuw nsw i64 %29, %indvars.iv10
  %31 = add nuw nsw i64 %30, 2
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1000
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 5.000000e+03
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv
  store double %35, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %37, label %._crit_edge24

; <label>:37:                                     ; preds = %._crit_edge24
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1200
  br i1 %exitcond12, label %38, label %.preheader

; <label>:38:                                     ; preds = %37
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm([900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader71

.preheader71:                                     ; preds = %..preheader71_crit_edge, %7
  %indvar13 = phi i64 [ 0, %7 ], [ %indvar.next14, %..preheader71_crit_edge ]
  %.06580 = phi i64 [ 0, %7 ], [ %25, %..preheader71_crit_edge ]
  %sext = shl i64 %.06580, 32
  %8 = ashr exact i64 %sext, 32
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %23, %.preheader71
  %indvars.iv24 = phi i64 [ 0, %.preheader71 ], [ %indvars.iv.next25, %23 ]
  %9 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %8, i64 %indvars.iv24
  store double 0.000000e+00, double* %9, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge27
  %indvars.iv10 = phi i64 [ 0, %._crit_edge27 ], [ %indvars.iv.next11.1, %._crit_edge ]
  %10 = phi double [ 0.000000e+00, %._crit_edge27 ], [ %22, %._crit_edge ]
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %8, i64 %indvars.iv10
  %12 = load double, double* %11, align 8
  %13 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv24
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fadd double %10, %15
  store double %16, double* %9, align 8
  %indvars.iv.next11 = or i64 %indvars.iv10, 1
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %8, i64 %indvars.iv.next11
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv.next11, i64 %indvars.iv24
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %16, %21
  store double %22, double* %9, align 8
  %indvars.iv.next11.1 = add nuw nsw i64 %indvars.iv10, 2
  %exitcond12.1 = icmp eq i64 %indvars.iv.next11.1, 1000
  br i1 %exitcond12.1, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %._crit_edge
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 900
  br i1 %exitcond26, label %24, label %._crit_edge27

; <label>:24:                                     ; preds = %23
  %indvar.next14 = add nuw nsw i64 %indvar13, 1
  %exitcond16 = icmp eq i64 %indvar.next14, 800
  br i1 %exitcond16, label %.preheader69.preheader, label %..preheader71_crit_edge

.preheader69.preheader:                           ; preds = %24
  br label %.preheader69

..preheader71_crit_edge:                          ; preds = %24
  %25 = add nsw i64 %8, 1
  br label %.preheader71

.preheader69:                                     ; preds = %.preheader69.preheader, %..preheader69_crit_edge
  %indvar6 = phi i64 [ %indvar.next7, %..preheader69_crit_edge ], [ 0, %.preheader69.preheader ]
  %.16677 = phi i64 [ %49, %..preheader69_crit_edge ], [ 0, %.preheader69.preheader ]
  %sext17 = shl i64 %.16677, 32
  %26 = ashr exact i64 %sext17, 32
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %47, %.preheader69
  %indvars.iv21 = phi i64 [ 0, %.preheader69 ], [ %indvars.iv.next22, %47 ]
  %27 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %26, i64 %indvars.iv21
  store double 0.000000e+00, double* %27, align 8
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28, %._crit_edge29
  %indvars.iv3 = phi i64 [ 0, %._crit_edge29 ], [ %indvars.iv.next4.2, %._crit_edge28 ]
  %28 = phi double [ 0.000000e+00, %._crit_edge29 ], [ %46, %._crit_edge28 ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %26, i64 %indvars.iv3
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv3, i64 %indvars.iv21
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  store double %34, double* %27, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %26, i64 %indvars.iv.next4
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next4, i64 %indvars.iv21
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %34, %39
  store double %40, double* %27, align 8
  %indvars.iv.next4.1 = add nuw nsw i64 %indvars.iv3, 2
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %26, i64 %indvars.iv.next4.1
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next4.1, i64 %indvars.iv21
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %40, %45
  store double %46, double* %27, align 8
  %indvars.iv.next4.2 = add nuw nsw i64 %indvars.iv3, 3
  %exitcond5.2 = icmp eq i64 %indvars.iv.next4.2, 1200
  br i1 %exitcond5.2, label %47, label %._crit_edge28

; <label>:47:                                     ; preds = %._crit_edge28
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 1100
  br i1 %exitcond23, label %48, label %._crit_edge29

; <label>:48:                                     ; preds = %47
  %indvar.next7 = add nuw nsw i64 %indvar6, 1
  %exitcond9 = icmp eq i64 %indvar.next7, 900
  br i1 %exitcond9, label %.preheader.preheader, label %..preheader69_crit_edge

.preheader.preheader:                             ; preds = %48
  br label %.preheader

..preheader69_crit_edge:                          ; preds = %48
  %49 = add nsw i64 %26, 1
  br label %.preheader69

.preheader:                                       ; preds = %.preheader.preheader, %..preheader_crit_edge
  %indvar = phi i64 [ %indvar.next, %..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %.26774 = phi i64 [ %73, %..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %sext18 = shl i64 %.26774, 32
  %50 = ashr exact i64 %sext18, 32
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %71, %.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next20, %71 ]
  %51 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %50, i64 %indvars.iv19
  store double 0.000000e+00, double* %51, align 8
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30, %._crit_edge31
  %indvars.iv = phi i64 [ 0, %._crit_edge31 ], [ %indvars.iv.next.2, %._crit_edge30 ]
  %52 = phi double [ 0.000000e+00, %._crit_edge31 ], [ %70, %._crit_edge30 ]
  %53 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %50, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv, i64 %indvars.iv19
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %52, %57
  store double %58, double* %51, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %59 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %50, i64 %indvars.iv.next
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv19
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %58, %63
  store double %64, double* %51, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %65 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %50, i64 %indvars.iv.next.1
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next.1, i64 %indvars.iv19
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fadd double %64, %69
  store double %70, double* %51, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %71, label %._crit_edge30

; <label>:71:                                     ; preds = %._crit_edge30
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, 1100
  br i1 %exitcond, label %72, label %._crit_edge31

; <label>:72:                                     ; preds = %71
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond2 = icmp eq i64 %indvar.next, 800
  br i1 %exitcond2, label %74, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %72
  %73 = add nsw i64 %50, 1
  br label %.preheader

; <label>:74:                                     ; preds = %72
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

.preheader:                                       ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 800
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %17, label %._crit_edge4

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond3, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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

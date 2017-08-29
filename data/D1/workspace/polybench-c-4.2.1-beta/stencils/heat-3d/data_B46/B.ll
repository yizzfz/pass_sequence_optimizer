; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
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
  tail call void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader3.lr.ph, label %._crit_edge8

.preheader3.lr.ph:                                ; preds = %3
  %5 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  %wide.trip.count20 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.lr.ph, %._crit_edge6.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge6.us ], [ 0, %.preheader3.lr.ph ]
  %7 = trunc i64 %indvars.iv21 to i32
  %8 = add i32 %7, %0
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count20
  br i1 %exitcond24, label %._crit_edge8.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us.us ]
  %9 = trunc i64 %indvars.iv18 to i32
  %10 = add i32 %8, %9
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %11 = sitofp i32 %10 to double
  %12 = fmul double %11, 1.000000e+01
  %13 = fdiv double %12, %5
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv21, i64 %indvars.iv18, i64 0
  store double %13, double* %14, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv18, i64 0
  store double %13, double* %15, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %6, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond, label %._crit_edge6.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %16 = trunc i64 %indvars.iv to i32
  %17 = sub i32 %10, %16
  %18 = sitofp i32 %17 to double
  %19 = fmul double %18, 1.000000e+01
  %20 = fdiv double %19, %5
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv
  store double %20, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %23 = trunc i64 %indvars.iv.next to i32
  %24 = sub i32 %10, %23
  %25 = sitofp i32 %24 to double
  %26 = fmul double %25, 1.000000e+01
  %27 = fdiv double %26, %5
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv.next
  store double %27, double* %28, align 8
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv.next
  store double %27, double* %29, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count20
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_heat_3d(i32, i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) #2 {
  %5 = add nsw i32 %1, -1
  %6 = icmp sgt i32 %5, 1
  %wide.trip.count25 = zext i32 %5 to i64
  br label %.preheader10

.preheader10:                                     ; preds = %._crit_edge21, %4
  %.0522 = phi i32 [ 1, %4 ], [ %85, %._crit_edge21 ]
  br i1 %6, label %.preheader8.preheader, label %._crit_edge21

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge13
  %indvars.iv27 = phi i64 [ %7, %._crit_edge13 ], [ 1, %.preheader8.preheader ]
  %7 = add nuw nsw i64 %indvars.iv27, 1
  %8 = add nsw i64 %indvars.iv27, -1
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge.us, %.preheader8
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge.us ], [ 1, %.preheader8 ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %9 = add nsw i64 %indvars.iv23, -1
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader6.us
  %indvars.iv = phi i64 [ 1, %.preheader6.us ], [ %indvars.iv.next, %10 ]
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %7, i64 %indvars.iv23, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %8, i64 %indvars.iv23, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv.next24, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = insertelement <2 x double> undef, double %14, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = fmul <2 x double> %20, <double 2.000000e+00, double 2.000000e+00>
  %22 = insertelement <2 x double> undef, double %12, i32 0
  %23 = insertelement <2 x double> %22, double %18, i32 1
  %24 = fsub <2 x double> %23, %21
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %9, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = insertelement <2 x double> undef, double %16, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fadd <2 x double> %24, %28
  %30 = fmul <2 x double> %29, <double 1.250000e-01, double 1.250000e-01>
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fadd double %31, %32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv.next
  %35 = load double, double* %34, align 8
  %36 = fmul double %14, 2.000000e+00
  %37 = fsub double %35, %36
  %38 = add nsw i64 %indvars.iv, -1
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %38
  %40 = load double, double* %39, align 8
  %41 = fadd double %37, %40
  %42 = fmul double %41, 1.250000e-01
  %43 = fadd double %42, %33
  %44 = fadd double %14, %43
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  store double %44, double* %45, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count25
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %10
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %._crit_edge13, label %.preheader6.us

._crit_edge13:                                    ; preds = %._crit_edge.us
  %exitcond30 = icmp eq i64 %7, %wide.trip.count25
  br i1 %exitcond30, label %.preheader.lr.ph.preheader, label %.preheader8

.preheader.lr.ph.preheader:                       ; preds = %._crit_edge13
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge19
  %indvars.iv39 = phi i64 [ %46, %._crit_edge19 ], [ 1, %.preheader.lr.ph.preheader ]
  %46 = add nuw nsw i64 %indvars.iv39, 1
  %47 = add nsw i64 %indvars.iv39, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge17.us, %.preheader.lr.ph
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge17.us ], [ 1, %.preheader.lr.ph ]
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %48 = add nsw i64 %indvars.iv35, -1
  br label %49

; <label>:49:                                     ; preds = %49, %.preheader.us
  %indvars.iv31 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next32, %49 ]
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %46, i64 %indvars.iv35, i64 %indvars.iv31
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv31
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %47, i64 %indvars.iv35, i64 %indvars.iv31
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv.next36, i64 %indvars.iv31
  %57 = load double, double* %56, align 8
  %58 = insertelement <2 x double> undef, double %53, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  %60 = fmul <2 x double> %59, <double 2.000000e+00, double 2.000000e+00>
  %61 = insertelement <2 x double> undef, double %51, i32 0
  %62 = insertelement <2 x double> %61, double %57, i32 1
  %63 = fsub <2 x double> %62, %60
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %48, i64 %indvars.iv31
  %65 = load double, double* %64, align 8
  %66 = insertelement <2 x double> undef, double %55, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  %68 = fadd <2 x double> %63, %67
  %69 = fmul <2 x double> %68, <double 1.250000e-01, double 1.250000e-01>
  %70 = extractelement <2 x double> %69, i32 0
  %71 = extractelement <2 x double> %69, i32 1
  %72 = fadd double %70, %71
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv.next32
  %74 = load double, double* %73, align 8
  %75 = fmul double %53, 2.000000e+00
  %76 = fsub double %74, %75
  %77 = add nsw i64 %indvars.iv31, -1
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %77
  %79 = load double, double* %78, align 8
  %80 = fadd double %76, %79
  %81 = fmul double %80, 1.250000e-01
  %82 = fadd double %81, %72
  %83 = fadd double %53, %82
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv31
  store double %83, double* %84, align 8
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count25
  br i1 %exitcond34, label %._crit_edge17.us, label %49

._crit_edge17.us:                                 ; preds = %49
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count25
  br i1 %exitcond38, label %._crit_edge19, label %.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge17.us
  %exitcond42 = icmp eq i64 %46, %wide.trip.count25
  br i1 %exitcond42, label %._crit_edge21.loopexit, label %.preheader.lr.ph

._crit_edge21.loopexit:                           ; preds = %._crit_edge19
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.preheader10
  %85 = add nuw nsw i32 %.0522, 1
  %exitcond43 = icmp eq i32 %85, 501
  br i1 %exitcond43, label %86, label %.preheader10

; <label>:86:                                     ; preds = %._crit_edge21
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [120 x [120 x double]]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader3.lr.ph, label %._crit_edge8

.preheader3.lr.ph:                                ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.lr.ph, %._crit_edge6.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge6.us ], [ 0, %.preheader3.lr.ph ]
  %9 = mul nsw i64 %indvars.iv22, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, %wide.trip.count
  br i1 %exitcond25, label %._crit_edge8.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us.us ]
  %11 = trunc i64 %indvars.iv18 to i32
  %12 = add i32 %11, %10
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %15

._crit_edge.us.us:                                ; preds = %22
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count
  br i1 %exitcond21, label %._crit_edge6.us, label %.preheader.us.us

; <label>:15:                                     ; preds = %22, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %22 ], [ 0, %.preheader.us.us ]
  %16 = add i64 %indvars.iv, %14
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
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %25) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %15

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

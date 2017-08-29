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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br i1 true, label %.preheader19.lr.ph, label %._crit_edge24

.preheader19.lr.ph:                               ; preds = %3
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge22.us, %.preheader19.lr.ph
  %indvars.iv36 = phi i64 [ 0, %.preheader19.lr.ph ], [ %indvars.iv.next37, %._crit_edge22.us ]
  %4 = trunc i64 %indvars.iv36 to i32
  %5 = add i32 %4, 120
  br label %.preheader.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond38 = icmp ne i64 %indvars.iv.next37, 120
  br i1 %exitcond38, label %.preheader.us.us.preheader, label %._crit_edge24.loopexit

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv34 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next35, %._crit_edge.us.us ]
  %6 = trunc i64 %indvars.iv34 to i32
  %7 = add i32 %5, %6
  br label %8

._crit_edge.us.us:                                ; preds = %8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp ne i64 %indvars.iv.next35, 120
  br i1 %exitcond, label %.preheader.us.us, label %._crit_edge22.us

; <label>:8:                                      ; preds = %8, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next.1, %8 ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = sub nuw nsw i32 %7, %9
  %11 = sitofp i32 %10 to double
  %12 = fmul double %11, 1.000000e+01
  %13 = fdiv double %12, 1.200000e+02
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv36, i64 %indvars.iv34, i64 %indvars.iv
  store double %13, double* %14, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv36, i64 %indvars.iv34, i64 %indvars.iv
  store double %13, double* %15, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %16 = trunc i64 %indvars.iv.next to i32
  %17 = sub nuw nsw i32 %7, %16
  %18 = sitofp i32 %17 to double
  %19 = fmul double %18, 1.000000e+01
  %20 = fdiv double %19, 1.200000e+02
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv36, i64 %indvars.iv34, i64 %indvars.iv.next
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv36, i64 %indvars.iv34, i64 %indvars.iv.next
  store double %20, double* %22, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 119
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us.us, label %8

._crit_edge24.loopexit:                           ; preds = %._crit_edge22.us
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader110

.preheader110:                                    ; preds = %._crit_edge121, %4
  %storemerge122 = phi i32 [ 1, %4 ], [ %85, %._crit_edge121 ]
  br i1 true, label %.preheader108.preheader, label %._crit_edge121

.preheader108.preheader:                          ; preds = %.preheader110
  br label %.preheader108

.preheader109:                                    ; preds = %._crit_edge113
  br i1 true, label %.preheader.lr.ph.preheader, label %._crit_edge121

.preheader.lr.ph.preheader:                       ; preds = %.preheader109
  br label %.preheader.lr.ph

.preheader108:                                    ; preds = %.preheader108.preheader, %._crit_edge113
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %._crit_edge113 ], [ 1, %.preheader108.preheader ]
  br i1 true, label %.preheader106.lr.ph, label %._crit_edge113

.preheader106.lr.ph:                              ; preds = %.preheader108
  %5 = add nuw nsw i64 %indvars.iv126, 1
  %6 = add nsw i64 %indvars.iv126, -1
  br label %.preheader106.us

.preheader106.us:                                 ; preds = %._crit_edge.us, %.preheader106.lr.ph
  %indvars.iv124 = phi i64 [ 1, %.preheader106.lr.ph ], [ %indvars.iv.next125, %._crit_edge.us ]
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %7 = add nsw i64 %indvars.iv124, -1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader106.us
  %indvars.iv = phi i64 [ 1, %.preheader106.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %5, i64 %indvars.iv124, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv126, i64 %indvars.iv124, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, 2.000000e+00
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %6, i64 %indvars.iv124, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv126, i64 %indvars.iv.next125, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = insertelement <2 x double> undef, double %9, i32 0
  %20 = insertelement <2 x double> %19, double %16, i32 1
  %21 = fsub <2 x double> %20, %18
  %22 = extractelement <2 x double> %21, i32 0
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv126, i64 %7, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = insertelement <2 x double> undef, double %22, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = insertelement <2 x double> undef, double %14, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> %21, <2 x i32> <i32 0, i32 3>
  %29 = fadd <2 x double> %28, %26
  %30 = fmul <2 x double> %29, <double 1.250000e-01, double 1.250000e-01>
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fadd double %31, %32
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv126, i64 %indvars.iv124, i64 %indvars.iv.next
  %35 = load double, double* %34, align 8
  %36 = fsub double %35, %12
  %37 = add nsw i64 %indvars.iv, -1
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv126, i64 %indvars.iv124, i64 %37
  %39 = load double, double* %38, align 8
  %40 = fadd double %36, %39
  %41 = fmul double %40, 1.250000e-01
  %42 = fadd double %33, %41
  %43 = fadd double %11, %42
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv126, i64 %indvars.iv124, i64 %indvars.iv
  store double %43, double* %44, align 8
  %exitcond = icmp eq i64 %indvars.iv, 118
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %exitcond136 = icmp ne i64 %indvars.iv.next125, 119
  br i1 %exitcond136, label %.preheader106.us, label %._crit_edge113.loopexit

._crit_edge113.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit, %.preheader108
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond137 = icmp ne i64 %indvars.iv.next127, 119
  br i1 %exitcond137, label %.preheader108, label %.preheader109

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge119
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %._crit_edge119 ], [ 1, %.preheader.lr.ph.preheader ]
  %45 = add nuw nsw i64 %indvars.iv134, 1
  %46 = add nsw i64 %indvars.iv134, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge117.us, %.preheader.lr.ph
  %indvars.iv132 = phi i64 [ 1, %.preheader.lr.ph ], [ %indvars.iv.next133, %._crit_edge117.us ]
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %47 = add nsw i64 %indvars.iv132, -1
  br label %._crit_edge123

._crit_edge123:                                   ; preds = %._crit_edge123, %.preheader.us
  %indvars.iv128 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next129, %._crit_edge123 ]
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %45, i64 %indvars.iv132, i64 %indvars.iv128
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv134, i64 %indvars.iv132, i64 %indvars.iv128
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, 2.000000e+00
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %46, i64 %indvars.iv132, i64 %indvars.iv128
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv134, i64 %indvars.iv.next133, i64 %indvars.iv128
  %56 = load double, double* %55, align 8
  %57 = insertelement <2 x double> undef, double %52, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  %59 = insertelement <2 x double> undef, double %49, i32 0
  %60 = insertelement <2 x double> %59, double %56, i32 1
  %61 = fsub <2 x double> %60, %58
  %62 = extractelement <2 x double> %61, i32 0
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv134, i64 %47, i64 %indvars.iv128
  %64 = load double, double* %63, align 8
  %65 = insertelement <2 x double> undef, double %62, i32 0
  %66 = insertelement <2 x double> %65, double %64, i32 1
  %67 = insertelement <2 x double> undef, double %54, i32 0
  %68 = shufflevector <2 x double> %67, <2 x double> %61, <2 x i32> <i32 0, i32 3>
  %69 = fadd <2 x double> %68, %66
  %70 = fmul <2 x double> %69, <double 1.250000e-01, double 1.250000e-01>
  %71 = extractelement <2 x double> %70, i32 0
  %72 = extractelement <2 x double> %70, i32 1
  %73 = fadd double %71, %72
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv134, i64 %indvars.iv132, i64 %indvars.iv.next129
  %75 = load double, double* %74, align 8
  %76 = fsub double %75, %52
  %77 = add nsw i64 %indvars.iv128, -1
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv134, i64 %indvars.iv132, i64 %77
  %79 = load double, double* %78, align 8
  %80 = fadd double %76, %79
  %81 = fmul double %80, 1.250000e-01
  %82 = fadd double %73, %81
  %83 = fadd double %51, %82
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv134, i64 %indvars.iv132, i64 %indvars.iv128
  store double %83, double* %84, align 8
  %exitcond131 = icmp eq i64 %indvars.iv128, 118
  br i1 %exitcond131, label %._crit_edge117.us, label %._crit_edge123

._crit_edge117.us:                                ; preds = %._crit_edge123
  %exitcond138 = icmp ne i64 %indvars.iv.next133, 119
  br i1 %exitcond138, label %.preheader.us, label %._crit_edge119

._crit_edge119:                                   ; preds = %._crit_edge117.us
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %exitcond139 = icmp ne i64 %indvars.iv.next135, 119
  br i1 %exitcond139, label %.preheader.lr.ph, label %._crit_edge121.loopexit

._crit_edge121.loopexit:                          ; preds = %._crit_edge119
  br label %._crit_edge121

._crit_edge121:                                   ; preds = %._crit_edge121.loopexit, %.preheader109, %.preheader110
  %85 = add nuw nsw i32 %storemerge122, 1
  %exitcond140 = icmp ne i32 %85, 501
  br i1 %exitcond140, label %.preheader110, label %86

; <label>:86:                                     ; preds = %._crit_edge121
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader15.lr.ph, label %._crit_edge20

.preheader15.lr.ph:                               ; preds = %2
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge18.us, %.preheader15.lr.ph
  %indvars.iv33 = phi i64 [ 0, %.preheader15.lr.ph ], [ %indvars.iv.next34, %._crit_edge18.us ]
  %7 = mul nuw nsw i64 %indvars.iv33, 120
  br label %.preheader.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp ne i64 %indvars.iv.next34, 120
  br i1 %exitcond36, label %.preheader.us.us.preheader, label %._crit_edge20.loopexit

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv31 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next32, %._crit_edge.us.us ]
  %8 = add nuw nsw i64 %indvars.iv31, %7
  %9 = mul nuw nsw i64 %8, 120
  br label %._crit_edge30

._crit_edge.us.us:                                ; preds = %._crit_edge
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond35 = icmp ne i64 %indvars.iv.next32, 120
  br i1 %exitcond35, label %.preheader.us.us, label %._crit_edge18.us

._crit_edge30:                                    ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nuw nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge30
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge30, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv33, i64 %indvars.iv31, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge30, label %._crit_edge.us.us

._crit_edge20.loopexit:                           ; preds = %._crit_edge18.us
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

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

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
  tail call fastcc void @init_array([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
  tail call fastcc void @print_array([120 x [120 x double]]* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader23

.preheader23:                                     ; preds = %2, %26
  %.02226 = phi i32 [ 0, %2 ], [ %27, %26 ]
  %3 = add nuw i32 %.02226, 120
  %4 = sext i32 %.02226 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader23, %23
  %.02125 = phi i32 [ 0, %.preheader23 ], [ %24, %23 ]
  %5 = add nuw i32 %3, %.02125
  %6 = sext i32 %.02125 to i64
  %7 = sext i32 %5 to i64
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %8 ]
  %9 = sub nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fmul double %11, 1.000000e+01
  %13 = fdiv double %12, 1.200000e+02
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %6, i64 %indvars.iv
  store double %13, double* %14, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %6, i64 %indvars.iv
  store double %13, double* %15, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %16 = sub nuw nsw i64 %7, %indvars.iv.next
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = fmul double %18, 1.000000e+01
  %20 = fdiv double %19, 1.200000e+02
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %6, i64 %indvars.iv.next
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %6, i64 %indvars.iv.next
  store double %20, double* %22, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %23, label %8

; <label>:23:                                     ; preds = %8
  %24 = add nsw i32 %.02125, 1
  %25 = icmp slt i32 %24, 120
  br i1 %25, label %.preheader, label %26

; <label>:26:                                     ; preds = %23
  %27 = add nsw i32 %.02226, 1
  %28 = icmp slt i32 %27, 120
  br i1 %28, label %.preheader23, label %29

; <label>:29:                                     ; preds = %26
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge131, %2
  %.0111132 = phi i32 [ 1, %2 ], [ %159, %._crit_edge131 ]
  br label %.preheader114

.preheader114:                                    ; preds = %.preheader116, %._crit_edge120
  %indvar21 = phi i64 [ 0, %.preheader116 ], [ %indvar.next22, %._crit_edge120 ]
  %.0109121 = phi i32 [ 1, %.preheader116 ], [ %79, %._crit_edge120 ]
  %3 = add i64 %indvar21, 1
  %4 = add i64 %indvar21, 2
  %5 = add nuw nsw i32 %.0109121, 1
  %6 = sext i32 %5 to i64
  %7 = sext i32 %.0109121 to i64
  %8 = add nsw i32 %.0109121, -1
  %9 = sext i32 %8 to i64
  br label %.preheader112.us

.preheader112.us:                                 ; preds = %._crit_edge.us, %.preheader114
  %indvar23 = phi i64 [ %indvar.next24, %._crit_edge.us ], [ 0, %.preheader114 ]
  %.0107118.us = phi i32 [ %77, %._crit_edge.us ], [ 1, %.preheader114 ]
  %10 = add i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %10, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %10, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar21, i64 %10, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %10, i64 119
  %11 = sext i32 %.0107118.us to i64
  %12 = add nuw nsw i32 %.0107118.us, 1
  %13 = sext i32 %12 to i64
  %14 = add nsw i32 %.0107118.us, -1
  %15 = sext i32 %14 to i64
  %bound033 = icmp ult double* %scevgep25, %scevgep31
  %bound134 = icmp ult double* %scevgep29, %scevgep27
  %memcheck.conflict36 = and i1 %bound033, %bound134
  br i1 %memcheck.conflict36, label %scalar.ph18.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %.preheader112.us
  br label %vector.body16

scalar.ph18.preheader:                            ; preds = %.preheader112.us
  br label %scalar.ph18

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index39 = phi i64 [ %index.next40, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx43 = or i64 %index39, 1
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %11, i64 %offset.idx43
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %11, i64 %offset.idx43
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %21 = fsub <2 x double> %wide.load47, %20
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %9, i64 %11, i64 %offset.idx43
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fadd <2 x double> %wide.load49, %21
  %25 = fmul <2 x double> %24, <double 1.250000e-01, double 1.250000e-01>
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %13, i64 %offset.idx43
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fsub <2 x double> %wide.load50, %20
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %15, i64 %offset.idx43
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %28, %wide.load51
  %32 = fmul <2 x double> %31, <double 1.250000e-01, double 1.250000e-01>
  %33 = fadd <2 x double> %25, %32
  %34 = add nuw nsw i64 %offset.idx43, 1
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %11, i64 %34
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !1
  %37 = fsub <2 x double> %wide.load52, %20
  %38 = add nsw i64 %offset.idx43, -1
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %11, i64 %38
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fadd <2 x double> %37, %wide.load53
  %42 = fmul <2 x double> %41, <double 1.250000e-01, double 1.250000e-01>
  %43 = fadd <2 x double> %33, %42
  %44 = fadd <2 x double> %wide.load48, %43
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %7, i64 %11, i64 %offset.idx43
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> %44, <2 x double>* %46, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add i64 %index39, 2
  %47 = icmp eq i64 %index.next40, 118
  br i1 %47, label %._crit_edge.us.loopexit55, label %vector.body16, !llvm.loop !6

scalar.ph18:                                      ; preds = %scalar.ph18.preheader, %scalar.ph18
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph18 ], [ 1, %scalar.ph18.preheader ]
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %11, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %11, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, 2.000000e+00
  %53 = fsub double %49, %52
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %9, i64 %11, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  %57 = fmul double %56, 1.250000e-01
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %13, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = fsub double %59, %52
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %15, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %64 = fmul double %63, 1.250000e-01
  %65 = fadd double %57, %64
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %11, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = fsub double %67, %52
  %69 = add nsw i64 %indvars.iv, -1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %11, i64 %69
  %71 = load double, double* %70, align 8
  %72 = fadd double %68, %71
  %73 = fmul double %72, 1.250000e-01
  %74 = fadd double %65, %73
  %75 = fadd double %51, %74
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %7, i64 %11, i64 %indvars.iv
  store double %75, double* %76, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph18, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph18
  br label %._crit_edge.us

._crit_edge.us.loopexit55:                        ; preds = %vector.body16
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit55, %._crit_edge.us.loopexit
  %77 = add nsw i32 %.0107118.us, 1
  %78 = icmp slt i32 %77, 119
  %indvar.next24 = add i64 %indvar23, 1
  br i1 %78, label %.preheader112.us, label %._crit_edge120

._crit_edge120:                                   ; preds = %._crit_edge.us
  %79 = add nsw i32 %.0109121, 1
  %80 = icmp slt i32 %79, 119
  %indvar.next22 = add i64 %indvar21, 1
  br i1 %80, label %.preheader114, label %.preheader113.preheader

.preheader113.preheader:                          ; preds = %._crit_edge120
  br label %.preheader113

.preheader113:                                    ; preds = %.preheader113.preheader, %._crit_edge128
  %indvar = phi i64 [ %indvar.next, %._crit_edge128 ], [ 0, %.preheader113.preheader ]
  %.1110129 = phi i32 [ %157, %._crit_edge128 ], [ 1, %.preheader113.preheader ]
  %81 = add i64 %indvar, 1
  %82 = add i64 %indvar, 2
  %83 = add nuw nsw i32 %.1110129, 1
  %84 = sext i32 %83 to i64
  %85 = sext i32 %.1110129 to i64
  %86 = add nsw i32 %.1110129, -1
  %87 = sext i32 %86 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge125.us, %.preheader113
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge125.us ], [ 0, %.preheader113 ]
  %.1108126.us = phi i32 [ %155, %._crit_edge125.us ], [ 1, %.preheader113 ]
  %88 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %81, i64 %88, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %81, i64 %88, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %88, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %82, i64 %88, i64 119
  %89 = sext i32 %.1108126.us to i64
  %90 = add nuw nsw i32 %.1108126.us, 1
  %91 = sext i32 %90 to i64
  %92 = add nsw i32 %.1108126.us, -1
  %93 = sext i32 %92 to i64
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %89, i64 %offset.idx
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !10
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %89, i64 %offset.idx
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %99 = fsub <2 x double> %wide.load, %98
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %89, i64 %offset.idx
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fadd <2 x double> %wide.load11, %99
  %103 = fmul <2 x double> %102, <double 1.250000e-01, double 1.250000e-01>
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %91, i64 %offset.idx
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !10
  %106 = fsub <2 x double> %wide.load12, %98
  %107 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %93, i64 %offset.idx
  %108 = bitcast double* %107 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %108, align 8, !alias.scope !10
  %109 = fadd <2 x double> %106, %wide.load13
  %110 = fmul <2 x double> %109, <double 1.250000e-01, double 1.250000e-01>
  %111 = fadd <2 x double> %103, %110
  %112 = add nuw nsw i64 %offset.idx, 1
  %113 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %89, i64 %112
  %114 = bitcast double* %113 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %114, align 8, !alias.scope !10
  %115 = fsub <2 x double> %wide.load14, %98
  %116 = add nsw i64 %offset.idx, -1
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %89, i64 %116
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !10
  %119 = fadd <2 x double> %115, %wide.load15
  %120 = fmul <2 x double> %119, <double 1.250000e-01, double 1.250000e-01>
  %121 = fadd <2 x double> %111, %120
  %122 = fadd <2 x double> %wide.load10, %121
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %85, i64 %89, i64 %offset.idx
  %124 = bitcast double* %123 to <2 x double>*
  store <2 x double> %122, <2 x double>* %124, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %125 = icmp eq i64 %index.next, 118
  br i1 %125, label %._crit_edge125.us.loopexit54, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %126 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %89, i64 %indvars.iv133
  %127 = load double, double* %126, align 8
  %128 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %89, i64 %indvars.iv133
  %129 = load double, double* %128, align 8
  %130 = fmul double %129, 2.000000e+00
  %131 = fsub double %127, %130
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %89, i64 %indvars.iv133
  %133 = load double, double* %132, align 8
  %134 = fadd double %133, %131
  %135 = fmul double %134, 1.250000e-01
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %91, i64 %indvars.iv133
  %137 = load double, double* %136, align 8
  %138 = fsub double %137, %130
  %139 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %93, i64 %indvars.iv133
  %140 = load double, double* %139, align 8
  %141 = fadd double %138, %140
  %142 = fmul double %141, 1.250000e-01
  %143 = fadd double %135, %142
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %144 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %89, i64 %indvars.iv.next134
  %145 = load double, double* %144, align 8
  %146 = fsub double %145, %130
  %147 = add nsw i64 %indvars.iv133, -1
  %148 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %89, i64 %147
  %149 = load double, double* %148, align 8
  %150 = fadd double %146, %149
  %151 = fmul double %150, 1.250000e-01
  %152 = fadd double %143, %151
  %153 = fadd double %129, %152
  %154 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %85, i64 %89, i64 %indvars.iv133
  store double %153, double* %154, align 8
  %exitcond135 = icmp eq i64 %indvars.iv.next134, 119
  br i1 %exitcond135, label %._crit_edge125.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge125.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge125.us

._crit_edge125.us.loopexit54:                     ; preds = %vector.body
  br label %._crit_edge125.us

._crit_edge125.us:                                ; preds = %._crit_edge125.us.loopexit54, %._crit_edge125.us.loopexit
  %155 = add nsw i32 %.1108126.us, 1
  %156 = icmp slt i32 %155, 119
  %indvar.next2 = add i64 %indvar1, 1
  br i1 %156, label %.preheader.us, label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge125.us
  %157 = add nsw i32 %.1110129, 1
  %158 = icmp slt i32 %157, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %158, label %.preheader113, label %._crit_edge131

._crit_edge131:                                   ; preds = %._crit_edge128
  %159 = add nuw nsw i32 %.0111132, 1
  %exitcond136 = icmp eq i32 %159, 501
  br i1 %exitcond136, label %160, label %.preheader116

; <label>:160:                                    ; preds = %._crit_edge131
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader20

.preheader20:                                     ; preds = %1, %27
  %.01923 = phi i32 [ 0, %1 ], [ %28, %27 ]
  %6 = mul nuw nsw i32 %.01923, 120
  %7 = sext i32 %.01923 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader20, %24
  %.01822 = phi i32 [ 0, %.preheader20 ], [ %25, %24 ]
  %8 = add nuw i32 %.01822, %6
  %9 = mul nuw nsw i32 %8, 120
  %10 = sext i32 %.01822 to i64
  %11 = zext i32 %9 to i64
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %19 ]
  %13 = add i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %10, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %24, label %12

; <label>:24:                                     ; preds = %19
  %25 = add nsw i32 %.01822, 1
  %26 = icmp slt i32 %25, 120
  br i1 %26, label %.preheader, label %27

; <label>:27:                                     ; preds = %24
  %28 = add nsw i32 %.01923, 1
  %29 = icmp slt i32 %28, 120
  br i1 %29, label %.preheader20, label %30

; <label>:30:                                     ; preds = %27
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %33) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}

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
  tail call fastcc void @print_array([120 x [120 x double]]* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader1

.preheader1:                                      ; preds = %2, %28
  %3 = phi i32 [ 0, %2 ], [ %29, %28 ]
  %4 = add nuw i32 %3, 120
  %5 = sext i32 %3 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader1, %25
  %6 = phi i32 [ 0, %.preheader1 ], [ %26, %25 ]
  %7 = add nuw i32 %4, %6
  %8 = sext i32 %6 to i64
  %9 = sext i32 %7 to i64
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %10 ]
  %11 = sub nuw nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fmul double %13, 1.000000e+01
  %15 = fdiv double %14, 1.200000e+02
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %8, i64 %indvars.iv
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv
  store double %15, double* %17, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %18 = sub nuw nsw i64 %9, %indvars.iv.next
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = fmul double %20, 1.000000e+01
  %22 = fdiv double %21, 1.200000e+02
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %8, i64 %indvars.iv.next
  store double %22, double* %23, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv.next
  store double %22, double* %24, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %25, label %10

; <label>:25:                                     ; preds = %10
  %26 = add nsw i32 %6, 1
  %27 = icmp slt i32 %26, 120
  br i1 %27, label %.preheader, label %28

; <label>:28:                                     ; preds = %25
  %29 = add nsw i32 %3, 1
  %30 = icmp slt i32 %29, 120
  br i1 %30, label %.preheader1, label %31

; <label>:31:                                     ; preds = %28
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader6

.preheader6:                                      ; preds = %161, %2
  %.07 = phi i32 [ 1, %2 ], [ %162, %161 ]
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader6, %80
  %indvar21 = phi i64 [ 0, %.preheader6 ], [ %indvar.next22, %80 ]
  %3 = phi i32 [ 1, %.preheader6 ], [ %6, %80 ]
  %4 = add i64 %indvar21, 1
  %5 = add i64 %indvar21, 2
  %6 = add nsw i32 %3, 1
  %7 = sext i32 %6 to i64
  %8 = sext i32 %3 to i64
  %9 = add nsw i32 %3, -1
  %10 = sext i32 %9 to i64
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader4, %middle.block17
  %indvar23 = phi i64 [ 0, %.preheader4 ], [ %indvar.next24, %middle.block17 ]
  %11 = phi i32 [ 1, %.preheader4 ], [ %14, %middle.block17 ]
  %12 = add i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %12, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %12, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar21, i64 %12, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %12, i64 119
  %13 = sext i32 %11 to i64
  %14 = add nsw i32 %11, 1
  %15 = sext i32 %14 to i64
  %16 = add nsw i32 %11, -1
  %17 = sext i32 %16 to i64
  %bound033 = icmp ult double* %scevgep25, %scevgep31
  %bound134 = icmp ult double* %scevgep29, %scevgep27
  %memcheck.conflict36 = and i1 %bound033, %bound134
  br i1 %memcheck.conflict36, label %scalar.ph18.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %.preheader2
  br label %vector.body16

scalar.ph18.preheader:                            ; preds = %.preheader2
  br label %scalar.ph18

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index39 = phi i64 [ %index.next40, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx43 = or i64 %index39, 1
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %13, i64 %offset.idx43
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %offset.idx43
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %23 = fsub <2 x double> %wide.load47, %22
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %10, i64 %13, i64 %offset.idx43
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fadd <2 x double> %wide.load49, %23
  %27 = fmul <2 x double> %26, <double 1.250000e-01, double 1.250000e-01>
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %15, i64 %offset.idx43
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fsub <2 x double> %wide.load50, %22
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %17, i64 %offset.idx43
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = fadd <2 x double> %30, %wide.load51
  %34 = fmul <2 x double> %33, <double 1.250000e-01, double 1.250000e-01>
  %35 = fadd <2 x double> %27, %34
  %36 = add nuw nsw i64 %offset.idx43, 1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = fsub <2 x double> %wide.load52, %22
  %40 = add nsw i64 %offset.idx43, -1
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %40
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !1
  %43 = fadd <2 x double> %39, %wide.load53
  %44 = fmul <2 x double> %43, <double 1.250000e-01, double 1.250000e-01>
  %45 = fadd <2 x double> %35, %44
  %46 = fadd <2 x double> %wide.load48, %45
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %8, i64 %13, i64 %offset.idx43
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %46, <2 x double>* %48, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add i64 %index39, 2
  %49 = icmp eq i64 %index.next40, 118
  br i1 %49, label %middle.block17.loopexit56, label %vector.body16, !llvm.loop !6

scalar.ph18:                                      ; preds = %scalar.ph18.preheader, %scalar.ph18
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph18 ], [ 1, %scalar.ph18.preheader ]
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %13, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, 2.000000e+00
  %55 = fsub double %51, %54
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %10, i64 %13, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fadd double %57, %55
  %59 = fmul double %58, 1.250000e-01
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %15, i64 %indvars.iv
  %61 = load double, double* %60, align 8
  %62 = fsub double %61, %54
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %17, i64 %indvars.iv
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  %66 = fmul double %65, 1.250000e-01
  %67 = fadd double %59, %66
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %indvars.iv.next
  %69 = load double, double* %68, align 8
  %70 = fsub double %69, %54
  %71 = add nsw i64 %indvars.iv, -1
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %71
  %73 = load double, double* %72, align 8
  %74 = fadd double %70, %73
  %75 = fmul double %74, 1.250000e-01
  %76 = fadd double %67, %75
  %77 = fadd double %53, %76
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %8, i64 %13, i64 %indvars.iv
  store double %77, double* %78, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %middle.block17.loopexit, label %scalar.ph18, !llvm.loop !9

middle.block17.loopexit:                          ; preds = %scalar.ph18
  br label %middle.block17

middle.block17.loopexit56:                        ; preds = %vector.body16
  br label %middle.block17

middle.block17:                                   ; preds = %middle.block17.loopexit56, %middle.block17.loopexit
  %79 = icmp slt i32 %14, 119
  %indvar.next24 = add i64 %indvar23, 1
  br i1 %79, label %.preheader2, label %80

; <label>:80:                                     ; preds = %middle.block17
  %81 = icmp slt i32 %6, 119
  %indvar.next22 = add i64 %indvar21, 1
  br i1 %81, label %.preheader4, label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %80
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.preheader, %159
  %indvar = phi i64 [ %indvar.next, %159 ], [ 0, %.preheader3.preheader ]
  %82 = phi i32 [ %85, %159 ], [ 1, %.preheader3.preheader ]
  %83 = add i64 %indvar, 1
  %84 = add i64 %indvar, 2
  %85 = add nsw i32 %82, 1
  %86 = sext i32 %85 to i64
  %87 = sext i32 %82 to i64
  %88 = add nsw i32 %82, -1
  %89 = sext i32 %88 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader3, %middle.block
  %indvar1 = phi i64 [ 0, %.preheader3 ], [ %indvar.next2, %middle.block ]
  %90 = phi i32 [ 1, %.preheader3 ], [ %93, %middle.block ]
  %91 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %83, i64 %91, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %83, i64 %91, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %91, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %91, i64 119
  %92 = sext i32 %90 to i64
  %93 = add nsw i32 %90, 1
  %94 = sext i32 %93 to i64
  %95 = add nsw i32 %90, -1
  %96 = sext i32 %95 to i64
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %86, i64 %92, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !10
  %99 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %92, i64 %offset.idx
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %102 = fsub <2 x double> %wide.load, %101
  %103 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %89, i64 %92, i64 %offset.idx
  %104 = bitcast double* %103 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %104, align 8, !alias.scope !10
  %105 = fadd <2 x double> %wide.load11, %102
  %106 = fmul <2 x double> %105, <double 1.250000e-01, double 1.250000e-01>
  %107 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %94, i64 %offset.idx
  %108 = bitcast double* %107 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %108, align 8, !alias.scope !10
  %109 = fsub <2 x double> %wide.load12, %101
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %96, i64 %offset.idx
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !10
  %112 = fadd <2 x double> %109, %wide.load13
  %113 = fmul <2 x double> %112, <double 1.250000e-01, double 1.250000e-01>
  %114 = fadd <2 x double> %106, %113
  %115 = add nuw nsw i64 %offset.idx, 1
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %92, i64 %115
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !10
  %118 = fsub <2 x double> %wide.load14, %101
  %119 = add nsw i64 %offset.idx, -1
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %92, i64 %119
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !10
  %122 = fadd <2 x double> %118, %wide.load15
  %123 = fmul <2 x double> %122, <double 1.250000e-01, double 1.250000e-01>
  %124 = fadd <2 x double> %114, %123
  %125 = fadd <2 x double> %wide.load10, %124
  %126 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %87, i64 %92, i64 %offset.idx
  %127 = bitcast double* %126 to <2 x double>*
  store <2 x double> %125, <2 x double>* %127, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %128 = icmp eq i64 %index.next, 118
  br i1 %128, label %middle.block.loopexit55, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %86, i64 %92, i64 %indvars.iv8
  %130 = load double, double* %129, align 8
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %92, i64 %indvars.iv8
  %132 = load double, double* %131, align 8
  %133 = fmul double %132, 2.000000e+00
  %134 = fsub double %130, %133
  %135 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %89, i64 %92, i64 %indvars.iv8
  %136 = load double, double* %135, align 8
  %137 = fadd double %136, %134
  %138 = fmul double %137, 1.250000e-01
  %139 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %94, i64 %indvars.iv8
  %140 = load double, double* %139, align 8
  %141 = fsub double %140, %133
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %96, i64 %indvars.iv8
  %143 = load double, double* %142, align 8
  %144 = fadd double %141, %143
  %145 = fmul double %144, 1.250000e-01
  %146 = fadd double %138, %145
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %147 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %92, i64 %indvars.iv.next9
  %148 = load double, double* %147, align 8
  %149 = fsub double %148, %133
  %150 = add nsw i64 %indvars.iv8, -1
  %151 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %92, i64 %150
  %152 = load double, double* %151, align 8
  %153 = fadd double %149, %152
  %154 = fmul double %153, 1.250000e-01
  %155 = fadd double %146, %154
  %156 = fadd double %132, %155
  %157 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %87, i64 %92, i64 %indvars.iv8
  store double %156, double* %157, align 8
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 119
  br i1 %exitcond10, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !16

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit55:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit55, %middle.block.loopexit
  %158 = icmp slt i32 %93, 119
  %indvar.next2 = add i64 %indvar1, 1
  br i1 %158, label %.preheader, label %159

; <label>:159:                                    ; preds = %middle.block
  %160 = icmp slt i32 %85, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %160, label %.preheader3, label %161

; <label>:161:                                    ; preds = %159
  %162 = add nuw nsw i32 %.07, 1
  %exitcond11 = icmp eq i32 %162, 501
  br i1 %exitcond11, label %163, label %.preheader6

; <label>:163:                                    ; preds = %161
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader1

.preheader1:                                      ; preds = %1, %28
  %6 = phi i32 [ 0, %1 ], [ %29, %28 ]
  %7 = mul nuw i32 %6, 14400
  %8 = sext i32 %6 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader1, %25
  %9 = phi i32 [ 0, %.preheader1 ], [ %26, %25 ]
  %10 = mul nuw nsw i32 %9, 120
  %11 = add nuw nsw i32 %10, %7
  %12 = sext i32 %9 to i64
  %13 = zext i32 %11 to i64
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %15 = add i64 %13, %indvars.iv
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %12, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %25, label %14

; <label>:25:                                     ; preds = %._crit_edge
  %26 = add nsw i32 %9, 1
  %27 = icmp slt i32 %26, 120
  br i1 %27, label %.preheader, label %28

; <label>:28:                                     ; preds = %25
  %29 = add nsw i32 %6, 1
  %30 = icmp slt i32 %29, 120
  br i1 %30, label %.preheader1, label %31

; <label>:31:                                     ; preds = %28
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %34) #5
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

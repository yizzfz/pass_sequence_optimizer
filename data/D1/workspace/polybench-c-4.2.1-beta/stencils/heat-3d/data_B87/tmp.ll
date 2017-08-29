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
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
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
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %26
  %.02226 = phi i32 [ 0, %2 ], [ %27, %26 ]
  %3 = add nuw i32 %.02226, 120
  %4 = sext i32 %.02226 to i64
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge, %23
  %.02125 = phi i32 [ 0, %._crit_edge ], [ %24, %23 ]
  %5 = add nuw i32 %3, %.02125
  %6 = sext i32 %.02125 to i64
  %7 = sext i32 %5 to i64
  br label %8

; <label>:8:                                      ; preds = %8, %._crit_edge23
  %indvars.iv = phi i64 [ 0, %._crit_edge23 ], [ %indvars.iv.next.1, %8 ]
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
  br i1 %25, label %._crit_edge23, label %26

; <label>:26:                                     ; preds = %23
  %27 = add nsw i32 %.02226, 1
  %28 = icmp slt i32 %27, 120
  br i1 %28, label %._crit_edge, label %29

; <label>:29:                                     ; preds = %26
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge132, %2
  %.0111133 = phi i32 [ 1, %2 ], [ %163, %._crit_edge132 ]
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge, %._crit_edge121
  %indvar42 = phi i64 [ 0, %._crit_edge ], [ %indvar.next43, %._crit_edge121 ]
  %indvar30 = phi i32 [ 0, %._crit_edge ], [ %indvar.next31, %._crit_edge121 ]
  %.0109122 = phi i32 [ 1, %._crit_edge ], [ %81, %._crit_edge121 ]
  %3 = add i32 %indvar30, 1
  %4 = sext i32 %3 to i64
  %5 = add i64 %indvar42, 2
  %6 = add nuw nsw i32 %.0109122, 1
  %7 = sext i32 %6 to i64
  %8 = sext i32 %.0109122 to i64
  %9 = add nsw i32 %.0109122, -1
  %10 = sext i32 %9 to i64
  br label %._crit_edge114.us

._crit_edge114.us:                                ; preds = %._crit_edge118.us, %._crit_edge112
  %indvar32 = phi i64 [ %indvar.next33, %._crit_edge118.us ], [ 0, %._crit_edge112 ]
  %.0107119.us = phi i32 [ %79, %._crit_edge118.us ], [ 1, %._crit_edge112 ]
  %11 = add i64 %indvar32, 1
  %scevgep34 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %11, i64 1
  %scevgep36 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %11, i64 119
  %scevgep38 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %indvar32, i64 1
  %12 = add i64 %indvar32, 2
  %scevgep40 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %12, i64 119
  %scevgep44 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar42, i64 %11, i64 1
  %scevgep46 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %11, i64 119
  %13 = sext i32 %.0107119.us to i64
  %14 = add nuw nsw i32 %.0107119.us, 1
  %15 = sext i32 %14 to i64
  %16 = add nsw i32 %.0107119.us, -1
  %17 = sext i32 %16 to i64
  %bound048 = icmp ult double* %scevgep34, %scevgep40
  %bound149 = icmp ult double* %scevgep38, %scevgep36
  %found.conflict50 = and i1 %bound048, %bound149
  %bound051 = icmp ult double* %scevgep34, %scevgep46
  %bound152 = icmp ult double* %scevgep44, %scevgep36
  %found.conflict53 = and i1 %bound051, %bound152
  %conflict.rdx54 = or i1 %found.conflict50, %found.conflict53
  br i1 %conflict.rdx54, label %scalar.ph27.preheader, label %vector.body25.preheader

vector.body25.preheader:                          ; preds = %._crit_edge114.us
  br label %vector.body25

scalar.ph27.preheader:                            ; preds = %._crit_edge114.us
  br label %scalar.ph27

vector.body25:                                    ; preds = %vector.body25.preheader, %vector.body25
  %index58 = phi i64 [ %index.next59, %vector.body25 ], [ 0, %vector.body25.preheader ]
  %offset.idx62 = or i64 %index58, 1
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %13, i64 %offset.idx62
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %offset.idx62
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !4
  %22 = fmul <2 x double> %wide.load67, <double 2.000000e+00, double 2.000000e+00>
  %23 = fsub <2 x double> %wide.load66, %22
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %10, i64 %13, i64 %offset.idx62
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fadd <2 x double> %wide.load68, %23
  %27 = fmul <2 x double> %26, <double 1.250000e-01, double 1.250000e-01>
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %15, i64 %offset.idx62
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !4
  %30 = fsub <2 x double> %wide.load69, %22
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %17, i64 %offset.idx62
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !4
  %33 = fadd <2 x double> %30, %wide.load70
  %34 = fmul <2 x double> %33, <double 1.250000e-01, double 1.250000e-01>
  %35 = fadd <2 x double> %27, %34
  %36 = add nuw nsw i64 %offset.idx62, 1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !4
  %39 = fsub <2 x double> %wide.load71, %22
  %40 = add nsw i64 %offset.idx62, -1
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %40
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !4
  %43 = fadd <2 x double> %39, %wide.load72
  %44 = fmul <2 x double> %43, <double 1.250000e-01, double 1.250000e-01>
  %45 = fadd <2 x double> %35, %44
  %46 = fadd <2 x double> %wide.load67, %45
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %8, i64 %13, i64 %offset.idx62
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> %46, <2 x double>* %48, align 8, !alias.scope !6, !noalias !8
  %index.next59 = add i64 %index58, 2
  %49 = icmp eq i64 %index.next59, 118
  br i1 %49, label %._crit_edge118.us.loopexit74, label %vector.body25, !llvm.loop !9

scalar.ph27:                                      ; preds = %scalar.ph27.preheader, %scalar.ph27
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph27 ], [ 1, %scalar.ph27.preheader ]
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
  br i1 %exitcond, label %._crit_edge118.us.loopexit, label %scalar.ph27, !llvm.loop !12

._crit_edge118.us.loopexit:                       ; preds = %scalar.ph27
  br label %._crit_edge118.us

._crit_edge118.us.loopexit74:                     ; preds = %vector.body25
  br label %._crit_edge118.us

._crit_edge118.us:                                ; preds = %._crit_edge118.us.loopexit74, %._crit_edge118.us.loopexit
  %79 = add nsw i32 %.0107119.us, 1
  %80 = icmp slt i32 %79, 119
  %indvar.next33 = add i64 %indvar32, 1
  br i1 %80, label %._crit_edge114.us, label %._crit_edge121

._crit_edge121:                                   ; preds = %._crit_edge118.us
  %81 = add nsw i32 %.0109122, 1
  %82 = icmp slt i32 %81, 119
  %indvar.next31 = add i32 %indvar30, 1
  %indvar.next43 = add i64 %indvar42, 1
  br i1 %82, label %._crit_edge112, label %._crit_edge115.preheader

._crit_edge115.preheader:                         ; preds = %._crit_edge121
  br label %._crit_edge115

._crit_edge115:                                   ; preds = %._crit_edge115.preheader, %._crit_edge129
  %indvar10 = phi i64 [ %indvar.next11, %._crit_edge129 ], [ 0, %._crit_edge115.preheader ]
  %indvar = phi i32 [ %indvar.next, %._crit_edge129 ], [ 0, %._crit_edge115.preheader ]
  %.1110130 = phi i32 [ %161, %._crit_edge129 ], [ 1, %._crit_edge115.preheader ]
  %83 = add i32 %indvar, 1
  %84 = sext i32 %83 to i64
  %85 = add i64 %indvar10, 2
  %86 = add nuw nsw i32 %.1110130, 1
  %87 = sext i32 %86 to i64
  %88 = sext i32 %.1110130 to i64
  %89 = add nsw i32 %.1110130, -1
  %90 = sext i32 %89 to i64
  br label %._crit_edge116.us

._crit_edge116.us:                                ; preds = %._crit_edge126.us, %._crit_edge115
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge126.us ], [ 0, %._crit_edge115 ]
  %.1108127.us = phi i32 [ %159, %._crit_edge126.us ], [ 1, %._crit_edge115 ]
  %91 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %84, i64 %91, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %84, i64 %91, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %indvar1, i64 1
  %92 = add i64 %indvar1, 2
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %92, i64 119
  %scevgep12 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar10, i64 %91, i64 1
  %scevgep14 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %91, i64 119
  %93 = sext i32 %.1108127.us to i64
  %94 = add nuw nsw i32 %.1108127.us, 1
  %95 = sext i32 %94 to i64
  %96 = add nsw i32 %.1108127.us, -1
  %97 = sext i32 %96 to i64
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  %bound016 = icmp ult double* %scevgep, %scevgep14
  %bound117 = icmp ult double* %scevgep12, %scevgep4
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx = or i1 %found.conflict, %found.conflict18
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge116.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %._crit_edge116.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %93, i64 %offset.idx
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !13
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %88, i64 %93, i64 %offset.idx
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !16
  %102 = fmul <2 x double> %wide.load19, <double 2.000000e+00, double 2.000000e+00>
  %103 = fsub <2 x double> %wide.load, %102
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %90, i64 %93, i64 %offset.idx
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !13
  %106 = fadd <2 x double> %wide.load20, %103
  %107 = fmul <2 x double> %106, <double 1.250000e-01, double 1.250000e-01>
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %88, i64 %95, i64 %offset.idx
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !16
  %110 = fsub <2 x double> %wide.load21, %102
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %88, i64 %97, i64 %offset.idx
  %112 = bitcast double* %111 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %112, align 8, !alias.scope !16
  %113 = fadd <2 x double> %110, %wide.load22
  %114 = fmul <2 x double> %113, <double 1.250000e-01, double 1.250000e-01>
  %115 = fadd <2 x double> %107, %114
  %116 = add nuw nsw i64 %offset.idx, 1
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %88, i64 %93, i64 %116
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !16
  %119 = fsub <2 x double> %wide.load23, %102
  %120 = add nsw i64 %offset.idx, -1
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %88, i64 %93, i64 %120
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !16
  %123 = fadd <2 x double> %119, %wide.load24
  %124 = fmul <2 x double> %123, <double 1.250000e-01, double 1.250000e-01>
  %125 = fadd <2 x double> %115, %124
  %126 = fadd <2 x double> %wide.load19, %125
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %88, i64 %93, i64 %offset.idx
  %128 = bitcast double* %127 to <2 x double>*
  store <2 x double> %126, <2 x double>* %128, align 8, !alias.scope !18, !noalias !20
  %index.next = add i64 %index, 2
  %129 = icmp eq i64 %index.next, 118
  br i1 %129, label %._crit_edge126.us.loopexit73, label %vector.body, !llvm.loop !21

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %93, i64 %indvars.iv134
  %131 = load double, double* %130, align 8
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %88, i64 %93, i64 %indvars.iv134
  %133 = load double, double* %132, align 8
  %134 = fmul double %133, 2.000000e+00
  %135 = fsub double %131, %134
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %90, i64 %93, i64 %indvars.iv134
  %137 = load double, double* %136, align 8
  %138 = fadd double %137, %135
  %139 = fmul double %138, 1.250000e-01
  %140 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %88, i64 %95, i64 %indvars.iv134
  %141 = load double, double* %140, align 8
  %142 = fsub double %141, %134
  %143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %88, i64 %97, i64 %indvars.iv134
  %144 = load double, double* %143, align 8
  %145 = fadd double %142, %144
  %146 = fmul double %145, 1.250000e-01
  %147 = fadd double %139, %146
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %148 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %88, i64 %93, i64 %indvars.iv.next135
  %149 = load double, double* %148, align 8
  %150 = fsub double %149, %134
  %151 = add nsw i64 %indvars.iv134, -1
  %152 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %88, i64 %93, i64 %151
  %153 = load double, double* %152, align 8
  %154 = fadd double %150, %153
  %155 = fmul double %154, 1.250000e-01
  %156 = fadd double %147, %155
  %157 = fadd double %133, %156
  %158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %88, i64 %93, i64 %indvars.iv134
  store double %157, double* %158, align 8
  %exitcond136 = icmp eq i64 %indvars.iv.next135, 119
  br i1 %exitcond136, label %._crit_edge126.us.loopexit, label %scalar.ph, !llvm.loop !22

._crit_edge126.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge126.us

._crit_edge126.us.loopexit73:                     ; preds = %vector.body
  br label %._crit_edge126.us

._crit_edge126.us:                                ; preds = %._crit_edge126.us.loopexit73, %._crit_edge126.us.loopexit
  %159 = add nsw i32 %.1108127.us, 1
  %160 = icmp slt i32 %159, 119
  %indvar.next2 = add i64 %indvar1, 1
  br i1 %160, label %._crit_edge116.us, label %._crit_edge129

._crit_edge129:                                   ; preds = %._crit_edge126.us
  %161 = add nsw i32 %.1110130, 1
  %162 = icmp slt i32 %161, 119
  %indvar.next = add i32 %indvar, 1
  %indvar.next11 = add i64 %indvar10, 1
  br i1 %162, label %._crit_edge115, label %._crit_edge132

._crit_edge132:                                   ; preds = %._crit_edge129
  %163 = add nuw nsw i32 %.0111133, 1
  %exitcond137 = icmp eq i32 %163, 501
  br i1 %exitcond137, label %164, label %._crit_edge

; <label>:164:                                    ; preds = %._crit_edge132
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %1, %26
  %.01924 = phi i32 [ 0, %1 ], [ %27, %26 ]
  %6 = mul nuw nsw i32 %.01924, 120
  %7 = sext i32 %.01924 to i64
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge, %23
  %.01823 = phi i32 [ 0, %._crit_edge ], [ %24, %23 ]
  %8 = add nuw i32 %.01823, %6
  %9 = mul nuw nsw i32 %8, 120
  %10 = sext i32 %.01823 to i64
  %11 = zext i32 %9 to i64
  br label %12

; <label>:12:                                     ; preds = %._crit_edge21, %._crit_edge20
  %indvars.iv = phi i64 [ 0, %._crit_edge20 ], [ %indvars.iv.next, %._crit_edge21 ]
  %13 = add i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge21

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #4
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %12, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %10, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %23, label %12

; <label>:23:                                     ; preds = %._crit_edge21
  %24 = add nsw i32 %.01823, 1
  %25 = icmp slt i32 %24, 120
  br i1 %25, label %._crit_edge20, label %26

; <label>:26:                                     ; preds = %23
  %27 = add nsw i32 %.01924, 1
  %28 = icmp slt i32 %27, 120
  br i1 %28, label %._crit_edge, label %29

; <label>:29:                                     ; preds = %26
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #4
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = !{!19}
!19 = distinct !{!19, !15}
!20 = !{!17, !14}
!21 = distinct !{!21, !10, !11}
!22 = distinct !{!22, !10, !11}

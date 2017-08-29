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
  br label %.preheader23

.preheader23:                                     ; preds = %2, %21
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %21 ]
  %3 = add nuw nsw i64 %indvars.iv3, 120
  br label %.preheader

.preheader:                                       ; preds = %.preheader23, %20
  %indvars.iv1 = phi i64 [ 0, %.preheader23 ], [ %indvars.iv.next2, %20 ]
  %4 = add nuw nsw i64 %3, %indvars.iv1
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = sub nuw nsw i64 %4, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fmul double %8, 1.000000e+01
  %10 = fdiv double %9, 1.200000e+02
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
  store double %10, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = sub nuw nsw i64 %4, %indvars.iv.next
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fmul double %15, 1.000000e+01
  %17 = fdiv double %16, 1.200000e+02
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %17, double* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %20, label %5

; <label>:20:                                     ; preds = %5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp ne i64 %indvars.iv.next2, 120
  br i1 %exitcond, label %.preheader, label %21

; <label>:21:                                     ; preds = %20
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp ne i64 %indvars.iv.next4, 120
  br i1 %exitcond5, label %.preheader23, label %22

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge131, %2
  %.0111132 = phi i32 [ 1, %2 ], [ %135, %._crit_edge131 ]
  br label %.preheader114

.preheader114:                                    ; preds = %.preheader116, %._crit_edge120
  %indvars.iv80 = phi i64 [ 1, %.preheader116 ], [ %indvars.iv.next81, %._crit_edge120 ]
  %indvars.iv78 = phi i64 [ 0, %.preheader116 ], [ %indvars.iv.next79, %._crit_edge120 ]
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %3 = add nuw nsw i64 %indvars.iv78, 2
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %4 = add nsw i64 %indvars.iv80, -1
  br label %.preheader112

.preheader112:                                    ; preds = %.preheader114, %._crit_edge
  %indvars.iv75 = phi i64 [ 1, %.preheader114 ], [ %indvars.iv.next76, %._crit_edge ]
  %indvar32 = phi i64 [ 0, %.preheader114 ], [ %5, %._crit_edge ]
  %5 = add nuw nsw i64 %indvar32, 1
  %scevgep34 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next79, i64 %5, i64 1
  %scevgep36 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next79, i64 %5, i64 119
  %scevgep38 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next79, i64 %indvar32, i64 1
  %6 = add nuw nsw i64 %indvar32, 2
  %scevgep40 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next79, i64 %6, i64 119
  %scevgep44 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv78, i64 %5, i64 1
  %scevgep46 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %3, i64 %5, i64 119
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %7 = add nsw i64 %indvars.iv75, -1
  %bound048 = icmp ult double* %scevgep34, %scevgep40
  %bound149 = icmp ult double* %scevgep38, %scevgep36
  %found.conflict50 = and i1 %bound048, %bound149
  %bound051 = icmp ult double* %scevgep34, %scevgep46
  %bound152 = icmp ult double* %scevgep44, %scevgep36
  %found.conflict53 = and i1 %bound051, %bound152
  %conflict.rdx54 = or i1 %found.conflict50, %found.conflict53
  br i1 %conflict.rdx54, label %scalar.ph27.preheader, label %vector.body25.preheader

vector.body25.preheader:                          ; preds = %.preheader112
  br label %vector.body25

scalar.ph27.preheader:                            ; preds = %.preheader112
  br label %scalar.ph27

vector.body25:                                    ; preds = %vector.body25.preheader, %vector.body25
  %index58 = phi i64 [ %index.next59, %vector.body25 ], [ 0, %vector.body25.preheader ]
  %offset.idx62 = or i64 %index58, 1
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next81, i64 %indvars.iv75, i64 %offset.idx62
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv80, i64 %indvars.iv75, i64 %offset.idx62
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !4
  %12 = fmul <2 x double> %wide.load67, <double 2.000000e+00, double 2.000000e+00>
  %13 = fsub <2 x double> %wide.load66, %12
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %indvars.iv75, i64 %offset.idx62
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fadd <2 x double> %wide.load68, %13
  %17 = fmul <2 x double> %16, <double 1.250000e-01, double 1.250000e-01>
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv80, i64 %indvars.iv.next76, i64 %offset.idx62
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !4
  %20 = fsub <2 x double> %wide.load69, %12
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv80, i64 %7, i64 %offset.idx62
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !4
  %23 = fadd <2 x double> %20, %wide.load70
  %24 = fmul <2 x double> %23, <double 1.250000e-01, double 1.250000e-01>
  %25 = fadd <2 x double> %17, %24
  %26 = add nuw nsw i64 %offset.idx62, 1
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv80, i64 %indvars.iv75, i64 %26
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !4
  %29 = fsub <2 x double> %wide.load71, %12
  %30 = add nsw i64 %offset.idx62, -1
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv80, i64 %indvars.iv75, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !4
  %33 = fadd <2 x double> %29, %wide.load72
  %34 = fmul <2 x double> %33, <double 1.250000e-01, double 1.250000e-01>
  %35 = fadd <2 x double> %25, %34
  %36 = fadd <2 x double> %wide.load67, %35
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv80, i64 %indvars.iv75, i64 %offset.idx62
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !6, !noalias !8
  %index.next59 = add nuw nsw i64 %index58, 2
  %39 = icmp eq i64 %index.next59, 118
  br i1 %39, label %._crit_edge.loopexit74, label %vector.body25, !llvm.loop !9

scalar.ph27:                                      ; preds = %scalar.ph27.preheader, %scalar.ph27
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph27 ], [ 1, %scalar.ph27.preheader ]
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next81, i64 %indvars.iv75, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv80, i64 %indvars.iv75, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, 2.000000e+00
  %45 = fsub double %41, %44
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %indvars.iv75, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  %49 = fmul double %48, 1.250000e-01
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv80, i64 %indvars.iv.next76, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = fsub double %51, %44
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv80, i64 %7, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  %56 = fmul double %55, 1.250000e-01
  %57 = fadd double %49, %56
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv80, i64 %indvars.iv75, i64 %indvars.iv.next
  %59 = load double, double* %58, align 8
  %60 = fsub double %59, %44
  %61 = add nsw i64 %indvars.iv, -1
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv80, i64 %indvars.iv75, i64 %61
  %63 = load double, double* %62, align 8
  %64 = fadd double %60, %63
  %65 = fmul double %64, 1.250000e-01
  %66 = fadd double %57, %65
  %67 = fadd double %43, %66
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv80, i64 %indvars.iv75, i64 %indvars.iv
  store double %67, double* %68, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph27, !llvm.loop !12

._crit_edge.loopexit:                             ; preds = %scalar.ph27
  br label %._crit_edge

._crit_edge.loopexit74:                           ; preds = %vector.body25
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit74, %._crit_edge.loopexit
  %exitcond77 = icmp ne i64 %5, 118
  br i1 %exitcond77, label %.preheader112, label %._crit_edge120

._crit_edge120:                                   ; preds = %._crit_edge
  %exitcond82 = icmp ne i64 %indvars.iv.next79, 118
  br i1 %exitcond82, label %.preheader114, label %.preheader113.preheader

.preheader113.preheader:                          ; preds = %._crit_edge120
  br label %.preheader113

.preheader113:                                    ; preds = %.preheader113.preheader, %._crit_edge128
  %indvars.iv88 = phi i64 [ 1, %.preheader113.preheader ], [ %indvars.iv.next89, %._crit_edge128 ]
  %indvars.iv86 = phi i64 [ 0, %.preheader113.preheader ], [ %indvars.iv.next87, %._crit_edge128 ]
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %69 = add nuw nsw i64 %indvars.iv86, 2
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %70 = add nsw i64 %indvars.iv88, -1
  br label %.preheader

.preheader:                                       ; preds = %.preheader113, %._crit_edge125
  %indvars.iv83 = phi i64 [ 1, %.preheader113 ], [ %indvars.iv.next84, %._crit_edge125 ]
  %indvar1 = phi i64 [ 0, %.preheader113 ], [ %71, %._crit_edge125 ]
  %71 = add nuw nsw i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next87, i64 %71, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next87, i64 %71, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next87, i64 %indvar1, i64 1
  %72 = add nuw nsw i64 %indvar1, 2
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next87, i64 %72, i64 119
  %scevgep12 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv86, i64 %71, i64 1
  %scevgep14 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %69, i64 %71, i64 119
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %73 = add nsw i64 %indvars.iv83, -1
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  %bound016 = icmp ult double* %scevgep, %scevgep14
  %bound117 = icmp ult double* %scevgep12, %scevgep4
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx = or i1 %found.conflict, %found.conflict18
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next89, i64 %indvars.iv83, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !13
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv88, i64 %indvars.iv83, i64 %offset.idx
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !16
  %78 = fmul <2 x double> %wide.load19, <double 2.000000e+00, double 2.000000e+00>
  %79 = fsub <2 x double> %wide.load, %78
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %70, i64 %indvars.iv83, i64 %offset.idx
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !13
  %82 = fadd <2 x double> %wide.load20, %79
  %83 = fmul <2 x double> %82, <double 1.250000e-01, double 1.250000e-01>
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv88, i64 %indvars.iv.next84, i64 %offset.idx
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !16
  %86 = fsub <2 x double> %wide.load21, %78
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv88, i64 %73, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !16
  %89 = fadd <2 x double> %86, %wide.load22
  %90 = fmul <2 x double> %89, <double 1.250000e-01, double 1.250000e-01>
  %91 = fadd <2 x double> %83, %90
  %92 = add nuw nsw i64 %offset.idx, 1
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv88, i64 %indvars.iv83, i64 %92
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !16
  %95 = fsub <2 x double> %wide.load23, %78
  %96 = add nsw i64 %offset.idx, -1
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv88, i64 %indvars.iv83, i64 %96
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !16
  %99 = fadd <2 x double> %95, %wide.load24
  %100 = fmul <2 x double> %99, <double 1.250000e-01, double 1.250000e-01>
  %101 = fadd <2 x double> %91, %100
  %102 = fadd <2 x double> %wide.load19, %101
  %103 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv88, i64 %indvars.iv83, i64 %offset.idx
  %104 = bitcast double* %103 to <2 x double>*
  store <2 x double> %102, <2 x double>* %104, align 8, !alias.scope !18, !noalias !20
  %index.next = add nuw nsw i64 %index, 2
  %105 = icmp eq i64 %index.next, 118
  br i1 %105, label %._crit_edge125.loopexit73, label %vector.body, !llvm.loop !21

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next89, i64 %indvars.iv83, i64 %indvars.iv133
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv88, i64 %indvars.iv83, i64 %indvars.iv133
  %109 = load double, double* %108, align 8
  %110 = fmul double %109, 2.000000e+00
  %111 = fsub double %107, %110
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %70, i64 %indvars.iv83, i64 %indvars.iv133
  %113 = load double, double* %112, align 8
  %114 = fadd double %113, %111
  %115 = fmul double %114, 1.250000e-01
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv88, i64 %indvars.iv.next84, i64 %indvars.iv133
  %117 = load double, double* %116, align 8
  %118 = fsub double %117, %110
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv88, i64 %73, i64 %indvars.iv133
  %120 = load double, double* %119, align 8
  %121 = fadd double %118, %120
  %122 = fmul double %121, 1.250000e-01
  %123 = fadd double %115, %122
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv88, i64 %indvars.iv83, i64 %indvars.iv.next134
  %125 = load double, double* %124, align 8
  %126 = fsub double %125, %110
  %127 = add nsw i64 %indvars.iv133, -1
  %128 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv88, i64 %indvars.iv83, i64 %127
  %129 = load double, double* %128, align 8
  %130 = fadd double %126, %129
  %131 = fmul double %130, 1.250000e-01
  %132 = fadd double %123, %131
  %133 = fadd double %109, %132
  %134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv88, i64 %indvars.iv83, i64 %indvars.iv133
  store double %133, double* %134, align 8
  %exitcond135 = icmp eq i64 %indvars.iv.next134, 119
  br i1 %exitcond135, label %._crit_edge125.loopexit, label %scalar.ph, !llvm.loop !22

._crit_edge125.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge125

._crit_edge125.loopexit73:                        ; preds = %vector.body
  br label %._crit_edge125

._crit_edge125:                                   ; preds = %._crit_edge125.loopexit73, %._crit_edge125.loopexit
  %exitcond85 = icmp ne i64 %71, 118
  br i1 %exitcond85, label %.preheader, label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge125
  %exitcond90 = icmp ne i64 %indvars.iv.next87, 118
  br i1 %exitcond90, label %.preheader113, label %._crit_edge131

._crit_edge131:                                   ; preds = %._crit_edge128
  %135 = add nuw nsw i32 %.0111132, 1
  %exitcond136 = icmp eq i32 %135, 501
  br i1 %exitcond136, label %136, label %.preheader116

; <label>:136:                                    ; preds = %._crit_edge131
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
  br label %.preheader20

.preheader20:                                     ; preds = %1, %22
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %22 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 120
  br label %.preheader

.preheader:                                       ; preds = %.preheader20, %21
  %indvars.iv1 = phi i64 [ 0, %.preheader20 ], [ %indvars.iv.next2, %21 ]
  %7 = add nuw nsw i64 %indvars.iv1, %6
  %8 = mul nuw nsw i64 %7, 120
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %16 ]
  %10 = add nuw nsw i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %21, label %9

; <label>:21:                                     ; preds = %16
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp ne i64 %indvars.iv.next2, 120
  br i1 %exitcond3, label %.preheader, label %22

; <label>:22:                                     ; preds = %21
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp ne i64 %indvars.iv.next5, 120
  br i1 %exitcond6, label %.preheader20, label %23

; <label>:23:                                     ; preds = %22
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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

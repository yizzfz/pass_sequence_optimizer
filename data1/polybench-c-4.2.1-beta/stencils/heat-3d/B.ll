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
  %3 = call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  call fastcc void @init_array([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_heat_3d([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  call fastcc void @print_array([120 x [120 x double]]* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %21, %2
  %indvars.iv54 = phi i64 [ 0, %2 ], [ %indvars.iv.next6, %21 ]
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv13 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next2, %._crit_edge ]
  %3 = add nuw nsw i64 %indvars.iv54, %indvars.iv13
  br label %4

; <label>:4:                                      ; preds = %4, %._crit_edge8
  %indvars.iv2 = phi i64 [ 0, %._crit_edge8 ], [ %indvars.iv.next.1, %4 ]
  %5 = sub nuw nsw i64 120, %indvars.iv2
  %6 = add nuw nsw i64 %3, %5
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fmul double %8, 1.000000e+01
  %10 = fdiv double %9, 1.200000e+02
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv54, i64 %indvars.iv13, i64 %indvars.iv2
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv54, i64 %indvars.iv13, i64 %indvars.iv2
  store double %10, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv2, 1
  %13 = sub i64 119, %indvars.iv2
  %14 = add nuw nsw i64 %3, %13
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fmul double %16, 1.000000e+01
  %18 = fdiv double %17, 1.200000e+02
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv54, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv54, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %18, double* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv2, 2
  %exitcond7.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond7.1, label %._crit_edge, label %4

._crit_edge:                                      ; preds = %4
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond, label %21, label %._crit_edge8

; <label>:21:                                     ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next6, 120
  br i1 %exitcond1, label %22, label %.._crit_edge_crit_edge

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %141, %2
  %storemerge10 = phi i32 [ 1, %2 ], [ %142, %141 ]
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvar31 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvar.next32, %._crit_edge ]
  %indvars.iv66 = phi i64 [ 1, %.._crit_edge_crit_edge ], [ %5, %._crit_edge ]
  %3 = add nuw nsw i64 %indvar31, 1
  %4 = add nuw i64 %indvar31, 2
  %5 = add nuw nsw i64 %indvars.iv66, 1
  %6 = add nsw i64 %indvars.iv66, -1
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %middle.block27, %._crit_edge21
  %indvar33 = phi i64 [ 0, %._crit_edge21 ], [ %indvar.next34, %middle.block27 ]
  %indvars.iv25 = phi i64 [ 1, %._crit_edge21 ], [ %8, %middle.block27 ]
  %7 = add nuw nsw i64 %indvar33, 1
  %scevgep35 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %7, i64 1
  %scevgep37 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %7, i64 119
  %scevgep39 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar31, i64 %7, i64 1
  %scevgep41 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %7, i64 119
  %8 = add nuw nsw i64 %indvars.iv25, 1
  %9 = add nsw i64 %indvars.iv25, -1
  %bound043 = icmp ult double* %scevgep35, %scevgep41
  %bound144 = icmp ult double* %scevgep39, %scevgep37
  %memcheck.conflict46 = and i1 %bound043, %bound144
  br i1 %memcheck.conflict46, label %._crit_edge23.scalar.ph28_crit_edge, label %._crit_edge23.vector.body26_crit_edge

._crit_edge23.vector.body26_crit_edge:            ; preds = %._crit_edge23
  br label %vector.body26

._crit_edge23.scalar.ph28_crit_edge:              ; preds = %._crit_edge23
  br label %scalar.ph28

vector.body26:                                    ; preds = %vector.body26, %._crit_edge23.vector.body26_crit_edge
  %index49 = phi i64 [ 0, %._crit_edge23.vector.body26_crit_edge ], [ %index.next50, %vector.body26 ]
  %offset.idx53 = or i64 %index49, 1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv25, i64 %offset.idx53
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %indvars.iv25, i64 %offset.idx53
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fmul <2 x double> %wide.load58, <double 2.000000e+00, double 2.000000e+00>
  %15 = fsub <2 x double> %wide.load57, %14
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %indvars.iv25, i64 %offset.idx53
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %15, %wide.load59
  %19 = fmul <2 x double> %18, <double 1.250000e-01, double 1.250000e-01>
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %8, i64 %offset.idx53
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fsub <2 x double> %wide.load60, %14
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %9, i64 %offset.idx53
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %22, %wide.load61
  %26 = fmul <2 x double> %25, <double 1.250000e-01, double 1.250000e-01>
  %27 = fadd <2 x double> %19, %26
  %28 = add nuw nsw i64 %offset.idx53, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %indvars.iv25, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fsub <2 x double> %wide.load62, %14
  %32 = add nsw i64 %offset.idx53, -1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %indvars.iv25, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load63 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %31, %wide.load63
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %27, %36
  %38 = fadd <2 x double> %37, %wide.load58
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv25, i64 %offset.idx53
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next50 = add nuw nsw i64 %index49, 2
  %41 = icmp eq i64 %index.next50, 118
  br i1 %41, label %middle.block27.loopexit66, label %vector.body26, !llvm.loop !6

scalar.ph28:                                      ; preds = %scalar.ph28, %._crit_edge23.scalar.ph28_crit_edge
  %indvars.iv4 = phi i64 [ 1, %._crit_edge23.scalar.ph28_crit_edge ], [ %60, %scalar.ph28 ]
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv25, i64 %indvars.iv4
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %indvars.iv25, i64 %indvars.iv4
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, 2.000000e+00
  %47 = fsub double %43, %46
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %indvars.iv25, i64 %indvars.iv4
  %49 = load double, double* %48, align 8
  %50 = fadd double %47, %49
  %51 = fmul double %50, 1.250000e-01
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %8, i64 %indvars.iv4
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %46
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %9, i64 %indvars.iv4
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  %58 = fmul double %57, 1.250000e-01
  %59 = fadd double %51, %58
  %60 = add nuw nsw i64 %indvars.iv4, 1
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %indvars.iv25, i64 %60
  %62 = load double, double* %61, align 8
  %63 = fsub double %62, %46
  %64 = add nsw i64 %indvars.iv4, -1
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %indvars.iv25, i64 %64
  %66 = load double, double* %65, align 8
  %67 = fadd double %63, %66
  %68 = fmul double %67, 1.250000e-01
  %69 = fadd double %59, %68
  %70 = fadd double %69, %45
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv25, i64 %indvars.iv4
  store double %70, double* %71, align 8
  %exitcond18 = icmp eq i64 %60, 119
  br i1 %exitcond18, label %middle.block27.loopexit, label %scalar.ph28, !llvm.loop !9

middle.block27.loopexit:                          ; preds = %scalar.ph28
  br label %middle.block27

middle.block27.loopexit66:                        ; preds = %vector.body26
  br label %middle.block27

middle.block27:                                   ; preds = %middle.block27.loopexit66, %middle.block27.loopexit
  %exitcond = icmp eq i64 %8, 119
  %indvar.next34 = add nuw nsw i64 %indvar33, 1
  br i1 %exitcond, label %._crit_edge, label %._crit_edge23

._crit_edge:                                      ; preds = %middle.block27
  %exitcond1 = icmp eq i64 %5, 119
  %indvar.next32 = add nuw nsw i64 %indvar31, 1
  br i1 %exitcond1, label %._crit_edge.._crit_edge24_crit_edge, label %._crit_edge21

._crit_edge.._crit_edge24_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge22, %._crit_edge.._crit_edge24_crit_edge
  %indvar = phi i64 [ 0, %._crit_edge.._crit_edge24_crit_edge ], [ %indvar.next, %._crit_edge22 ]
  %indvars.iv169 = phi i64 [ 1, %._crit_edge.._crit_edge24_crit_edge ], [ %74, %._crit_edge22 ]
  %72 = add nuw nsw i64 %indvar, 1
  %73 = add nuw i64 %indvar, 2
  %74 = add nuw nsw i64 %indvars.iv169, 1
  %75 = add nsw i64 %indvars.iv169, -1
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %middle.block, %._crit_edge24
  %indvar11 = phi i64 [ 0, %._crit_edge24 ], [ %indvar.next12, %middle.block ]
  %indvars.iv128 = phi i64 [ 1, %._crit_edge24 ], [ %77, %middle.block ]
  %76 = add nuw nsw i64 %indvar11, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %72, i64 %76, i64 1
  %scevgep14 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %72, i64 %76, i64 119
  %scevgep16 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %76, i64 1
  %scevgep18 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %73, i64 %76, i64 119
  %77 = add nuw nsw i64 %indvars.iv128, 1
  %78 = add nsw i64 %indvars.iv128, -1
  %bound0 = icmp ult double* %scevgep, %scevgep18
  %bound1 = icmp ult double* %scevgep16, %scevgep14
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge25.scalar.ph_crit_edge, label %._crit_edge25.vector.body_crit_edge

._crit_edge25.vector.body_crit_edge:              ; preds = %._crit_edge25
  br label %vector.body

._crit_edge25.scalar.ph_crit_edge:                ; preds = %._crit_edge25
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %._crit_edge25.vector.body_crit_edge
  %index = phi i64 [ 0, %._crit_edge25.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %offset.idx = or i64 %index, 1
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %74, i64 %indvars.iv128, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv169, i64 %indvars.iv128, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = fmul <2 x double> %wide.load20, <double 2.000000e+00, double 2.000000e+00>
  %84 = fsub <2 x double> %wide.load, %83
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %75, i64 %indvars.iv128, i64 %offset.idx
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = fadd <2 x double> %84, %wide.load21
  %88 = fmul <2 x double> %87, <double 1.250000e-01, double 1.250000e-01>
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv169, i64 %77, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fsub <2 x double> %wide.load22, %83
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv169, i64 %78, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = fadd <2 x double> %91, %wide.load23
  %95 = fmul <2 x double> %94, <double 1.250000e-01, double 1.250000e-01>
  %96 = fadd <2 x double> %88, %95
  %97 = add nuw nsw i64 %offset.idx, 1
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv169, i64 %indvars.iv128, i64 %97
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !10
  %100 = fsub <2 x double> %wide.load24, %83
  %101 = add nsw i64 %offset.idx, -1
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv169, i64 %indvars.iv128, i64 %101
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load25 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !10
  %104 = fadd <2 x double> %100, %wide.load25
  %105 = fmul <2 x double> %104, <double 1.250000e-01, double 1.250000e-01>
  %106 = fadd <2 x double> %96, %105
  %107 = fadd <2 x double> %106, %wide.load20
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv169, i64 %indvars.iv128, i64 %offset.idx
  %109 = bitcast double* %108 to <2 x double>*
  store <2 x double> %107, <2 x double>* %109, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %110 = icmp eq i64 %index.next, 118
  br i1 %110, label %middle.block.loopexit65, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph, %._crit_edge25.scalar.ph_crit_edge
  %indvars.iv87 = phi i64 [ 1, %._crit_edge25.scalar.ph_crit_edge ], [ %129, %scalar.ph ]
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %74, i64 %indvars.iv128, i64 %indvars.iv87
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv169, i64 %indvars.iv128, i64 %indvars.iv87
  %114 = load double, double* %113, align 8
  %115 = fmul double %114, 2.000000e+00
  %116 = fsub double %112, %115
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %75, i64 %indvars.iv128, i64 %indvars.iv87
  %118 = load double, double* %117, align 8
  %119 = fadd double %116, %118
  %120 = fmul double %119, 1.250000e-01
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv169, i64 %77, i64 %indvars.iv87
  %122 = load double, double* %121, align 8
  %123 = fsub double %122, %115
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv169, i64 %78, i64 %indvars.iv87
  %125 = load double, double* %124, align 8
  %126 = fadd double %123, %125
  %127 = fmul double %126, 1.250000e-01
  %128 = fadd double %120, %127
  %129 = add nuw nsw i64 %indvars.iv87, 1
  %130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv169, i64 %indvars.iv128, i64 %129
  %131 = load double, double* %130, align 8
  %132 = fsub double %131, %115
  %133 = add nsw i64 %indvars.iv87, -1
  %134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv169, i64 %indvars.iv128, i64 %133
  %135 = load double, double* %134, align 8
  %136 = fadd double %132, %135
  %137 = fmul double %136, 1.250000e-01
  %138 = fadd double %128, %137
  %139 = fadd double %138, %114
  %140 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv169, i64 %indvars.iv128, i64 %indvars.iv87
  store double %139, double* %140, align 8
  %exitcond19 = icmp eq i64 %129, 119
  br i1 %exitcond19, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !16

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit65:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit65, %middle.block.loopexit
  %exitcond20 = icmp eq i64 %77, 119
  %indvar.next12 = add nuw nsw i64 %indvar11, 1
  br i1 %exitcond20, label %._crit_edge22, label %._crit_edge25

._crit_edge22:                                    ; preds = %middle.block
  %exitcond2 = icmp eq i64 %74, 119
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond2, label %141, label %._crit_edge24

; <label>:141:                                    ; preds = %._crit_edge22
  %142 = add nuw nsw i32 %storemerge10, 1
  %exitcond3 = icmp eq i32 %142, 501
  br i1 %exitcond3, label %143, label %.._crit_edge_crit_edge

; <label>:143:                                    ; preds = %141
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %21, %1
  %indvars.iv54 = phi i64 [ 0, %1 ], [ %indvars.iv.next6, %21 ]
  %6 = mul nuw nsw i64 %indvars.iv54, 120
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %20, %._crit_edge
  %indvars.iv13 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next2, %20 ]
  %7 = add nuw nsw i64 %6, %indvars.iv13
  %8 = mul nuw nsw i64 %7, 120
  br label %9

; <label>:9:                                      ; preds = %._crit_edge10, %._crit_edge8
  %indvars.iv2 = phi i64 [ 0, %._crit_edge8 ], [ %indvars.iv.next, %._crit_edge10 ]
  %10 = add nuw nsw i64 %8, %indvars.iv2
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge10

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv54, i64 %indvars.iv13, i64 %indvars.iv2
  %18 = load double, double* %17, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond7, label %20, label %9

; <label>:20:                                     ; preds = %._crit_edge10
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond, label %21, label %._crit_edge8

; <label>:21:                                     ; preds = %20
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next6, 120
  br i1 %exitcond1, label %22, label %._crit_edge

; <label>:22:                                     ; preds = %21
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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

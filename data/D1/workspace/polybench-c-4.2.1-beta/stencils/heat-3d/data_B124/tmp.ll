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
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array([120 x [120 x double]]* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  br label %.preheader1

.preheader1:                                      ; preds = %2, %21
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %21 ]
  %3 = add nuw nsw i64 %indvars.iv3, 120
  br label %.preheader

.preheader:                                       ; preds = %.preheader1, %20
  %indvars.iv1 = phi i64 [ 0, %.preheader1 ], [ %indvars.iv.next2, %20 ]
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
  br i1 %exitcond5, label %.preheader1, label %22

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  br label %.preheader6

.preheader6:                                      ; preds = %138, %2
  %3 = phi i32 [ 1, %2 ], [ %139, %138 ]
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader6, %70
  %indvars.iv60 = phi i64 [ 1, %.preheader6 ], [ %indvars.iv.next61, %70 ]
  %indvar21 = phi i64 [ 0, %.preheader6 ], [ %4, %70 ]
  %4 = add nuw nsw i64 %indvar21, 1
  %5 = add nuw nsw i64 %indvar21, 2
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %6 = add nsw i64 %indvars.iv60, -1
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader4, %middle.block17
  %indvars.iv57 = phi i64 [ 1, %.preheader4 ], [ %indvars.iv.next58, %middle.block17 ]
  %indvar23 = phi i64 [ 0, %.preheader4 ], [ %7, %middle.block17 ]
  %7 = add nuw nsw i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %7, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %7, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar21, i64 %7, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %7, i64 119
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %8 = add nsw i64 %indvars.iv57, -1
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
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next61, i64 %indvars.iv57, i64 %offset.idx43
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv57, i64 %offset.idx43
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %14 = fsub <2 x double> %wide.load47, %13
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %indvars.iv57, i64 %offset.idx43
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fadd <2 x double> %wide.load49, %14
  %18 = fmul <2 x double> %17, <double 1.250000e-01, double 1.250000e-01>
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv.next58, i64 %offset.idx43
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fsub <2 x double> %wide.load50, %13
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %8, i64 %offset.idx43
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fadd <2 x double> %21, %wide.load51
  %25 = fmul <2 x double> %24, <double 1.250000e-01, double 1.250000e-01>
  %26 = fadd <2 x double> %18, %25
  %27 = add nuw nsw i64 %offset.idx43, 1
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv57, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fsub <2 x double> %wide.load52, %13
  %31 = add nsw i64 %offset.idx43, -1
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv57, i64 %31
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fadd <2 x double> %30, %wide.load53
  %35 = fmul <2 x double> %34, <double 1.250000e-01, double 1.250000e-01>
  %36 = fadd <2 x double> %26, %35
  %37 = fadd <2 x double> %wide.load48, %36
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv60, i64 %indvars.iv57, i64 %offset.idx43
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> %37, <2 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add nuw nsw i64 %index39, 2
  %40 = icmp eq i64 %index.next40, 118
  br i1 %40, label %middle.block17.loopexit56, label %vector.body16, !llvm.loop !6

scalar.ph18:                                      ; preds = %scalar.ph18.preheader, %scalar.ph18
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph18 ], [ 1, %scalar.ph18.preheader ]
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next61, i64 %indvars.iv57, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv57, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, 2.000000e+00
  %46 = fsub double %42, %45
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %indvars.iv57, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  %50 = fmul double %49, 1.250000e-01
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv.next58, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %45
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %8, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  %57 = fmul double %56, 1.250000e-01
  %58 = fadd double %50, %57
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv57, i64 %indvars.iv.next
  %60 = load double, double* %59, align 8
  %61 = fsub double %60, %45
  %62 = add nsw i64 %indvars.iv, -1
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv60, i64 %indvars.iv57, i64 %62
  %64 = load double, double* %63, align 8
  %65 = fadd double %61, %64
  %66 = fmul double %65, 1.250000e-01
  %67 = fadd double %58, %66
  %68 = fadd double %44, %67
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv60, i64 %indvars.iv57, i64 %indvars.iv
  store double %68, double* %69, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %middle.block17.loopexit, label %scalar.ph18, !llvm.loop !9

middle.block17.loopexit:                          ; preds = %scalar.ph18
  br label %middle.block17

middle.block17.loopexit56:                        ; preds = %vector.body16
  br label %middle.block17

middle.block17:                                   ; preds = %middle.block17.loopexit56, %middle.block17.loopexit
  %exitcond59 = icmp ne i64 %7, 118
  br i1 %exitcond59, label %.preheader2, label %70

; <label>:70:                                     ; preds = %middle.block17
  %exitcond62 = icmp ne i64 %4, 118
  br i1 %exitcond62, label %.preheader4, label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %70
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.preheader, %137
  %indvars.iv66 = phi i64 [ 1, %.preheader3.preheader ], [ %indvars.iv.next67, %137 ]
  %indvar = phi i64 [ %71, %137 ], [ 0, %.preheader3.preheader ]
  %71 = add nuw nsw i64 %indvar, 1
  %72 = add nuw nsw i64 %indvar, 2
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %73 = add nsw i64 %indvars.iv66, -1
  br label %.preheader

.preheader:                                       ; preds = %.preheader3, %middle.block
  %indvars.iv63 = phi i64 [ 1, %.preheader3 ], [ %indvars.iv.next64, %middle.block ]
  %indvar1 = phi i64 [ 0, %.preheader3 ], [ %74, %middle.block ]
  %74 = add nuw nsw i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %71, i64 %74, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %71, i64 %74, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %74, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %72, i64 %74, i64 119
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %75 = add nsw i64 %indvars.iv63, -1
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
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next67, i64 %indvars.iv63, i64 %offset.idx
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %offset.idx
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %81 = fsub <2 x double> %wide.load, %80
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %73, i64 %indvars.iv63, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = fadd <2 x double> %wide.load11, %81
  %85 = fmul <2 x double> %84, <double 1.250000e-01, double 1.250000e-01>
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv.next64, i64 %offset.idx
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !10
  %88 = fsub <2 x double> %wide.load12, %80
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %75, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fadd <2 x double> %88, %wide.load13
  %92 = fmul <2 x double> %91, <double 1.250000e-01, double 1.250000e-01>
  %93 = fadd <2 x double> %85, %92
  %94 = add nuw nsw i64 %offset.idx, 1
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %94
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = fsub <2 x double> %wide.load14, %80
  %98 = add nsw i64 %offset.idx, -1
  %99 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %98
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = fadd <2 x double> %97, %wide.load15
  %102 = fmul <2 x double> %101, <double 1.250000e-01, double 1.250000e-01>
  %103 = fadd <2 x double> %93, %102
  %104 = fadd <2 x double> %wide.load10, %103
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %indvars.iv63, i64 %offset.idx
  %106 = bitcast double* %105 to <2 x double>*
  store <2 x double> %104, <2 x double>* %106, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %107 = icmp eq i64 %index.next, 118
  br i1 %107, label %middle.block.loopexit55, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next67, i64 %indvars.iv63, i64 %indvars.iv7
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv7
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, 2.000000e+00
  %113 = fsub double %109, %112
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %73, i64 %indvars.iv63, i64 %indvars.iv7
  %115 = load double, double* %114, align 8
  %116 = fadd double %115, %113
  %117 = fmul double %116, 1.250000e-01
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv.next64, i64 %indvars.iv7
  %119 = load double, double* %118, align 8
  %120 = fsub double %119, %112
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %75, i64 %indvars.iv7
  %122 = load double, double* %121, align 8
  %123 = fadd double %120, %122
  %124 = fmul double %123, 1.250000e-01
  %125 = fadd double %117, %124
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %126 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv.next8
  %127 = load double, double* %126, align 8
  %128 = fsub double %127, %112
  %129 = add nsw i64 %indvars.iv7, -1
  %130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv63, i64 %129
  %131 = load double, double* %130, align 8
  %132 = fadd double %128, %131
  %133 = fmul double %132, 1.250000e-01
  %134 = fadd double %125, %133
  %135 = fadd double %111, %134
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv66, i64 %indvars.iv63, i64 %indvars.iv7
  store double %135, double* %136, align 8
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 119
  br i1 %exitcond9, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !16

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit55:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit55, %middle.block.loopexit
  %exitcond65 = icmp ne i64 %74, 118
  br i1 %exitcond65, label %.preheader, label %137

; <label>:137:                                    ; preds = %middle.block
  %exitcond68 = icmp ne i64 %71, 118
  br i1 %exitcond68, label %.preheader3, label %138

; <label>:138:                                    ; preds = %137
  %139 = add nuw nsw i32 %3, 1
  %exitcond10 = icmp eq i32 %139, 501
  br i1 %exitcond10, label %140, label %.preheader6

; <label>:140:                                    ; preds = %138
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
  br label %.preheader1

.preheader1:                                      ; preds = %1, %22
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %22 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 14400
  br label %.preheader

.preheader:                                       ; preds = %.preheader1, %21
  %indvars.iv1 = phi i64 [ 0, %.preheader1 ], [ %indvars.iv.next2, %21 ]
  %7 = mul nuw nsw i64 %indvars.iv1, 120
  %8 = add nuw nsw i64 %7, %6
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %16 ]
  %10 = add nuw nsw i64 %8, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #4
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
  br i1 %exitcond6, label %.preheader1, label %23

; <label>:23:                                     ; preds = %22
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #4
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

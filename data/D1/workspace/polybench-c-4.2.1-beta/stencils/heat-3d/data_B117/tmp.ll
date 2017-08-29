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
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array([120 x [120 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  br label %.preheader3

.preheader3:                                      ; preds = %2, %14
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %14 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader3, %13
  %indvars.iv1 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next2, %13 ]
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %3 ]
  %4 = sub nuw nsw i64 120, %indvars.iv
  %5 = add nuw nsw i64 %4, %indvars.iv4
  %6 = add nuw nsw i64 %5, %indvars.iv1
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fmul double %8, 1.000000e+01
  %10 = fdiv double %9, 1.200000e+02
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  store double %10, double* %12, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %13, label %3

; <label>:13:                                     ; preds = %3
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp ne i64 %indvars.iv.next2, 120
  br i1 %exitcond3, label %.preheader, label %14

; <label>:14:                                     ; preds = %13
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp ne i64 %indvars.iv.next5, 120
  br i1 %exitcond6, label %.preheader3, label %15

; <label>:15:                                     ; preds = %14
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  br label %.preheader11

.preheader11:                                     ; preds = %._crit_edge34, %2
  %3 = phi i32 [ 1, %2 ], [ %136, %._crit_edge34 ]
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader11, %._crit_edge21
  %indvars.iv59 = phi i64 [ 1, %.preheader11 ], [ %indvars.iv.next60, %._crit_edge21 ]
  %indvar21 = phi i64 [ 0, %.preheader11 ], [ %indvar.next22, %._crit_edge21 ]
  %4 = add nuw nsw i64 %indvar21, 1
  %5 = add nuw nsw i64 %indvar21, 2
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %6 = add nsw i64 %indvars.iv59, -1
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge.us, %.preheader9
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge.us ], [ 1, %.preheader9 ]
  %indvar23 = phi i64 [ %indvar.next24, %._crit_edge.us ], [ 0, %.preheader9 ]
  %7 = add nuw nsw i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %7, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %7, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar21, i64 %7, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %7, i64 119
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %8 = add nsw i64 %indvars.iv56, -1
  %bound033 = icmp ult double* %scevgep25, %scevgep31
  %bound134 = icmp ult double* %scevgep29, %scevgep27
  %memcheck.conflict36 = and i1 %bound033, %bound134
  br i1 %memcheck.conflict36, label %scalar.ph18.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %.preheader7.us
  br label %vector.body16

scalar.ph18.preheader:                            ; preds = %.preheader7.us
  br label %scalar.ph18

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index39 = phi i64 [ %index.next40, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx43 = or i64 %index39, 1
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next60, i64 %indvars.iv56, i64 %offset.idx43
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv59, i64 %indvars.iv56, i64 %offset.idx43
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %14 = fsub <2 x double> %wide.load47, %13
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %indvars.iv56, i64 %offset.idx43
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fadd <2 x double> %wide.load49, %14
  %18 = fmul <2 x double> %17, <double 1.250000e-01, double 1.250000e-01>
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv59, i64 %indvars.iv.next57, i64 %offset.idx43
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fsub <2 x double> %wide.load50, %13
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv59, i64 %8, i64 %offset.idx43
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fadd <2 x double> %21, %wide.load51
  %25 = fmul <2 x double> %24, <double 1.250000e-01, double 1.250000e-01>
  %26 = fadd <2 x double> %18, %25
  %27 = add nuw nsw i64 %offset.idx43, 1
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv59, i64 %indvars.iv56, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fsub <2 x double> %wide.load52, %13
  %31 = add nsw i64 %offset.idx43, -1
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv59, i64 %indvars.iv56, i64 %31
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fadd <2 x double> %30, %wide.load53
  %35 = fmul <2 x double> %34, <double 1.250000e-01, double 1.250000e-01>
  %36 = fadd <2 x double> %26, %35
  %37 = fadd <2 x double> %wide.load48, %36
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv56, i64 %offset.idx43
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> %37, <2 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add nuw nsw i64 %index39, 2
  %40 = icmp eq i64 %index.next40, 118
  br i1 %40, label %._crit_edge.us.loopexit55, label %vector.body16, !llvm.loop !6

scalar.ph18:                                      ; preds = %scalar.ph18.preheader, %scalar.ph18
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph18 ], [ 1, %scalar.ph18.preheader ]
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next60, i64 %indvars.iv56, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv59, i64 %indvars.iv56, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, 2.000000e+00
  %46 = fsub double %42, %45
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %indvars.iv56, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  %50 = fmul double %49, 1.250000e-01
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv59, i64 %indvars.iv.next57, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %45
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv59, i64 %8, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  %57 = fmul double %56, 1.250000e-01
  %58 = fadd double %50, %57
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv59, i64 %indvars.iv56, i64 %indvars.iv.next
  %60 = load double, double* %59, align 8
  %61 = fsub double %60, %45
  %62 = add nsw i64 %indvars.iv, -1
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv59, i64 %indvars.iv56, i64 %62
  %64 = load double, double* %63, align 8
  %65 = fadd double %61, %64
  %66 = fmul double %65, 1.250000e-01
  %67 = fadd double %58, %66
  %68 = fadd double %44, %67
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %indvars.iv56, i64 %indvars.iv
  store double %68, double* %69, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph18, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph18
  br label %._crit_edge.us

._crit_edge.us.loopexit55:                        ; preds = %vector.body16
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit55, %._crit_edge.us.loopexit
  %indvar.next24 = add nuw nsw i64 %indvar23, 1
  %exitcond58 = icmp ne i64 %indvar.next24, 118
  br i1 %exitcond58, label %.preheader7.us, label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge.us
  %indvar.next22 = add nuw nsw i64 %indvar21, 1
  %exitcond61 = icmp ne i64 %indvar.next22, 118
  br i1 %exitcond61, label %.preheader9, label %.preheader.lr.ph.preheader

.preheader.lr.ph.preheader:                       ; preds = %._crit_edge21
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge32
  %indvar = phi i64 [ %indvar.next, %._crit_edge32 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge32 ], [ 1, %.preheader.lr.ph.preheader ]
  %70 = add nuw nsw i64 %indvar, 1
  %71 = add nuw nsw i64 %indvar, 2
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %72 = add nsw i64 %indvars.iv73, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge30.us, %.preheader.lr.ph
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge30.us ], [ 1, %.preheader.lr.ph ]
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge30.us ], [ 0, %.preheader.lr.ph ]
  %73 = add nuw nsw i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %70, i64 %73, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %70, i64 %73, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %73, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %71, i64 %73, i64 119
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %74 = add nsw i64 %indvars.iv62, -1
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
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next74, i64 %indvars.iv62, i64 %offset.idx
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv73, i64 %indvars.iv62, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %80 = fsub <2 x double> %wide.load, %79
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %72, i64 %indvars.iv62, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = fadd <2 x double> %wide.load11, %80
  %84 = fmul <2 x double> %83, <double 1.250000e-01, double 1.250000e-01>
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv73, i64 %indvars.iv.next63, i64 %offset.idx
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = fsub <2 x double> %wide.load12, %79
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv73, i64 %74, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fadd <2 x double> %87, %wide.load13
  %91 = fmul <2 x double> %90, <double 1.250000e-01, double 1.250000e-01>
  %92 = fadd <2 x double> %84, %91
  %93 = add nuw nsw i64 %offset.idx, 1
  %94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv73, i64 %indvars.iv62, i64 %93
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !10
  %96 = fsub <2 x double> %wide.load14, %79
  %97 = add nsw i64 %offset.idx, -1
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv73, i64 %indvars.iv62, i64 %97
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !10
  %100 = fadd <2 x double> %96, %wide.load15
  %101 = fmul <2 x double> %100, <double 1.250000e-01, double 1.250000e-01>
  %102 = fadd <2 x double> %92, %101
  %103 = fadd <2 x double> %wide.load10, %102
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv73, i64 %indvars.iv62, i64 %offset.idx
  %105 = bitcast double* %104 to <2 x double>*
  store <2 x double> %103, <2 x double>* %105, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %106 = icmp eq i64 %index.next, 118
  br i1 %106, label %._crit_edge30.us.loopexit54, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %107 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next74, i64 %indvars.iv62, i64 %indvars.iv70
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv73, i64 %indvars.iv62, i64 %indvars.iv70
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, 2.000000e+00
  %112 = fsub double %108, %111
  %113 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %72, i64 %indvars.iv62, i64 %indvars.iv70
  %114 = load double, double* %113, align 8
  %115 = fadd double %114, %112
  %116 = fmul double %115, 1.250000e-01
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv73, i64 %indvars.iv.next63, i64 %indvars.iv70
  %118 = load double, double* %117, align 8
  %119 = fsub double %118, %111
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv73, i64 %74, i64 %indvars.iv70
  %121 = load double, double* %120, align 8
  %122 = fadd double %119, %121
  %123 = fmul double %122, 1.250000e-01
  %124 = fadd double %116, %123
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv73, i64 %indvars.iv62, i64 %indvars.iv.next71
  %126 = load double, double* %125, align 8
  %127 = fsub double %126, %111
  %128 = add nsw i64 %indvars.iv70, -1
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv73, i64 %indvars.iv62, i64 %128
  %130 = load double, double* %129, align 8
  %131 = fadd double %127, %130
  %132 = fmul double %131, 1.250000e-01
  %133 = fadd double %124, %132
  %134 = fadd double %110, %133
  %135 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv73, i64 %indvars.iv62, i64 %indvars.iv70
  store double %134, double* %135, align 8
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 119
  br i1 %exitcond72, label %._crit_edge30.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge30.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge30.us

._crit_edge30.us.loopexit54:                      ; preds = %vector.body
  br label %._crit_edge30.us

._crit_edge30.us:                                 ; preds = %._crit_edge30.us.loopexit54, %._crit_edge30.us.loopexit
  %indvar.next2 = add nuw nsw i64 %indvar1, 1
  %exitcond64 = icmp ne i64 %indvar.next2, 118
  br i1 %exitcond64, label %.preheader.us, label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge30.us
  %exitcond75 = icmp eq i64 %indvars.iv.next74, 119
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond75, label %._crit_edge34, label %.preheader.lr.ph

._crit_edge34:                                    ; preds = %._crit_edge32
  %136 = add nuw nsw i32 %3, 1
  %exitcond76 = icmp eq i32 %136, 501
  br i1 %exitcond76, label %137, label %.preheader11

; <label>:137:                                    ; preds = %._crit_edge34
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
  br label %.preheader3

.preheader3:                                      ; preds = %1, %21
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %21 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 120
  br label %.preheader

.preheader:                                       ; preds = %.preheader3, %20
  %indvars.iv1 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next2, %20 ]
  %7 = add nuw nsw i64 %6, %indvars.iv1
  %8 = mul nuw nsw i64 %7, 120
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nuw nsw i64 %8, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %20, label %9

; <label>:20:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp ne i64 %indvars.iv.next2, 120
  br i1 %exitcond3, label %.preheader, label %21

; <label>:21:                                     ; preds = %20
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp ne i64 %indvars.iv.next5, 120
  br i1 %exitcond6, label %.preheader3, label %22

; <label>:22:                                     ; preds = %21
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #4
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

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
define internal fastcc void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader23.preheader

.preheader23.preheader:                           ; preds = %19, %2
  %indvars.iv2832 = phi i64 [ 0, %2 ], [ %indvars.iv.next29, %19 ]
  %3 = add nuw nsw i64 %indvars.iv2832, 120
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader23, %.preheader23.preheader
  %indvars.iv2431 = phi i64 [ 0, %.preheader23.preheader ], [ %indvars.iv.next25, %.preheader23 ]
  %4 = add nuw nsw i64 %3, %indvars.iv2431
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv30 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.1, %.preheader ]
  %5 = sub nuw nsw i64 %4, %indvars.iv30
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv2832, i64 %indvars.iv2431, i64 %indvars.iv30
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv2832, i64 %indvars.iv2431, i64 %indvars.iv30
  %indvars.iv.next = or i64 %indvars.iv30, 1
  %10 = sub nuw nsw i64 %4, %indvars.iv.next
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %14, <double 1.000000e+01, double 1.000000e+01>
  %16 = fdiv <2 x double> %15, <double 1.200000e+02, double 1.200000e+02>
  %17 = bitcast double* %8 to <2 x double>*
  %18 = bitcast double* %9 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  store <2 x double> %16, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv30, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %.preheader23, label %.preheader

.preheader23:                                     ; preds = %.preheader
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv2431, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 120
  br i1 %exitcond27, label %19, label %.preheader.preheader

; <label>:19:                                     ; preds = %.preheader23
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv2832, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next29, 120
  br i1 %exitcond33, label %20, label %.preheader23.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader116.preheader

.preheader116.preheader:                          ; preds = %.preheader115._crit_edge, %2
  %.0111140 = phi i32 [ 1, %2 ], [ %155, %.preheader115._crit_edge ]
  br label %.preheader114.preheader

.preheader114.preheader:                          ; preds = %.preheader116, %.preheader116.preheader
  %indvar21 = phi i64 [ %indvar.next22, %.preheader116 ], [ 0, %.preheader116.preheader ]
  %indvars.iv121136 = phi i64 [ %indvars.iv.next122, %.preheader116 ], [ 1, %.preheader116.preheader ]
  %3 = add i64 %indvar21, 1
  %4 = add i64 %indvar21, 2
  %5 = add nuw nsw i64 %indvars.iv121136, 1
  %6 = add nsw i64 %indvars.iv121136, -1
  br label %vector.memcheck37

vector.memcheck37:                                ; preds = %.preheader114, %.preheader114.preheader
  %indvar23 = phi i64 [ %indvar.next24, %.preheader114 ], [ 0, %.preheader114.preheader ]
  %indvars.iv117135 = phi i64 [ %indvars.iv.next118, %.preheader114 ], [ 1, %.preheader114.preheader ]
  %7 = add i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %7, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %7, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar21, i64 %7, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %7, i64 119
  %8 = add nuw nsw i64 %indvars.iv117135, 1
  %9 = add nsw i64 %indvars.iv117135, -1
  %bound033 = icmp ult double* %scevgep25, %scevgep31
  %bound134 = icmp ult double* %scevgep29, %scevgep27
  %memcheck.conflict36 = and i1 %bound033, %bound134
  br i1 %memcheck.conflict36, label %.preheader112.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %vector.memcheck37
  br label %vector.body16

.preheader112.preheader:                          ; preds = %vector.memcheck37
  br label %.preheader112

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index39 = phi i64 [ %index.next40, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx43 = or i64 %index39, 1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv117135, i64 %offset.idx43
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv121136, i64 %indvars.iv117135, i64 %offset.idx43
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %15 = fsub <2 x double> %wide.load47, %14
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %indvars.iv117135, i64 %offset.idx43
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %wide.load49, %15
  %19 = fmul <2 x double> %18, <double 1.250000e-01, double 1.250000e-01>
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv121136, i64 %8, i64 %offset.idx43
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fsub <2 x double> %wide.load50, %14
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv121136, i64 %9, i64 %offset.idx43
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %22, %wide.load51
  %26 = fmul <2 x double> %25, <double 1.250000e-01, double 1.250000e-01>
  %27 = fadd <2 x double> %19, %26
  %28 = add nuw nsw i64 %offset.idx43, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv121136, i64 %indvars.iv117135, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fsub <2 x double> %wide.load52, %14
  %32 = add nsw i64 %offset.idx43, -1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv121136, i64 %indvars.iv117135, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %31, %wide.load53
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %27, %36
  %38 = fadd <2 x double> %wide.load48, %37
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv121136, i64 %indvars.iv117135, i64 %offset.idx43
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add i64 %index39, 2
  %41 = icmp eq i64 %index.next40, 118
  br i1 %41, label %.preheader114.loopexit55, label %vector.body16, !llvm.loop !6

.preheader112:                                    ; preds = %.preheader112.preheader, %.preheader112
  %indvars.iv134 = phi i64 [ %indvars.iv.next, %.preheader112 ], [ 1, %.preheader112.preheader ]
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv117135, i64 %indvars.iv134
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv121136, i64 %indvars.iv117135, i64 %indvars.iv134
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, 2.000000e+00
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %indvars.iv117135, i64 %indvars.iv134
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv121136, i64 %8, i64 %indvars.iv134
  %50 = load double, double* %49, align 8
  %51 = insertelement <2 x double> undef, double %46, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  %53 = insertelement <2 x double> undef, double %43, i32 0
  %54 = insertelement <2 x double> %53, double %50, i32 1
  %55 = fsub <2 x double> %54, %52
  %56 = extractelement <2 x double> %55, i32 0
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv121136, i64 %9, i64 %indvars.iv134
  %58 = load double, double* %57, align 8
  %59 = insertelement <2 x double> undef, double %56, i32 0
  %60 = insertelement <2 x double> %59, double %58, i32 1
  %61 = insertelement <2 x double> undef, double %48, i32 0
  %62 = shufflevector <2 x double> %61, <2 x double> %55, <2 x i32> <i32 0, i32 3>
  %63 = fadd <2 x double> %62, %60
  %64 = fmul <2 x double> %63, <double 1.250000e-01, double 1.250000e-01>
  %65 = extractelement <2 x double> %64, i32 0
  %66 = extractelement <2 x double> %64, i32 1
  %67 = fadd double %65, %66
  %indvars.iv.next = add nuw nsw i64 %indvars.iv134, 1
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv121136, i64 %indvars.iv117135, i64 %indvars.iv.next
  %69 = load double, double* %68, align 8
  %70 = fsub double %69, %46
  %71 = add nsw i64 %indvars.iv134, -1
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv121136, i64 %indvars.iv117135, i64 %71
  %73 = load double, double* %72, align 8
  %74 = fadd double %70, %73
  %75 = fmul double %74, 1.250000e-01
  %76 = fadd double %67, %75
  %77 = fadd double %45, %76
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv121136, i64 %indvars.iv117135, i64 %indvars.iv134
  store double %77, double* %78, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %.preheader114.loopexit, label %.preheader112, !llvm.loop !9

.preheader114.loopexit:                           ; preds = %.preheader112
  br label %.preheader114

.preheader114.loopexit55:                         ; preds = %vector.body16
  br label %.preheader114

.preheader114:                                    ; preds = %.preheader114.loopexit55, %.preheader114.loopexit
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117135, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next118, 119
  %indvar.next24 = add i64 %indvar23, 1
  br i1 %exitcond120, label %.preheader116, label %vector.memcheck37

.preheader116:                                    ; preds = %.preheader114
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121136, 1
  %exitcond141 = icmp eq i64 %indvars.iv.next122, 119
  %indvar.next22 = add i64 %indvar21, 1
  br i1 %exitcond141, label %.preheader113.preheader.preheader, label %.preheader114.preheader

.preheader113.preheader.preheader:                ; preds = %.preheader116
  br label %.preheader113.preheader

.preheader113.preheader:                          ; preds = %.preheader113.preheader.preheader, %.preheader115
  %indvar = phi i64 [ %indvar.next, %.preheader115 ], [ 0, %.preheader113.preheader.preheader ]
  %indvars.iv131139 = phi i64 [ %indvars.iv.next132, %.preheader115 ], [ 1, %.preheader113.preheader.preheader ]
  %79 = add i64 %indvar, 1
  %80 = add i64 %indvar, 2
  %81 = add nuw nsw i64 %indvars.iv131139, 1
  %82 = add nsw i64 %indvars.iv131139, -1
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %.preheader113, %.preheader113.preheader
  %indvar1 = phi i64 [ %indvar.next2, %.preheader113 ], [ 0, %.preheader113.preheader ]
  %indvars.iv127138 = phi i64 [ %indvars.iv.next128, %.preheader113 ], [ 1, %.preheader113.preheader ]
  %83 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %79, i64 %83, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %79, i64 %83, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %83, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %80, i64 %83, i64 119
  %84 = add nuw nsw i64 %indvars.iv127138, 1
  %85 = add nsw i64 %indvars.iv127138, -1
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.preheader.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

.preheader.preheader:                             ; preds = %vector.memcheck
  br label %.preheader

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %81, i64 %indvars.iv127138, i64 %offset.idx
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !10
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv131139, i64 %indvars.iv127138, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %91 = fsub <2 x double> %wide.load, %90
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %82, i64 %indvars.iv127138, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = fadd <2 x double> %wide.load11, %91
  %95 = fmul <2 x double> %94, <double 1.250000e-01, double 1.250000e-01>
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv131139, i64 %84, i64 %offset.idx
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fsub <2 x double> %wide.load12, %90
  %99 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv131139, i64 %85, i64 %offset.idx
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = fadd <2 x double> %98, %wide.load13
  %102 = fmul <2 x double> %101, <double 1.250000e-01, double 1.250000e-01>
  %103 = fadd <2 x double> %95, %102
  %104 = add nuw nsw i64 %offset.idx, 1
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv131139, i64 %indvars.iv127138, i64 %104
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !10
  %107 = fsub <2 x double> %wide.load14, %90
  %108 = add nsw i64 %offset.idx, -1
  %109 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv131139, i64 %indvars.iv127138, i64 %108
  %110 = bitcast double* %109 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %110, align 8, !alias.scope !10
  %111 = fadd <2 x double> %107, %wide.load15
  %112 = fmul <2 x double> %111, <double 1.250000e-01, double 1.250000e-01>
  %113 = fadd <2 x double> %103, %112
  %114 = fadd <2 x double> %wide.load10, %113
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv131139, i64 %indvars.iv127138, i64 %offset.idx
  %116 = bitcast double* %115 to <2 x double>*
  store <2 x double> %114, <2 x double>* %116, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %117 = icmp eq i64 %index.next, 118
  br i1 %117, label %.preheader113.loopexit54, label %vector.body, !llvm.loop !15

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv123137 = phi i64 [ %indvars.iv.next124, %.preheader ], [ 1, %.preheader.preheader ]
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %81, i64 %indvars.iv127138, i64 %indvars.iv123137
  %119 = load double, double* %118, align 8
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv131139, i64 %indvars.iv127138, i64 %indvars.iv123137
  %121 = load double, double* %120, align 8
  %122 = fmul double %121, 2.000000e+00
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %82, i64 %indvars.iv127138, i64 %indvars.iv123137
  %124 = load double, double* %123, align 8
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv131139, i64 %84, i64 %indvars.iv123137
  %126 = load double, double* %125, align 8
  %127 = insertelement <2 x double> undef, double %122, i32 0
  %128 = shufflevector <2 x double> %127, <2 x double> undef, <2 x i32> zeroinitializer
  %129 = insertelement <2 x double> undef, double %119, i32 0
  %130 = insertelement <2 x double> %129, double %126, i32 1
  %131 = fsub <2 x double> %130, %128
  %132 = extractelement <2 x double> %131, i32 0
  %133 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv131139, i64 %85, i64 %indvars.iv123137
  %134 = load double, double* %133, align 8
  %135 = insertelement <2 x double> undef, double %132, i32 0
  %136 = insertelement <2 x double> %135, double %134, i32 1
  %137 = insertelement <2 x double> undef, double %124, i32 0
  %138 = shufflevector <2 x double> %137, <2 x double> %131, <2 x i32> <i32 0, i32 3>
  %139 = fadd <2 x double> %138, %136
  %140 = fmul <2 x double> %139, <double 1.250000e-01, double 1.250000e-01>
  %141 = extractelement <2 x double> %140, i32 0
  %142 = extractelement <2 x double> %140, i32 1
  %143 = fadd double %141, %142
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123137, 1
  %144 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv131139, i64 %indvars.iv127138, i64 %indvars.iv.next124
  %145 = load double, double* %144, align 8
  %146 = fsub double %145, %122
  %147 = add nsw i64 %indvars.iv123137, -1
  %148 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv131139, i64 %indvars.iv127138, i64 %147
  %149 = load double, double* %148, align 8
  %150 = fadd double %146, %149
  %151 = fmul double %150, 1.250000e-01
  %152 = fadd double %143, %151
  %153 = fadd double %121, %152
  %154 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv131139, i64 %indvars.iv127138, i64 %indvars.iv123137
  store double %153, double* %154, align 8
  %exitcond126 = icmp eq i64 %indvars.iv.next124, 119
  br i1 %exitcond126, label %.preheader113.loopexit, label %.preheader, !llvm.loop !16

.preheader113.loopexit:                           ; preds = %.preheader
  br label %.preheader113

.preheader113.loopexit54:                         ; preds = %vector.body
  br label %.preheader113

.preheader113:                                    ; preds = %.preheader113.loopexit54, %.preheader113.loopexit
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127138, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next128, 119
  %indvar.next2 = add i64 %indvar1, 1
  br i1 %exitcond130, label %.preheader115, label %vector.memcheck

.preheader115:                                    ; preds = %.preheader113
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131139, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next132, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond142, label %.preheader115._crit_edge, label %.preheader113.preheader

.preheader115._crit_edge:                         ; preds = %.preheader115
  %155 = add nuw nsw i32 %.0111140, 1
  %exitcond133 = icmp eq i32 %155, 501
  br i1 %exitcond133, label %156, label %.preheader116.preheader

; <label>:156:                                    ; preds = %.preheader115._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader20.preheader

.preheader20.preheader:                           ; preds = %20, %1
  %indvars.iv2529 = phi i64 [ 0, %1 ], [ %indvars.iv.next26, %20 ]
  %6 = mul nuw nsw i64 %indvars.iv2529, 120
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader20, %.preheader20.preheader
  %indvars.iv2128 = phi i64 [ 0, %.preheader20.preheader ], [ %indvars.iv.next22, %.preheader20 ]
  %7 = add nuw nsw i64 %indvars.iv2128, %6
  %sext = mul nuw nsw i64 %7, 515396075520
  %8 = lshr exact i64 %sext, 32
  br label %9

; <label>:9:                                      ; preds = %.preheader, %.preheader.preheader
  %indvars.iv27 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %10 = add nuw nsw i64 %indvars.iv27, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %.preheader

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %.preheader

.preheader:                                       ; preds = %14, %9
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv2529, i64 %indvars.iv2128, i64 %indvars.iv27
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %.preheader20, label %9

.preheader20:                                     ; preds = %.preheader
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2128, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 120
  br i1 %exitcond24, label %20, label %.preheader.preheader

; <label>:20:                                     ; preds = %.preheader20
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv2529, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next26, 120
  br i1 %exitcond30, label %21, label %.preheader20.preheader

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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

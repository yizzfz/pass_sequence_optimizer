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
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array([120 x [120 x double]]* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader23

.preheader23:                                     ; preds = %21, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %21 ]
  %3 = add nuw nsw i64 %indvars.iv3, 120
  br label %.preheader

.preheader:                                       ; preds = %20, %.preheader23
  %indvars.iv1 = phi i64 [ 0, %.preheader23 ], [ %indvars.iv.next2, %20 ]
  %4 = add nuw nsw i64 %3, %indvars.iv1
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = sub nuw nsw i64 %4, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = sub nuw nsw i64 %4, %indvars.iv.next
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %8, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %15, <double 1.000000e+01, double 1.000000e+01>
  %17 = fdiv <2 x double> %16, <double 1.200000e+02, double 1.200000e+02>
  %18 = bitcast double* %9 to <2 x double>*
  %19 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  store <2 x double> %17, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %20, label %5

; <label>:20:                                     ; preds = %5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 120
  br i1 %exitcond5, label %22, label %.preheader23

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge131, %2
  %.0111132 = phi i32 [ 1, %2 ], [ %153, %._crit_edge131 ]
  br label %.preheader114

.preheader114:                                    ; preds = %._crit_edge120, %.preheader116
  %indvars.iv57 = phi i64 [ 1, %.preheader116 ], [ %indvars.iv.next58, %._crit_edge120 ]
  %indvar21 = phi i64 [ 0, %.preheader116 ], [ %indvar.next22, %._crit_edge120 ]
  %3 = add nuw nsw i64 %indvar21, 1
  %4 = add nuw nsw i64 %indvar21, 2
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %5 = add nsw i64 %indvars.iv57, -1
  br label %.preheader112.us

.preheader112.us:                                 ; preds = %._crit_edge.us, %.preheader114
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge.us ], [ 1, %.preheader114 ]
  %indvar23 = phi i64 [ %indvar.next24, %._crit_edge.us ], [ 0, %.preheader114 ]
  %6 = add nuw nsw i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %6, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %6, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar21, i64 %6, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %6, i64 119
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %7 = add nsw i64 %indvars.iv54, -1
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
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next58, i64 %indvars.iv54, i64 %offset.idx43
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %indvars.iv54, i64 %offset.idx43
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %13 = fsub <2 x double> %wide.load47, %12
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv54, i64 %offset.idx43
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fadd <2 x double> %wide.load49, %13
  %17 = fmul <2 x double> %16, <double 1.250000e-01, double 1.250000e-01>
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %indvars.iv.next55, i64 %offset.idx43
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fsub <2 x double> %wide.load50, %12
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %7, i64 %offset.idx43
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %20, %wide.load51
  %24 = fmul <2 x double> %23, <double 1.250000e-01, double 1.250000e-01>
  %25 = fadd <2 x double> %17, %24
  %26 = add nuw nsw i64 %offset.idx43, 1
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %indvars.iv54, i64 %26
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fsub <2 x double> %wide.load52, %12
  %30 = add nsw i64 %offset.idx43, -1
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %indvars.iv54, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = fadd <2 x double> %29, %wide.load53
  %34 = fmul <2 x double> %33, <double 1.250000e-01, double 1.250000e-01>
  %35 = fadd <2 x double> %25, %34
  %36 = fadd <2 x double> %wide.load48, %35
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv57, i64 %indvars.iv54, i64 %offset.idx43
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add nuw nsw i64 %index39, 2
  %39 = icmp eq i64 %index.next40, 118
  br i1 %39, label %._crit_edge.us.loopexit67, label %vector.body16, !llvm.loop !6

scalar.ph18:                                      ; preds = %scalar.ph18.preheader, %scalar.ph18
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph18 ], [ 1, %scalar.ph18.preheader ]
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next58, i64 %indvars.iv54, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %indvars.iv54, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, 2.000000e+00
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv54, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %indvars.iv.next55, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = insertelement <2 x double> undef, double %44, i32 0
  %50 = insertelement <2 x double> %49, double %44, i32 1
  %51 = insertelement <2 x double> undef, double %41, i32 0
  %52 = insertelement <2 x double> %51, double %48, i32 1
  %53 = fsub <2 x double> %52, %50
  %54 = extractelement <2 x double> %53, i32 0
  %55 = extractelement <2 x double> %53, i32 1
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %7, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = insertelement <2 x double> undef, double %54, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = insertelement <2 x double> undef, double %46, i32 0
  %61 = insertelement <2 x double> %60, double %55, i32 1
  %62 = fadd <2 x double> %61, %59
  %63 = fmul <2 x double> %62, <double 1.250000e-01, double 1.250000e-01>
  %64 = extractelement <2 x double> %63, i32 0
  %65 = extractelement <2 x double> %63, i32 1
  %66 = fadd double %64, %65
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %indvars.iv54, i64 %indvars.iv.next
  %68 = load double, double* %67, align 8
  %69 = fsub double %68, %44
  %70 = add nsw i64 %indvars.iv, -1
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %indvars.iv54, i64 %70
  %72 = load double, double* %71, align 8
  %73 = fadd double %69, %72
  %74 = fmul double %73, 1.250000e-01
  %75 = fadd double %66, %74
  %76 = fadd double %43, %75
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv57, i64 %indvars.iv54, i64 %indvars.iv
  store double %76, double* %77, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph18, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph18
  br label %._crit_edge.us

._crit_edge.us.loopexit67:                        ; preds = %vector.body16
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit67, %._crit_edge.us.loopexit
  %indvar.next24 = add nuw nsw i64 %indvar23, 1
  %exitcond56 = icmp eq i64 %indvar.next24, 118
  br i1 %exitcond56, label %._crit_edge120, label %.preheader112.us

._crit_edge120:                                   ; preds = %._crit_edge.us
  %indvar.next22 = add nuw nsw i64 %indvar21, 1
  %exitcond59 = icmp eq i64 %indvar.next22, 118
  br i1 %exitcond59, label %.preheader113.preheader, label %.preheader114

.preheader113.preheader:                          ; preds = %._crit_edge120
  br label %.preheader113

.preheader113:                                    ; preds = %.preheader113.preheader, %._crit_edge128
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge128 ], [ 1, %.preheader113.preheader ]
  %indvar = phi i64 [ %indvar.next, %._crit_edge128 ], [ 0, %.preheader113.preheader ]
  %78 = add nuw nsw i64 %indvar, 1
  %79 = add nuw nsw i64 %indvar, 2
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %80 = add nsw i64 %indvars.iv63, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge125.us, %.preheader113
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge125.us ], [ 1, %.preheader113 ]
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge125.us ], [ 0, %.preheader113 ]
  %81 = add nuw nsw i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %78, i64 %81, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %78, i64 %81, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %81, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %79, i64 %81, i64 119
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %82 = add nsw i64 %indvars.iv60, -1
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
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next64, i64 %indvars.iv60, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv60, i64 %offset.idx
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %88 = fsub <2 x double> %wide.load, %87
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %80, i64 %indvars.iv60, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fadd <2 x double> %wide.load11, %88
  %92 = fmul <2 x double> %91, <double 1.250000e-01, double 1.250000e-01>
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv.next61, i64 %offset.idx
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fsub <2 x double> %wide.load12, %87
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %82, i64 %offset.idx
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fadd <2 x double> %95, %wide.load13
  %99 = fmul <2 x double> %98, <double 1.250000e-01, double 1.250000e-01>
  %100 = fadd <2 x double> %92, %99
  %101 = add nuw nsw i64 %offset.idx, 1
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv60, i64 %101
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !10
  %104 = fsub <2 x double> %wide.load14, %87
  %105 = add nsw i64 %offset.idx, -1
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv60, i64 %105
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !10
  %108 = fadd <2 x double> %104, %wide.load15
  %109 = fmul <2 x double> %108, <double 1.250000e-01, double 1.250000e-01>
  %110 = fadd <2 x double> %100, %109
  %111 = fadd <2 x double> %wide.load10, %110
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv63, i64 %indvars.iv60, i64 %offset.idx
  %113 = bitcast double* %112 to <2 x double>*
  store <2 x double> %111, <2 x double>* %113, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %114 = icmp eq i64 %index.next, 118
  br i1 %114, label %._crit_edge125.us.loopexit66, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next64, i64 %indvars.iv60, i64 %indvars.iv133
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv60, i64 %indvars.iv133
  %118 = load double, double* %117, align 8
  %119 = fmul double %118, 2.000000e+00
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %80, i64 %indvars.iv60, i64 %indvars.iv133
  %121 = load double, double* %120, align 8
  %122 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv.next61, i64 %indvars.iv133
  %123 = load double, double* %122, align 8
  %124 = insertelement <2 x double> undef, double %119, i32 0
  %125 = insertelement <2 x double> %124, double %119, i32 1
  %126 = insertelement <2 x double> undef, double %116, i32 0
  %127 = insertelement <2 x double> %126, double %123, i32 1
  %128 = fsub <2 x double> %127, %125
  %129 = extractelement <2 x double> %128, i32 0
  %130 = extractelement <2 x double> %128, i32 1
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %82, i64 %indvars.iv133
  %132 = load double, double* %131, align 8
  %133 = insertelement <2 x double> undef, double %129, i32 0
  %134 = insertelement <2 x double> %133, double %132, i32 1
  %135 = insertelement <2 x double> undef, double %121, i32 0
  %136 = insertelement <2 x double> %135, double %130, i32 1
  %137 = fadd <2 x double> %136, %134
  %138 = fmul <2 x double> %137, <double 1.250000e-01, double 1.250000e-01>
  %139 = extractelement <2 x double> %138, i32 0
  %140 = extractelement <2 x double> %138, i32 1
  %141 = fadd double %139, %140
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv60, i64 %indvars.iv.next134
  %143 = load double, double* %142, align 8
  %144 = fsub double %143, %119
  %145 = add nsw i64 %indvars.iv133, -1
  %146 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv60, i64 %145
  %147 = load double, double* %146, align 8
  %148 = fadd double %144, %147
  %149 = fmul double %148, 1.250000e-01
  %150 = fadd double %141, %149
  %151 = fadd double %118, %150
  %152 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv63, i64 %indvars.iv60, i64 %indvars.iv133
  store double %151, double* %152, align 8
  %exitcond135 = icmp eq i64 %indvars.iv.next134, 119
  br i1 %exitcond135, label %._crit_edge125.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge125.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge125.us

._crit_edge125.us.loopexit66:                     ; preds = %vector.body
  br label %._crit_edge125.us

._crit_edge125.us:                                ; preds = %._crit_edge125.us.loopexit66, %._crit_edge125.us.loopexit
  %indvar.next2 = add nuw nsw i64 %indvar1, 1
  %exitcond62 = icmp eq i64 %indvar.next2, 118
  br i1 %exitcond62, label %._crit_edge128, label %.preheader.us

._crit_edge128:                                   ; preds = %._crit_edge125.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond65 = icmp eq i64 %indvar.next, 118
  br i1 %exitcond65, label %._crit_edge131, label %.preheader113

._crit_edge131:                                   ; preds = %._crit_edge128
  %153 = add nuw nsw i32 %.0111132, 1
  %exitcond136 = icmp eq i32 %153, 501
  br i1 %exitcond136, label %154, label %.preheader116

; <label>:154:                                    ; preds = %._crit_edge131
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
  br label %.preheader20

.preheader20:                                     ; preds = %22, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %22 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 120
  br label %.preheader

.preheader:                                       ; preds = %21, %.preheader20
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

; <label>:16:                                     ; preds = %9, %14
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %21, label %9

; <label>:21:                                     ; preds = %16
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond3, label %22, label %.preheader

; <label>:22:                                     ; preds = %21
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 120
  br i1 %exitcond6, label %23, label %.preheader20

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

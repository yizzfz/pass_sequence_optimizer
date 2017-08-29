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
  br label %.preheader1

.preheader1:                                      ; preds = %21, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %21 ]
  %3 = add nuw nsw i64 %indvars.iv3, 120
  br label %.preheader

.preheader:                                       ; preds = %20, %.preheader1
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
  %exitcond = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 120
  br i1 %exitcond5, label %22, label %.preheader1

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge11, %2
  %.012 = phi i32 [ 1, %2 ], [ %135, %._crit_edge11 ]
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge7, %.preheader6
  %indvars.iv57 = phi i64 [ 1, %.preheader6 ], [ %indvars.iv.next58, %._crit_edge7 ]
  %indvar21 = phi i64 [ 0, %.preheader6 ], [ %indvar.next22, %._crit_edge7 ]
  %3 = add nuw nsw i64 %indvar21, 1
  %4 = add nuw nsw i64 %indvar21, 2
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %5 = add nsw i64 %indvars.iv57, -1
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge.us, %.preheader4
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge.us ], [ 1, %.preheader4 ]
  %indvar23 = phi i64 [ %indvar.next24, %._crit_edge.us ], [ 0, %.preheader4 ]
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

vector.body16.preheader:                          ; preds = %.preheader2.us
  br label %vector.body16

scalar.ph18.preheader:                            ; preds = %.preheader2.us
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
  br i1 %39, label %._crit_edge.us.loopexit69, label %vector.body16, !llvm.loop !6

scalar.ph18:                                      ; preds = %scalar.ph18.preheader, %scalar.ph18
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph18 ], [ 1, %scalar.ph18.preheader ]
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next58, i64 %indvars.iv54, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %indvars.iv54, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, 2.000000e+00
  %45 = fsub double %41, %44
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv54, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = fadd double %47, %45
  %49 = fmul double %48, 1.250000e-01
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %indvars.iv.next55, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = fsub double %51, %44
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %7, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  %56 = fmul double %55, 1.250000e-01
  %57 = fadd double %49, %56
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %indvars.iv54, i64 %indvars.iv.next
  %59 = load double, double* %58, align 8
  %60 = fsub double %59, %44
  %61 = add nsw i64 %indvars.iv, -1
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv57, i64 %indvars.iv54, i64 %61
  %63 = load double, double* %62, align 8
  %64 = fadd double %60, %63
  %65 = fmul double %64, 1.250000e-01
  %66 = fadd double %57, %65
  %67 = fadd double %43, %66
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv57, i64 %indvars.iv54, i64 %indvars.iv
  store double %67, double* %68, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph18, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph18
  br label %._crit_edge.us

._crit_edge.us.loopexit69:                        ; preds = %vector.body16
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit69, %._crit_edge.us.loopexit
  %indvar.next24 = add nuw nsw i64 %indvar23, 1
  %exitcond56 = icmp eq i64 %indvar.next24, 118
  br i1 %exitcond56, label %._crit_edge7, label %.preheader2.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  %indvar.next22 = add nuw nsw i64 %indvar21, 1
  %exitcond59 = icmp eq i64 %indvar.next22, 118
  br i1 %exitcond59, label %.preheader3.preheader, label %.preheader4

.preheader3.preheader:                            ; preds = %._crit_edge7
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.preheader, %._crit_edge10
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge10 ], [ 1, %.preheader3.preheader ]
  %indvar = phi i64 [ %indvar.next, %._crit_edge10 ], [ 0, %.preheader3.preheader ]
  %69 = add nuw nsw i64 %indvar, 1
  %70 = add nuw nsw i64 %indvar, 2
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %71 = add nsw i64 %indvars.iv63, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge9.us, %.preheader3
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge9.us ], [ 1, %.preheader3 ]
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge9.us ], [ 0, %.preheader3 ]
  %72 = add nuw nsw i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %69, i64 %72, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %69, i64 %72, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %72, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %70, i64 %72, i64 119
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %73 = add nsw i64 %indvars.iv60, -1
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
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next64, i64 %indvars.iv60, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv60, i64 %offset.idx
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %79 = fsub <2 x double> %wide.load, %78
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %71, i64 %indvars.iv60, i64 %offset.idx
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = fadd <2 x double> %wide.load11, %79
  %83 = fmul <2 x double> %82, <double 1.250000e-01, double 1.250000e-01>
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv.next61, i64 %offset.idx
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fsub <2 x double> %wide.load12, %78
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %73, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = fadd <2 x double> %86, %wide.load13
  %90 = fmul <2 x double> %89, <double 1.250000e-01, double 1.250000e-01>
  %91 = fadd <2 x double> %83, %90
  %92 = add nuw nsw i64 %offset.idx, 1
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv60, i64 %92
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fsub <2 x double> %wide.load14, %78
  %96 = add nsw i64 %offset.idx, -1
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv60, i64 %96
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !10
  %99 = fadd <2 x double> %95, %wide.load15
  %100 = fmul <2 x double> %99, <double 1.250000e-01, double 1.250000e-01>
  %101 = fadd <2 x double> %91, %100
  %102 = fadd <2 x double> %wide.load10, %101
  %103 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv63, i64 %indvars.iv60, i64 %offset.idx
  %104 = bitcast double* %103 to <2 x double>*
  store <2 x double> %102, <2 x double>* %104, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %105 = icmp eq i64 %index.next, 118
  br i1 %105, label %._crit_edge9.us.loopexit68, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next64, i64 %indvars.iv60, i64 %indvars.iv13
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv60, i64 %indvars.iv13
  %109 = load double, double* %108, align 8
  %110 = fmul double %109, 2.000000e+00
  %111 = fsub double %107, %110
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %71, i64 %indvars.iv60, i64 %indvars.iv13
  %113 = load double, double* %112, align 8
  %114 = fadd double %113, %111
  %115 = fmul double %114, 1.250000e-01
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv.next61, i64 %indvars.iv13
  %117 = load double, double* %116, align 8
  %118 = fsub double %117, %110
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %73, i64 %indvars.iv13
  %120 = load double, double* %119, align 8
  %121 = fadd double %118, %120
  %122 = fmul double %121, 1.250000e-01
  %123 = fadd double %115, %122
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv60, i64 %indvars.iv.next14
  %125 = load double, double* %124, align 8
  %126 = fsub double %125, %110
  %127 = add nsw i64 %indvars.iv13, -1
  %128 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv63, i64 %indvars.iv60, i64 %127
  %129 = load double, double* %128, align 8
  %130 = fadd double %126, %129
  %131 = fmul double %130, 1.250000e-01
  %132 = fadd double %123, %131
  %133 = fadd double %109, %132
  %134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv63, i64 %indvars.iv60, i64 %indvars.iv13
  store double %133, double* %134, align 8
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 119
  br i1 %exitcond15, label %._crit_edge9.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge9.us.loopexit:                         ; preds = %scalar.ph
  br label %._crit_edge9.us

._crit_edge9.us.loopexit68:                       ; preds = %vector.body
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit68, %._crit_edge9.us.loopexit
  %indvar.next2 = add nuw nsw i64 %indvar1, 1
  %exitcond62 = icmp eq i64 %indvar.next2, 118
  br i1 %exitcond62, label %._crit_edge10, label %.preheader.us

._crit_edge10:                                    ; preds = %._crit_edge9.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond65 = icmp eq i64 %indvar.next, 118
  br i1 %exitcond65, label %._crit_edge11, label %.preheader3

._crit_edge11:                                    ; preds = %._crit_edge10
  %135 = add nuw nsw i32 %.012, 1
  %exitcond16 = icmp eq i32 %135, 501
  br i1 %exitcond16, label %136, label %.preheader6

; <label>:136:                                    ; preds = %._crit_edge11
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
  br label %.preheader1

.preheader1:                                      ; preds = %21, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %21 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 120
  br label %.preheader

.preheader:                                       ; preds = %20, %.preheader1
  %indvars.iv1 = phi i64 [ 0, %.preheader1 ], [ %indvars.iv.next2, %20 ]
  %7 = add nuw nsw i64 %indvars.iv1, %6
  %8 = mul nuw nsw i64 %7, 120
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nuw nsw i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
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
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond3, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 120
  br i1 %exitcond6, label %22, label %.preheader1

; <label>:22:                                     ; preds = %21
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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

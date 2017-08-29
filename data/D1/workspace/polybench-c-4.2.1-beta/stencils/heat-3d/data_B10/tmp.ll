; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
.preheader3.lr.ph:
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.lr.ph, %._crit_edge6.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge6.us ], [ 0, %.preheader3.lr.ph ]
  %2 = trunc i64 %indvars.iv22 to i32
  %3 = add i32 %2, 120
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 120
  br i1 %exitcond25, label %._crit_edge8, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us.us ]
  %4 = trunc i64 %indvars.iv18 to i32
  %5 = add i32 %3, %4
  br label %6

._crit_edge.us.us:                                ; preds = %6
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, 120
  br i1 %exitcond21, label %._crit_edge6.us, label %.preheader.us.us

; <label>:6:                                      ; preds = %6, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next.1, %6 ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sub nuw nsw i32 %5, %7
  %9 = sitofp i32 %8 to double
  %10 = fmul double %9, 1.000000e+01
  %11 = fdiv double %10, 1.200000e+02
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  store double %11, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %15 = sub nuw nsw i32 %5, %14
  %16 = sitofp i32 %15 to double
  %17 = fmul double %16, 1.000000e+01
  %18 = fdiv double %17, 1.200000e+02
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv.next
  store double %18, double* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge.us.us, label %6

._crit_edge8:                                     ; preds = %._crit_edge6.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader8.preheader

.preheader8.preheader:                            ; preds = %2, %._crit_edge21
  %.0522 = phi i32 [ 1, %2 ], [ %137, %._crit_edge21 ]
  br label %.preheader6.lr.ph

.preheader6.lr.ph:                                ; preds = %.preheader8.preheader, %._crit_edge13
  %indvar21 = phi i64 [ 0, %.preheader8.preheader ], [ %indvar.next22, %._crit_edge13 ]
  %indvars.iv27 = phi i64 [ 1, %.preheader8.preheader ], [ %indvars.iv.next28, %._crit_edge13 ]
  %3 = add i64 %indvar21, 1
  %4 = add i64 %indvar21, 2
  %5 = add nuw nsw i64 %indvars.iv27, 1
  %6 = add nsw i64 %indvars.iv27, -1
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge.us, %.preheader6.lr.ph
  %indvar23 = phi i64 [ %indvar.next24, %._crit_edge.us ], [ 0, %.preheader6.lr.ph ]
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge.us ], [ 1, %.preheader6.lr.ph ]
  %7 = add i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %7, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %7, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar21, i64 %7, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %7, i64 119
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %8 = add nsw i64 %indvars.iv23, -1
  %bound033 = icmp ult double* %scevgep25, %scevgep31
  %bound134 = icmp ult double* %scevgep29, %scevgep27
  %memcheck.conflict36 = and i1 %bound033, %bound134
  br i1 %memcheck.conflict36, label %scalar.ph18.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %.preheader6.us
  br label %vector.body16

scalar.ph18.preheader:                            ; preds = %.preheader6.us
  br label %scalar.ph18

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index39 = phi i64 [ %index.next40, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx43 = or i64 %index39, 1
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv23, i64 %offset.idx43
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv27, i64 %indvars.iv23, i64 %offset.idx43
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %14 = fsub <2 x double> %wide.load47, %13
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %indvars.iv23, i64 %offset.idx43
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fadd <2 x double> %wide.load49, %14
  %18 = fmul <2 x double> %17, <double 1.250000e-01, double 1.250000e-01>
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv27, i64 %indvars.iv.next24, i64 %offset.idx43
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fsub <2 x double> %wide.load50, %13
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv27, i64 %8, i64 %offset.idx43
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fadd <2 x double> %21, %wide.load51
  %25 = fmul <2 x double> %24, <double 1.250000e-01, double 1.250000e-01>
  %26 = fadd <2 x double> %18, %25
  %27 = add nuw nsw i64 %offset.idx43, 1
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv27, i64 %indvars.iv23, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fsub <2 x double> %wide.load52, %13
  %31 = add nsw i64 %offset.idx43, -1
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv27, i64 %indvars.iv23, i64 %31
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fadd <2 x double> %30, %wide.load53
  %35 = fmul <2 x double> %34, <double 1.250000e-01, double 1.250000e-01>
  %36 = fadd <2 x double> %26, %35
  %37 = fadd <2 x double> %wide.load48, %36
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv27, i64 %indvars.iv23, i64 %offset.idx43
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> %37, <2 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add i64 %index39, 2
  %40 = icmp eq i64 %index.next40, 118
  br i1 %40, label %._crit_edge.us.loopexit55, label %vector.body16, !llvm.loop !6

scalar.ph18:                                      ; preds = %scalar.ph18.preheader, %scalar.ph18
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph18 ], [ 1, %scalar.ph18.preheader ]
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %indvars.iv23, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, 2.000000e+00
  %46 = fsub double %42, %45
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %indvars.iv23, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = fadd double %48, %46
  %50 = fmul double %49, 1.250000e-01
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv27, i64 %indvars.iv.next24, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fsub double %52, %45
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv27, i64 %8, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  %57 = fmul double %56, 1.250000e-01
  %58 = fadd double %50, %57
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv.next
  %60 = load double, double* %59, align 8
  %61 = fsub double %60, %45
  %62 = add nsw i64 %indvars.iv, -1
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv27, i64 %indvars.iv23, i64 %62
  %64 = load double, double* %63, align 8
  %65 = fadd double %61, %64
  %66 = fmul double %65, 1.250000e-01
  %67 = fadd double %58, %66
  %68 = fadd double %44, %67
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  store double %68, double* %69, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph18, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph18
  br label %._crit_edge.us

._crit_edge.us.loopexit55:                        ; preds = %vector.body16
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit55, %._crit_edge.us.loopexit
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 119
  %indvar.next24 = add i64 %indvar23, 1
  br i1 %exitcond26, label %._crit_edge13, label %.preheader6.us

._crit_edge13:                                    ; preds = %._crit_edge.us
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 119
  %indvar.next22 = add i64 %indvar21, 1
  br i1 %exitcond30, label %.preheader.lr.ph.preheader, label %.preheader6.lr.ph

.preheader.lr.ph.preheader:                       ; preds = %._crit_edge13
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge19
  %indvar = phi i64 [ %indvar.next, %._crit_edge19 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge19 ], [ 1, %.preheader.lr.ph.preheader ]
  %70 = add i64 %indvar, 1
  %71 = add i64 %indvar, 2
  %72 = add nuw nsw i64 %indvars.iv39, 1
  %73 = add nsw i64 %indvars.iv39, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge17.us, %.preheader.lr.ph
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge17.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge17.us ], [ 1, %.preheader.lr.ph ]
  %74 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %70, i64 %74, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %70, i64 %74, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %74, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %71, i64 %74, i64 119
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %75 = add nsw i64 %indvars.iv35, -1
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
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %72, i64 %indvars.iv35, i64 %offset.idx
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %offset.idx
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %81 = fsub <2 x double> %wide.load, %80
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %73, i64 %indvars.iv35, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = fadd <2 x double> %wide.load11, %81
  %85 = fmul <2 x double> %84, <double 1.250000e-01, double 1.250000e-01>
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv.next36, i64 %offset.idx
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !10
  %88 = fsub <2 x double> %wide.load12, %80
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %75, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fadd <2 x double> %88, %wide.load13
  %92 = fmul <2 x double> %91, <double 1.250000e-01, double 1.250000e-01>
  %93 = fadd <2 x double> %85, %92
  %94 = add nuw nsw i64 %offset.idx, 1
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %94
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = fsub <2 x double> %wide.load14, %80
  %98 = add nsw i64 %offset.idx, -1
  %99 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %98
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = fadd <2 x double> %97, %wide.load15
  %102 = fmul <2 x double> %101, <double 1.250000e-01, double 1.250000e-01>
  %103 = fadd <2 x double> %93, %102
  %104 = fadd <2 x double> %wide.load10, %103
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv39, i64 %indvars.iv35, i64 %offset.idx
  %106 = bitcast double* %105 to <2 x double>*
  store <2 x double> %104, <2 x double>* %106, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %107 = icmp eq i64 %index.next, 118
  br i1 %107, label %._crit_edge17.us.loopexit54, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %72, i64 %indvars.iv35, i64 %indvars.iv31
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv31
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, 2.000000e+00
  %113 = fsub double %109, %112
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %73, i64 %indvars.iv35, i64 %indvars.iv31
  %115 = load double, double* %114, align 8
  %116 = fadd double %115, %113
  %117 = fmul double %116, 1.250000e-01
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv.next36, i64 %indvars.iv31
  %119 = load double, double* %118, align 8
  %120 = fsub double %119, %112
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %75, i64 %indvars.iv31
  %122 = load double, double* %121, align 8
  %123 = fadd double %120, %122
  %124 = fmul double %123, 1.250000e-01
  %125 = fadd double %117, %124
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %126 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv.next32
  %127 = load double, double* %126, align 8
  %128 = fsub double %127, %112
  %129 = add nsw i64 %indvars.iv31, -1
  %130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %129
  %131 = load double, double* %130, align 8
  %132 = fadd double %128, %131
  %133 = fmul double %132, 1.250000e-01
  %134 = fadd double %125, %133
  %135 = fadd double %111, %134
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv31
  store double %135, double* %136, align 8
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 119
  br i1 %exitcond34, label %._crit_edge17.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge17.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge17.us

._crit_edge17.us.loopexit54:                      ; preds = %vector.body
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit54, %._crit_edge17.us.loopexit
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 119
  %indvar.next2 = add i64 %indvar1, 1
  br i1 %exitcond38, label %._crit_edge19, label %.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge17.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond42, label %._crit_edge21, label %.preheader.lr.ph

._crit_edge21:                                    ; preds = %._crit_edge19
  %137 = add nuw nsw i32 %.0522, 1
  %exitcond43 = icmp eq i32 %137, 501
  br i1 %exitcond43, label %138, label %.preheader8.preheader

; <label>:138:                                    ; preds = %._crit_edge21
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
.preheader3.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.lr.ph, %._crit_edge6.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge6.us ], [ 0, %.preheader3.lr.ph ]
  %5 = mul nsw i64 %indvars.iv22, 120
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 120
  br i1 %exitcond25, label %._crit_edge8, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us.us ]
  %6 = add i64 %indvars.iv18, %5
  %sext = mul i64 %6, 515396075520
  %7 = lshr exact i64 %sext, 32
  br label %8

._crit_edge.us.us:                                ; preds = %15
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, 120
  br i1 %exitcond21, label %._crit_edge6.us, label %.preheader.us.us

; <label>:8:                                      ; preds = %15, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.preheader.us.us ]
  %9 = add i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %8

._crit_edge8:                                     ; preds = %._crit_edge6.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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

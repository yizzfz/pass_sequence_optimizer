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
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
.preheader19.lr.ph:
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader19.lr.ph, %._crit_edge23.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge23.us ], [ 0, %.preheader19.lr.ph ]
  %3 = trunc i64 %indvars.iv40 to i32
  %4 = add i32 %3, 120
  br label %.preheader.us.us

._crit_edge23.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 120
  br i1 %exitcond43, label %._crit_edge26, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next38, %._crit_edge.us.us ]
  %5 = trunc i64 %indvars.iv37 to i32
  %6 = add i32 %4, %5
  br label %.preheader.us.us.new

._crit_edge.us.us:                                ; preds = %.preheader.us.us.new
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, 120
  br i1 %exitcond, label %._crit_edge23.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ 0, %.preheader.us.us ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sub i32 %6, %7
  %9 = sitofp i32 %8 to double
  %10 = fmul double %9, 1.000000e+01
  %11 = fdiv double %10, 1.200000e+02
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv40, i64 %indvars.iv37, i64 %indvars.iv
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv40, i64 %indvars.iv37, i64 %indvars.iv
  store double %11, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %15 = sub i32 %6, %14
  %16 = sitofp i32 %15 to double
  %17 = fmul double %16, 1.000000e+01
  %18 = fdiv double %17, 1.200000e+02
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv40, i64 %indvars.iv37, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv40, i64 %indvars.iv37, i64 %indvars.iv.next
  store double %18, double* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.preheader.us.us.new

._crit_edge26:                                    ; preds = %._crit_edge23.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader110

.preheader110:                                    ; preds = %._crit_edge121, %3
  %storemerge122 = phi i32 [ 1, %3 ], [ %138, %._crit_edge121 ]
  br label %.preheader108

.preheader108:                                    ; preds = %.preheader110, %._crit_edge113
  %indvar21 = phi i64 [ 0, %.preheader110 ], [ %indvar.next22, %._crit_edge113 ]
  %indvars.iv127 = phi i64 [ 1, %.preheader110 ], [ %indvars.iv.next128, %._crit_edge113 ]
  %4 = add i64 %indvar21, 1
  %5 = add i64 %indvar21, 2
  %6 = add nuw nsw i64 %indvars.iv127, 1
  %7 = add nsw i64 %indvars.iv127, -1
  br label %.preheader106.us

.preheader106.us:                                 ; preds = %._crit_edge.us, %.preheader108
  %indvar23 = phi i64 [ %indvar.next24, %._crit_edge.us ], [ 0, %.preheader108 ]
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %._crit_edge.us ], [ 1, %.preheader108 ]
  %8 = add i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %4, i64 %8, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %4, i64 %8, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar21, i64 %8, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %8, i64 119
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %9 = add nsw i64 %indvars.iv123, -1
  %bound033 = icmp ult double* %scevgep25, %scevgep31
  %bound134 = icmp ult double* %scevgep29, %scevgep27
  %memcheck.conflict36 = and i1 %bound033, %bound134
  br i1 %memcheck.conflict36, label %scalar.ph18.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %.preheader106.us
  br label %vector.body16

scalar.ph18.preheader:                            ; preds = %.preheader106.us
  br label %scalar.ph18

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index39 = phi i64 [ %index.next40, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx43 = or i64 %index39, 1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %6, i64 %indvars.iv123, i64 %offset.idx43
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv123, i64 %offset.idx43
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %15 = fsub <2 x double> %wide.load47, %14
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %7, i64 %indvars.iv123, i64 %offset.idx43
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %wide.load49, %15
  %19 = fmul <2 x double> %18, <double 1.250000e-01, double 1.250000e-01>
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv.next124, i64 %offset.idx43
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fsub <2 x double> %wide.load50, %14
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %9, i64 %offset.idx43
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %22, %wide.load51
  %26 = fmul <2 x double> %25, <double 1.250000e-01, double 1.250000e-01>
  %27 = fadd <2 x double> %19, %26
  %28 = add nuw nsw i64 %offset.idx43, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv123, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fsub <2 x double> %wide.load52, %14
  %32 = add nsw i64 %offset.idx43, -1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv123, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %31, %wide.load53
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %27, %36
  %38 = fadd <2 x double> %wide.load48, %37
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %offset.idx43
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add i64 %index39, 2
  %41 = icmp eq i64 %index.next40, 118
  br i1 %41, label %._crit_edge.us.loopexit55, label %vector.body16, !llvm.loop !6

scalar.ph18:                                      ; preds = %scalar.ph18.preheader, %scalar.ph18
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph18 ], [ 1, %scalar.ph18.preheader ]
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %6, i64 %indvars.iv123, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv123, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, 2.000000e+00
  %47 = fsub double %43, %46
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %7, i64 %indvars.iv123, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  %51 = fmul double %50, 1.250000e-01
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv.next124, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %46
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %9, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  %58 = fmul double %57, 1.250000e-01
  %59 = fadd double %51, %58
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv123, i64 %indvars.iv.next
  %61 = load double, double* %60, align 8
  %62 = fsub double %61, %46
  %63 = add nsw i64 %indvars.iv, -1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv127, i64 %indvars.iv123, i64 %63
  %65 = load double, double* %64, align 8
  %66 = fadd double %62, %65
  %67 = fmul double %66, 1.250000e-01
  %68 = fadd double %59, %67
  %69 = fadd double %45, %68
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv127, i64 %indvars.iv123, i64 %indvars.iv
  store double %69, double* %70, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph18, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph18
  br label %._crit_edge.us

._crit_edge.us.loopexit55:                        ; preds = %vector.body16
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit55, %._crit_edge.us.loopexit
  %exitcond126 = icmp eq i64 %indvars.iv.next124, 119
  %indvar.next24 = add i64 %indvar23, 1
  br i1 %exitcond126, label %._crit_edge113, label %.preheader106.us

._crit_edge113:                                   ; preds = %._crit_edge.us
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next128, 119
  %indvar.next22 = add i64 %indvar21, 1
  br i1 %exitcond130, label %.preheader.lr.ph.preheader, label %.preheader108

.preheader.lr.ph.preheader:                       ; preds = %._crit_edge113
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge119
  %indvar = phi i64 [ %indvar.next, %._crit_edge119 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %._crit_edge119 ], [ 1, %.preheader.lr.ph.preheader ]
  %71 = add i64 %indvar, 1
  %72 = add i64 %indvar, 2
  %73 = add nuw nsw i64 %indvars.iv139, 1
  %74 = add nsw i64 %indvars.iv139, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge117.us, %.preheader.lr.ph
  %indvar1 = phi i64 [ %indvar.next2, %._crit_edge117.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %._crit_edge117.us ], [ 1, %.preheader.lr.ph ]
  %75 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %71, i64 %75, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %71, i64 %75, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %75, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %72, i64 %75, i64 119
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %76 = add nsw i64 %indvars.iv135, -1
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
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %73, i64 %indvars.iv135, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %82 = fsub <2 x double> %wide.load, %81
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %74, i64 %indvars.iv135, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = fadd <2 x double> %wide.load11, %82
  %86 = fmul <2 x double> %85, <double 1.250000e-01, double 1.250000e-01>
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv.next136, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = fsub <2 x double> %wide.load12, %81
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %76, i64 %offset.idx
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = fadd <2 x double> %89, %wide.load13
  %93 = fmul <2 x double> %92, <double 1.250000e-01, double 1.250000e-01>
  %94 = fadd <2 x double> %86, %93
  %95 = add nuw nsw i64 %offset.idx, 1
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %95
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fsub <2 x double> %wide.load14, %81
  %99 = add nsw i64 %offset.idx, -1
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %99
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fadd <2 x double> %98, %wide.load15
  %103 = fmul <2 x double> %102, <double 1.250000e-01, double 1.250000e-01>
  %104 = fadd <2 x double> %94, %103
  %105 = fadd <2 x double> %wide.load10, %104
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv139, i64 %indvars.iv135, i64 %offset.idx
  %107 = bitcast double* %106 to <2 x double>*
  store <2 x double> %105, <2 x double>* %107, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %108 = icmp eq i64 %index.next, 118
  br i1 %108, label %._crit_edge117.us.loopexit54, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %109 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %73, i64 %indvars.iv135, i64 %indvars.iv131
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %indvars.iv131
  %112 = load double, double* %111, align 8
  %113 = fmul double %112, 2.000000e+00
  %114 = fsub double %110, %113
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %74, i64 %indvars.iv135, i64 %indvars.iv131
  %116 = load double, double* %115, align 8
  %117 = fadd double %116, %114
  %118 = fmul double %117, 1.250000e-01
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv.next136, i64 %indvars.iv131
  %120 = load double, double* %119, align 8
  %121 = fsub double %120, %113
  %122 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %76, i64 %indvars.iv131
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  %125 = fmul double %124, 1.250000e-01
  %126 = fadd double %118, %125
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %indvars.iv.next132
  %128 = load double, double* %127, align 8
  %129 = fsub double %128, %113
  %130 = add nsw i64 %indvars.iv131, -1
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv139, i64 %indvars.iv135, i64 %130
  %132 = load double, double* %131, align 8
  %133 = fadd double %129, %132
  %134 = fmul double %133, 1.250000e-01
  %135 = fadd double %126, %134
  %136 = fadd double %112, %135
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv139, i64 %indvars.iv135, i64 %indvars.iv131
  store double %136, double* %137, align 8
  %exitcond134 = icmp eq i64 %indvars.iv.next132, 119
  br i1 %exitcond134, label %._crit_edge117.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge117.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge117.us

._crit_edge117.us.loopexit54:                     ; preds = %vector.body
  br label %._crit_edge117.us

._crit_edge117.us:                                ; preds = %._crit_edge117.us.loopexit54, %._crit_edge117.us.loopexit
  %exitcond138 = icmp eq i64 %indvars.iv.next136, 119
  %indvar.next2 = add i64 %indvar1, 1
  br i1 %exitcond138, label %._crit_edge119, label %.preheader.us

._crit_edge119:                                   ; preds = %._crit_edge117.us
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next140, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond142, label %._crit_edge121, label %.preheader.lr.ph

._crit_edge121:                                   ; preds = %._crit_edge119
  %138 = add nuw nsw i32 %storemerge122, 1
  %exitcond143 = icmp eq i32 %138, 501
  br i1 %exitcond143, label %139, label %.preheader110

; <label>:139:                                    ; preds = %._crit_edge121
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
.preheader15.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader15.lr.ph, %._crit_edge19.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge19.us ], [ 0, %.preheader15.lr.ph ]
  %6 = mul nsw i64 %indvars.iv37, 120
  br label %.preheader.us.us

._crit_edge19.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 120
  br i1 %exitcond40, label %._crit_edge22, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next34, %._crit_edge.us.us ]
  %7 = add i64 %indvars.iv33, %6
  %8 = mul i64 %7, 120
  br label %9

._crit_edge.us.us:                                ; preds = %16
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 120
  br i1 %exitcond36, label %._crit_edge19.us, label %.preheader.us.us

; <label>:9:                                      ; preds = %16, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %16 ], [ 0, %.preheader.us.us ]
  %10 = add i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %9

._crit_edge22:                                    ; preds = %._crit_edge19.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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

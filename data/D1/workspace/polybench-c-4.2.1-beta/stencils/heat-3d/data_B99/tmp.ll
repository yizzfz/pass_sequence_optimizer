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

.preheader1:                                      ; preds = %2, %28
  %3 = phi i32 [ 0, %2 ], [ %29, %28 ]
  %4 = add nuw i32 %3, 120
  %5 = sext i32 %3 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader1, %25
  %6 = phi i32 [ 0, %.preheader1 ], [ %26, %25 ]
  %7 = add nuw i32 %4, %6
  %8 = sext i32 %6 to i64
  %9 = sext i32 %7 to i64
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %10 ]
  %11 = sub nuw nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fmul double %13, 1.000000e+01
  %15 = fdiv double %14, 1.200000e+02
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %8, i64 %indvars.iv
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv
  store double %15, double* %17, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %18 = sub nuw nsw i64 %9, %indvars.iv.next
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = fmul double %20, 1.000000e+01
  %22 = fdiv double %21, 1.200000e+02
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %8, i64 %indvars.iv.next
  store double %22, double* %23, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv.next
  store double %22, double* %24, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %25, label %10

; <label>:25:                                     ; preds = %10
  %26 = add nsw i32 %6, 1
  %27 = icmp slt i32 %26, 120
  br i1 %27, label %.preheader, label %28

; <label>:28:                                     ; preds = %25
  %29 = add nsw i32 %3, 1
  %30 = icmp slt i32 %29, 120
  br i1 %30, label %.preheader1, label %31

; <label>:31:                                     ; preds = %28
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge11, %2
  %.012 = phi i32 [ 1, %2 ], [ %157, %._crit_edge11 ]
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader6, %._crit_edge7
  %indvar21 = phi i64 [ 0, %.preheader6 ], [ %4, %._crit_edge7 ]
  %3 = phi i32 [ 1, %.preheader6 ], [ %6, %._crit_edge7 ]
  %4 = add i64 %indvar21, 1
  %5 = add i64 %indvar21, 2
  %6 = add nsw i32 %3, 1
  %7 = sext i32 %6 to i64
  %8 = sext i32 %3 to i64
  %9 = add nsw i32 %3, -1
  %10 = sext i32 %9 to i64
  br label %vector.memcheck37

vector.memcheck37:                                ; preds = %._crit_edge.us, %.preheader4
  %indvar23 = phi i64 [ %12, %._crit_edge.us ], [ 0, %.preheader4 ]
  %11 = phi i32 [ %14, %._crit_edge.us ], [ 1, %.preheader4 ]
  %12 = add i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %12, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %12, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar21, i64 %12, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %12, i64 119
  %13 = sext i32 %11 to i64
  %14 = add nsw i32 %11, 1
  %15 = sext i32 %14 to i64
  %16 = add nsw i32 %11, -1
  %17 = sext i32 %16 to i64
  %bound033 = icmp ult double* %scevgep25, %scevgep31
  %bound134 = icmp ult double* %scevgep29, %scevgep27
  %found.conflict35 = and i1 %bound033, %bound134
  br i1 %found.conflict35, label %scalar.ph18.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %vector.memcheck37
  br label %vector.body16

scalar.ph18.preheader:                            ; preds = %vector.memcheck37
  br label %scalar.ph18

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index39 = phi i64 [ %index.next40, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx43 = or i64 %index39, 1
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %13, i64 %offset.idx43
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %offset.idx43
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %23 = fsub <2 x double> %wide.load47, %22
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %10, i64 %13, i64 %offset.idx43
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fadd <2 x double> %wide.load49, %23
  %27 = fmul <2 x double> %26, <double 1.250000e-01, double 1.250000e-01>
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %15, i64 %offset.idx43
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fsub <2 x double> %wide.load50, %22
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %17, i64 %offset.idx43
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = fadd <2 x double> %30, %wide.load51
  %34 = fmul <2 x double> %33, <double 1.250000e-01, double 1.250000e-01>
  %35 = fadd <2 x double> %27, %34
  %36 = add nuw nsw i64 %offset.idx43, 1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = fsub <2 x double> %wide.load52, %22
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %index39
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !1
  %42 = fadd <2 x double> %39, %wide.load53
  %43 = fmul <2 x double> %42, <double 1.250000e-01, double 1.250000e-01>
  %44 = fadd <2 x double> %35, %43
  %45 = fadd <2 x double> %wide.load48, %44
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %8, i64 %13, i64 %offset.idx43
  %47 = bitcast double* %46 to <2 x double>*
  store <2 x double> %45, <2 x double>* %47, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add i64 %index39, 2
  %48 = icmp eq i64 %index.next40, 118
  br i1 %48, label %._crit_edge.us.loopexit55, label %vector.body16, !llvm.loop !6

scalar.ph18:                                      ; preds = %scalar.ph18.preheader, %scalar.ph18
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph18 ], [ 1, %scalar.ph18.preheader ]
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %13, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, 2.000000e+00
  %54 = fsub double %50, %53
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %10, i64 %13, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fadd double %56, %54
  %58 = fmul double %57, 1.250000e-01
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %15, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = fsub double %60, %53
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %17, i64 %indvars.iv
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = fmul double %64, 1.250000e-01
  %66 = fadd double %58, %65
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %indvars.iv.next
  %68 = load double, double* %67, align 8
  %69 = fsub double %68, %53
  %70 = add nsw i64 %indvars.iv, -1
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %13, i64 %70
  %72 = load double, double* %71, align 8
  %73 = fadd double %69, %72
  %74 = fmul double %73, 1.250000e-01
  %75 = fadd double %66, %74
  %76 = fadd double %52, %75
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %8, i64 %13, i64 %indvars.iv
  store double %76, double* %77, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph18, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph18
  br label %._crit_edge.us

._crit_edge.us.loopexit55:                        ; preds = %vector.body16
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit55, %._crit_edge.us.loopexit
  %78 = icmp slt i32 %14, 119
  br i1 %78, label %vector.memcheck37, label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge.us
  %79 = icmp slt i32 %6, 119
  br i1 %79, label %.preheader4, label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %._crit_edge7
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.preheader, %._crit_edge10
  %indvar = phi i64 [ %81, %._crit_edge10 ], [ 0, %.preheader3.preheader ]
  %80 = phi i32 [ %83, %._crit_edge10 ], [ 1, %.preheader3.preheader ]
  %81 = add i64 %indvar, 1
  %82 = add i64 %indvar, 2
  %83 = add nsw i32 %80, 1
  %84 = sext i32 %83 to i64
  %85 = sext i32 %80 to i64
  %86 = add nsw i32 %80, -1
  %87 = sext i32 %86 to i64
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %._crit_edge9.us, %.preheader3
  %indvar1 = phi i64 [ %89, %._crit_edge9.us ], [ 0, %.preheader3 ]
  %88 = phi i32 [ %91, %._crit_edge9.us ], [ 1, %.preheader3 ]
  %89 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %81, i64 %89, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %81, i64 %89, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %89, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %82, i64 %89, i64 119
  %90 = sext i32 %88 to i64
  %91 = add nsw i32 %88, 1
  %92 = sext i32 %91 to i64
  %93 = add nsw i32 %88, -1
  %94 = sext i32 %93 to i64
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

scalar.ph.preheader:                              ; preds = %vector.memcheck
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %90, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %90, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !10
  %99 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %100 = fsub <2 x double> %wide.load, %99
  %101 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %90, i64 %offset.idx
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !10
  %103 = fadd <2 x double> %wide.load11, %100
  %104 = fmul <2 x double> %103, <double 1.250000e-01, double 1.250000e-01>
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %92, i64 %offset.idx
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !10
  %107 = fsub <2 x double> %wide.load12, %99
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %94, i64 %offset.idx
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !10
  %110 = fadd <2 x double> %107, %wide.load13
  %111 = fmul <2 x double> %110, <double 1.250000e-01, double 1.250000e-01>
  %112 = fadd <2 x double> %104, %111
  %113 = add nuw nsw i64 %offset.idx, 1
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %90, i64 %113
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !10
  %116 = fsub <2 x double> %wide.load14, %99
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %90, i64 %index
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !10
  %119 = fadd <2 x double> %116, %wide.load15
  %120 = fmul <2 x double> %119, <double 1.250000e-01, double 1.250000e-01>
  %121 = fadd <2 x double> %112, %120
  %122 = fadd <2 x double> %wide.load10, %121
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %85, i64 %90, i64 %offset.idx
  %124 = bitcast double* %123 to <2 x double>*
  store <2 x double> %122, <2 x double>* %124, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %125 = icmp eq i64 %index.next, 118
  br i1 %125, label %._crit_edge9.us.loopexit54, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %126 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %90, i64 %indvars.iv13
  %127 = load double, double* %126, align 8
  %128 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %90, i64 %indvars.iv13
  %129 = load double, double* %128, align 8
  %130 = fmul double %129, 2.000000e+00
  %131 = fsub double %127, %130
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %90, i64 %indvars.iv13
  %133 = load double, double* %132, align 8
  %134 = fadd double %133, %131
  %135 = fmul double %134, 1.250000e-01
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %92, i64 %indvars.iv13
  %137 = load double, double* %136, align 8
  %138 = fsub double %137, %130
  %139 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %94, i64 %indvars.iv13
  %140 = load double, double* %139, align 8
  %141 = fadd double %138, %140
  %142 = fmul double %141, 1.250000e-01
  %143 = fadd double %135, %142
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %144 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %90, i64 %indvars.iv.next14
  %145 = load double, double* %144, align 8
  %146 = fsub double %145, %130
  %147 = add nsw i64 %indvars.iv13, -1
  %148 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %90, i64 %147
  %149 = load double, double* %148, align 8
  %150 = fadd double %146, %149
  %151 = fmul double %150, 1.250000e-01
  %152 = fadd double %143, %151
  %153 = fadd double %129, %152
  %154 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %85, i64 %90, i64 %indvars.iv13
  store double %153, double* %154, align 8
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 119
  br i1 %exitcond15, label %._crit_edge9.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge9.us.loopexit:                         ; preds = %scalar.ph
  br label %._crit_edge9.us

._crit_edge9.us.loopexit54:                       ; preds = %vector.body
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit54, %._crit_edge9.us.loopexit
  %155 = icmp slt i32 %91, 119
  br i1 %155, label %vector.memcheck, label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge9.us
  %156 = icmp slt i32 %83, 119
  br i1 %156, label %.preheader3, label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge10
  %157 = add nuw nsw i32 %.012, 1
  %exitcond16 = icmp eq i32 %157, 501
  br i1 %exitcond16, label %158, label %.preheader6

; <label>:158:                                    ; preds = %._crit_edge11
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

.preheader1:                                      ; preds = %1, %28
  %6 = phi i32 [ 0, %1 ], [ %29, %28 ]
  %7 = mul nuw nsw i32 %6, 120
  %8 = sext i32 %6 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader1, %25
  %9 = phi i32 [ 0, %.preheader1 ], [ %26, %25 ]
  %10 = add nuw i32 %9, %7
  %11 = mul nuw nsw i32 %10, 120
  %12 = sext i32 %9 to i64
  %13 = zext i32 %11 to i64
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %15 = add i64 %indvars.iv, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %12, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %25, label %14

; <label>:25:                                     ; preds = %._crit_edge
  %26 = add nsw i32 %9, 1
  %27 = icmp slt i32 %26, 120
  br i1 %27, label %.preheader, label %28

; <label>:28:                                     ; preds = %25
  %29 = add nsw i32 %6, 1
  %30 = icmp slt i32 %29, 120
  br i1 %30, label %.preheader1, label %31

; <label>:31:                                     ; preds = %28
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %34) #5
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

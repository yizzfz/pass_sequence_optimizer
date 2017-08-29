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
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
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
  tail call fastcc void @print_array([120 x [120 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader23

.preheader23:                                     ; preds = %2, %28
  %.02226 = phi i32 [ 0, %2 ], [ %29, %28 ]
  %3 = add nuw i32 %.02226, 120
  %4 = sext i32 %.02226 to i64
  %5 = sext i32 %.02226 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader23, %25
  %.02125 = phi i32 [ 0, %.preheader23 ], [ %26, %25 ]
  %6 = add nuw i32 %3, %.02125
  %7 = sext i32 %.02125 to i64
  %8 = sext i32 %.02125 to i64
  %9 = sext i32 %6 to i64
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %10 ]
  %11 = sub nuw nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fmul double %13, 1.000000e+01
  %15 = fdiv double %14, 1.200000e+02
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %7, i64 %indvars.iv
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv
  store double %15, double* %17, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %18 = sub nuw nsw i64 %9, %indvars.iv.next
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = fmul double %20, 1.000000e+01
  %22 = fdiv double %21, 1.200000e+02
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %7, i64 %indvars.iv.next
  store double %22, double* %23, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv.next
  store double %22, double* %24, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %25, label %10

; <label>:25:                                     ; preds = %10
  %26 = add nsw i32 %.02125, 1
  %27 = icmp slt i32 %26, 120
  br i1 %27, label %.preheader, label %28

; <label>:28:                                     ; preds = %25
  %29 = add nsw i32 %.02226, 1
  %30 = icmp slt i32 %29, 120
  br i1 %30, label %.preheader23, label %31

; <label>:31:                                     ; preds = %28
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge20, %2
  %.011121 = phi i32 [ 1, %2 ], [ %223, %._crit_edge20 ]
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader5, %._crit_edge9
  %indvar24 = phi i64 [ 0, %.preheader5 ], [ %indvar.next25, %._crit_edge9 ]
  %.010910 = phi i32 [ 1, %.preheader5 ], [ %111, %._crit_edge9 ]
  %3 = add i64 %indvar24, 1
  %4 = add i64 %indvar24, 2
  %5 = add nuw nsw i32 %.010910, 1
  %6 = sext i32 %5 to i64
  %7 = sext i32 %.010910 to i64
  %8 = add nsw i32 %.010910, -1
  %9 = sext i32 %8 to i64
  %10 = sext i32 %.010910 to i64
  %11 = sext i32 %.010910 to i64
  %12 = sext i32 %.010910 to i64
  %13 = sext i32 %.010910 to i64
  %14 = sext i32 %.010910 to i64
  %15 = sext i32 %.010910 to i64
  %16 = sext i32 %.010910 to i64
  %17 = sext i32 %.010910 to i64
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader3, %._crit_edge
  %indvar26 = phi i64 [ 0, %.preheader3 ], [ %indvar.next27, %._crit_edge ]
  %.01077 = phi i32 [ 1, %.preheader3 ], [ %109, %._crit_edge ]
  %18 = add i64 %indvar26, 1
  %scevgep28 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %18, i64 1
  %scevgep30 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %3, i64 %18, i64 119
  %scevgep32 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvar24, i64 %18, i64 1
  %scevgep34 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %18, i64 119
  %19 = sext i32 %.01077 to i64
  %20 = sext i32 %.01077 to i64
  %21 = sext i32 %.01077 to i64
  %22 = add nuw nsw i32 %.01077, 1
  %23 = sext i32 %22 to i64
  %24 = sext i32 %.01077 to i64
  %25 = add nsw i32 %.01077, -1
  %26 = sext i32 %25 to i64
  %27 = sext i32 %.01077 to i64
  %28 = sext i32 %.01077 to i64
  %29 = sext i32 %.01077 to i64
  %30 = sext i32 %.01077 to i64
  %31 = sext i32 %.01077 to i64
  %bound036 = icmp ult double* %scevgep28, %scevgep34
  %bound137 = icmp ult double* %scevgep32, %scevgep30
  %memcheck.conflict39 = and i1 %bound036, %bound137
  br i1 %memcheck.conflict39, label %scalar.ph21.preheader, label %vector.body19.preheader

vector.body19.preheader:                          ; preds = %.preheader1
  br label %vector.body19

scalar.ph21.preheader:                            ; preds = %.preheader1
  br label %scalar.ph21

vector.body19:                                    ; preds = %vector.body19.preheader, %vector.body19
  %index42 = phi i64 [ %index.next43, %vector.body19 ], [ 0, %vector.body19.preheader ]
  %offset.idx46 = or i64 %index42, 1
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %19, i64 %offset.idx46
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %20, i64 %offset.idx46
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = fmul <2 x double> %wide.load51, <double 2.000000e+00, double 2.000000e+00>
  %37 = fsub <2 x double> %wide.load50, %36
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %9, i64 %21, i64 %offset.idx46
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !1
  %40 = fadd <2 x double> %wide.load52, %37
  %41 = fmul <2 x double> %40, <double 1.250000e-01, double 1.250000e-01>
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %10, i64 %23, i64 %offset.idx46
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !1
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %11, i64 %24, i64 %offset.idx46
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !1
  %46 = fmul <2 x double> %wide.load54, <double 2.000000e+00, double 2.000000e+00>
  %47 = fsub <2 x double> %wide.load53, %46
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %12, i64 %26, i64 %offset.idx46
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !1
  %50 = fadd <2 x double> %wide.load55, %47
  %51 = fmul <2 x double> %50, <double 1.250000e-01, double 1.250000e-01>
  %52 = fadd <2 x double> %41, %51
  %53 = add nuw nsw i64 %offset.idx46, 1
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %13, i64 %27, i64 %53
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !1
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %14, i64 %28, i64 %offset.idx46
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !1
  %58 = fmul <2 x double> %wide.load57, <double 2.000000e+00, double 2.000000e+00>
  %59 = fsub <2 x double> %wide.load56, %58
  %60 = add nsw i64 %offset.idx46, -1
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %15, i64 %29, i64 %60
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !1
  %63 = fadd <2 x double> %wide.load58, %59
  %64 = fmul <2 x double> %63, <double 1.250000e-01, double 1.250000e-01>
  %65 = fadd <2 x double> %52, %64
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %16, i64 %30, i64 %offset.idx46
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !1
  %68 = fadd <2 x double> %wide.load59, %65
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %17, i64 %31, i64 %offset.idx46
  %70 = bitcast double* %69 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !alias.scope !4, !noalias !1
  %index.next43 = add i64 %index42, 2
  %71 = icmp eq i64 %index.next43, 118
  br i1 %71, label %._crit_edge.loopexit61, label %vector.body19, !llvm.loop !6

scalar.ph21:                                      ; preds = %scalar.ph21.preheader, %scalar.ph21
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph21 ], [ 1, %scalar.ph21.preheader ]
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %19, i64 %indvars.iv
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %20, i64 %indvars.iv
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, 2.000000e+00
  %77 = fsub double %73, %76
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %9, i64 %21, i64 %indvars.iv
  %79 = load double, double* %78, align 8
  %80 = fadd double %79, %77
  %81 = fmul double %80, 1.250000e-01
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %10, i64 %23, i64 %indvars.iv
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %11, i64 %24, i64 %indvars.iv
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, 2.000000e+00
  %87 = fsub double %83, %86
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %12, i64 %26, i64 %indvars.iv
  %89 = load double, double* %88, align 8
  %90 = fadd double %89, %87
  %91 = fmul double %90, 1.250000e-01
  %92 = fadd double %81, %91
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %13, i64 %27, i64 %indvars.iv.next
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %14, i64 %28, i64 %indvars.iv
  %96 = load double, double* %95, align 8
  %97 = fmul double %96, 2.000000e+00
  %98 = fsub double %94, %97
  %99 = add nsw i64 %indvars.iv, -1
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %15, i64 %29, i64 %99
  %101 = load double, double* %100, align 8
  %102 = fadd double %101, %98
  %103 = fmul double %102, 1.250000e-01
  %104 = fadd double %92, %103
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %16, i64 %30, i64 %indvars.iv
  %106 = load double, double* %105, align 8
  %107 = fadd double %106, %104
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %17, i64 %31, i64 %indvars.iv
  store double %107, double* %108, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph21, !llvm.loop !9

._crit_edge.loopexit:                             ; preds = %scalar.ph21
  br label %._crit_edge

._crit_edge.loopexit61:                           ; preds = %vector.body19
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit61, %._crit_edge.loopexit
  %109 = add nsw i32 %.01077, 1
  %110 = icmp slt i32 %109, 119
  %indvar.next27 = add i64 %indvar26, 1
  br i1 %110, label %.preheader1, label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge
  %111 = add nsw i32 %.010910, 1
  %112 = icmp slt i32 %111, 119
  %indvar.next25 = add i64 %indvar24, 1
  br i1 %112, label %.preheader3, label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %._crit_edge9
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.preheader, %._crit_edge17
  %indvar = phi i64 [ %indvar.next, %._crit_edge17 ], [ 0, %.preheader2.preheader ]
  %.111018 = phi i32 [ %221, %._crit_edge17 ], [ 1, %.preheader2.preheader ]
  %113 = add i64 %indvar, 1
  %114 = add i64 %indvar, 2
  %115 = add nuw nsw i32 %.111018, 1
  %116 = sext i32 %115 to i64
  %117 = sext i32 %.111018 to i64
  %118 = add nsw i32 %.111018, -1
  %119 = sext i32 %118 to i64
  %120 = sext i32 %.111018 to i64
  %121 = sext i32 %.111018 to i64
  %122 = sext i32 %.111018 to i64
  %123 = sext i32 %.111018 to i64
  %124 = sext i32 %.111018 to i64
  %125 = sext i32 %.111018 to i64
  %126 = sext i32 %.111018 to i64
  %127 = sext i32 %.111018 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader2, %._crit_edge14
  %indvar1 = phi i64 [ 0, %.preheader2 ], [ %indvar.next2, %._crit_edge14 ]
  %.110815 = phi i32 [ 1, %.preheader2 ], [ %219, %._crit_edge14 ]
  %128 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %113, i64 %128, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %113, i64 %128, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar, i64 %128, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %114, i64 %128, i64 119
  %129 = sext i32 %.110815 to i64
  %130 = sext i32 %.110815 to i64
  %131 = sext i32 %.110815 to i64
  %132 = add nuw nsw i32 %.110815, 1
  %133 = sext i32 %132 to i64
  %134 = sext i32 %.110815 to i64
  %135 = add nsw i32 %.110815, -1
  %136 = sext i32 %135 to i64
  %137 = sext i32 %.110815 to i64
  %138 = sext i32 %.110815 to i64
  %139 = sext i32 %.110815 to i64
  %140 = sext i32 %.110815 to i64
  %141 = sext i32 %.110815 to i64
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
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %116, i64 %129, i64 %offset.idx
  %143 = bitcast double* %142 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %143, align 8, !alias.scope !10
  %144 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %117, i64 %130, i64 %offset.idx
  %145 = bitcast double* %144 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %145, align 8, !alias.scope !10
  %146 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %147 = fsub <2 x double> %wide.load, %146
  %148 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %119, i64 %131, i64 %offset.idx
  %149 = bitcast double* %148 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %149, align 8, !alias.scope !10
  %150 = fadd <2 x double> %wide.load11, %147
  %151 = fmul <2 x double> %150, <double 1.250000e-01, double 1.250000e-01>
  %152 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %120, i64 %133, i64 %offset.idx
  %153 = bitcast double* %152 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %153, align 8, !alias.scope !10
  %154 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %121, i64 %134, i64 %offset.idx
  %155 = bitcast double* %154 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %155, align 8, !alias.scope !10
  %156 = fmul <2 x double> %wide.load13, <double 2.000000e+00, double 2.000000e+00>
  %157 = fsub <2 x double> %wide.load12, %156
  %158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %122, i64 %136, i64 %offset.idx
  %159 = bitcast double* %158 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %159, align 8, !alias.scope !10
  %160 = fadd <2 x double> %wide.load14, %157
  %161 = fmul <2 x double> %160, <double 1.250000e-01, double 1.250000e-01>
  %162 = fadd <2 x double> %151, %161
  %163 = add nuw nsw i64 %offset.idx, 1
  %164 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %123, i64 %137, i64 %163
  %165 = bitcast double* %164 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %165, align 8, !alias.scope !10
  %166 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %124, i64 %138, i64 %offset.idx
  %167 = bitcast double* %166 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %167, align 8, !alias.scope !10
  %168 = fmul <2 x double> %wide.load16, <double 2.000000e+00, double 2.000000e+00>
  %169 = fsub <2 x double> %wide.load15, %168
  %170 = add nsw i64 %offset.idx, -1
  %171 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %125, i64 %139, i64 %170
  %172 = bitcast double* %171 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %172, align 8, !alias.scope !10
  %173 = fadd <2 x double> %wide.load17, %169
  %174 = fmul <2 x double> %173, <double 1.250000e-01, double 1.250000e-01>
  %175 = fadd <2 x double> %162, %174
  %176 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %126, i64 %140, i64 %offset.idx
  %177 = bitcast double* %176 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %177, align 8, !alias.scope !10
  %178 = fadd <2 x double> %wide.load18, %175
  %179 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %127, i64 %141, i64 %offset.idx
  %180 = bitcast double* %179 to <2 x double>*
  store <2 x double> %178, <2 x double>* %180, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %181 = icmp eq i64 %index.next, 118
  br i1 %181, label %._crit_edge14.loopexit60, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %182 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %116, i64 %129, i64 %indvars.iv22
  %183 = load double, double* %182, align 8
  %184 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %117, i64 %130, i64 %indvars.iv22
  %185 = load double, double* %184, align 8
  %186 = fmul double %185, 2.000000e+00
  %187 = fsub double %183, %186
  %188 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %119, i64 %131, i64 %indvars.iv22
  %189 = load double, double* %188, align 8
  %190 = fadd double %189, %187
  %191 = fmul double %190, 1.250000e-01
  %192 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %120, i64 %133, i64 %indvars.iv22
  %193 = load double, double* %192, align 8
  %194 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %121, i64 %134, i64 %indvars.iv22
  %195 = load double, double* %194, align 8
  %196 = fmul double %195, 2.000000e+00
  %197 = fsub double %193, %196
  %198 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %122, i64 %136, i64 %indvars.iv22
  %199 = load double, double* %198, align 8
  %200 = fadd double %199, %197
  %201 = fmul double %200, 1.250000e-01
  %202 = fadd double %191, %201
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %203 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %123, i64 %137, i64 %indvars.iv.next23
  %204 = load double, double* %203, align 8
  %205 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %124, i64 %138, i64 %indvars.iv22
  %206 = load double, double* %205, align 8
  %207 = fmul double %206, 2.000000e+00
  %208 = fsub double %204, %207
  %209 = add nsw i64 %indvars.iv22, -1
  %210 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %125, i64 %139, i64 %209
  %211 = load double, double* %210, align 8
  %212 = fadd double %211, %208
  %213 = fmul double %212, 1.250000e-01
  %214 = fadd double %202, %213
  %215 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %126, i64 %140, i64 %indvars.iv22
  %216 = load double, double* %215, align 8
  %217 = fadd double %216, %214
  %218 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %127, i64 %141, i64 %indvars.iv22
  store double %217, double* %218, align 8
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 119
  br i1 %exitcond24, label %._crit_edge14.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge14.loopexit:                           ; preds = %scalar.ph
  br label %._crit_edge14

._crit_edge14.loopexit60:                         ; preds = %vector.body
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit60, %._crit_edge14.loopexit
  %219 = add nsw i32 %.110815, 1
  %220 = icmp slt i32 %219, 119
  %indvar.next2 = add i64 %indvar1, 1
  br i1 %220, label %.preheader, label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge14
  %221 = add nsw i32 %.111018, 1
  %222 = icmp slt i32 %221, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %222, label %.preheader2, label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge17
  %223 = add nuw nsw i32 %.011121, 1
  %exitcond25 = icmp eq i32 %223, 501
  br i1 %exitcond25, label %224, label %.preheader5

; <label>:224:                                    ; preds = %._crit_edge20
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

.preheader20:                                     ; preds = %1, %27
  %.01923 = phi i32 [ 0, %1 ], [ %28, %27 ]
  %6 = mul nuw nsw i32 %.01923, 120
  %7 = sext i32 %.01923 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader20, %24
  %.01822 = phi i32 [ 0, %.preheader20 ], [ %25, %24 ]
  %8 = add nuw i32 %.01822, %6
  %9 = mul nuw nsw i32 %8, 120
  %10 = sext i32 %.01822 to i64
  %11 = zext i32 %9 to i64
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %19 ]
  %13 = add i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %10, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %24, label %12

; <label>:24:                                     ; preds = %19
  %25 = add nsw i32 %.01822, 1
  %26 = icmp slt i32 %25, 120
  br i1 %26, label %.preheader, label %27

; <label>:27:                                     ; preds = %24
  %28 = add nsw i32 %.01923, 1
  %29 = icmp slt i32 %28, 120
  br i1 %29, label %.preheader20, label %30

; <label>:30:                                     ; preds = %27
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %33) #5
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

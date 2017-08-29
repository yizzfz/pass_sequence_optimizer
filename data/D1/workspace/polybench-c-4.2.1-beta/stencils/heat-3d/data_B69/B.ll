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
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #3
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
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
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader3.lr.ph, label %._crit_edge

.preheader3.lr.ph:                                ; preds = %3
  %wide.trip.count34 = zext i32 %0 to i64
  %5 = sext i32 %0 to i64
  %6 = sitofp i32 %0 to double
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us, %.preheader3.lr.ph
  %indvars.iv36 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next37, %._crit_edge5.us ]
  %7 = trunc i64 %indvars.iv36 to i32
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %8 = icmp slt i64 %indvars.iv.next37, %5
  br i1 %8, label %.preheader3.us, label %._crit_edge.loopexit

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader3.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %9 = trunc i64 %indvars.iv32 to i32
  br label %10

._crit_edge.us.us:                                ; preds = %10
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge5.us, label %.preheader.us.us

; <label>:10:                                     ; preds = %10, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %10 ], [ 0, %.preheader.us.us ]
  %11 = trunc i64 %indvars.iv to i32
  %12 = sub i32 %0, %11
  %13 = add i32 %12, %7
  %14 = add i32 %13, %9
  %15 = sitofp i32 %14 to double
  %16 = fmul double %15, 1.000000e+01
  %17 = fdiv double %16, %6
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  store double %17, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count34
  br i1 %exitcond, label %._crit_edge.us.us, label %10

._crit_edge.loopexit:                             ; preds = %._crit_edge5.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  %5 = add nsw i32 %1, -1
  %6 = sext i32 %1 to i64
  %7 = add nsw i64 %6, -1
  %wide.trip.count63 = zext i32 %5 to i64
  %8 = icmp sgt i64 %7, 2
  %smax = select i1 %8, i64 %7, i64 2
  %9 = add nsw i64 %smax, -1
  %10 = icmp sgt i64 %7, 2
  %smax80 = select i1 %10, i64 %7, i64 2
  %11 = add nsw i64 %wide.trip.count63, -1
  %12 = icmp sgt i32 %5, 1
  %min.iters.check96 = icmp ult i64 %11, 2
  %n.vec99 = and i64 %11, -2
  %cmp.zero100 = icmp eq i64 %n.vec99, 0
  %ind.end121 = or i64 %11, 1
  %cmp.n122 = icmp eq i64 %11, %n.vec99
  %min.iters.check = icmp ult i64 %9, 2
  %n.vec = and i64 %9, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %9, 1
  %cmp.n = icmp eq i64 %9, %n.vec
  br label %.preheader11

.preheader11:                                     ; preds = %._crit_edge34, %4
  %13 = phi i32 [ 1, %4 ], [ %150, %._crit_edge34 ]
  br i1 %12, label %.preheader9.preheader, label %._crit_edge34

.preheader9.preheader:                            ; preds = %.preheader11
  br label %.preheader9

.preheader10:                                     ; preds = %._crit_edge13
  br i1 %12, label %.preheader8.preheader, label %._crit_edge34

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge13
  %indvars.iv65 = phi i64 [ %14, %._crit_edge13 ], [ 1, %.preheader9.preheader ]
  %14 = add nuw nsw i64 %indvars.iv65, 1
  %15 = add nsw i64 %indvars.iv65, -1
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge.us, %.preheader9
  %indvar102 = phi i64 [ %indvar.next103, %._crit_edge.us ], [ 0, %.preheader9 ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us ], [ 1, %.preheader9 ]
  %16 = add i64 %indvar102, 1
  %scevgep104 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv65, i64 %16, i64 1
  %scevgep106 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv65, i64 %16, i64 %wide.trip.count63
  %17 = add i64 %indvar102, -118
  %scevgep108 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %17, i64 -119
  %scevgep110 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %14, i64 %16, i64 %wide.trip.count63
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %18 = add nsw i64 %indvars.iv61, -1
  br i1 %min.iters.check96, label %scalar.ph95.preheader, label %min.iters.checked97

min.iters.checked97:                              ; preds = %.preheader7.us
  br i1 %cmp.zero100, label %scalar.ph95.preheader, label %vector.memcheck116

vector.memcheck116:                               ; preds = %min.iters.checked97
  %bound0112 = icmp ult double* %scevgep104, %scevgep110
  %bound1113 = icmp ult double* %scevgep108, %scevgep106
  %memcheck.conflict115 = and i1 %bound0112, %bound1113
  br i1 %memcheck.conflict115, label %scalar.ph95.preheader, label %vector.body93.preheader

vector.body93.preheader:                          ; preds = %vector.memcheck116
  br label %vector.body93

vector.body93:                                    ; preds = %vector.body93.preheader, %vector.body93
  %index118 = phi i64 [ %index.next119, %vector.body93 ], [ 0, %vector.body93.preheader ]
  %offset.idx123 = or i64 %index118, 1
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %14, i64 %indvars.iv61, i64 %offset.idx123
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv61, i64 %offset.idx123
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fmul <2 x double> %wide.load128, <double 2.000000e+00, double 2.000000e+00>
  %24 = fsub <2 x double> %wide.load127, %23
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %15, i64 %indvars.iv61, i64 %offset.idx123
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fadd <2 x double> %wide.load129, %24
  %28 = fmul <2 x double> %27, <double 1.250000e-01, double 1.250000e-01>
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv.next62, i64 %offset.idx123
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fsub <2 x double> %wide.load130, %23
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %18, i64 %offset.idx123
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fadd <2 x double> %31, %wide.load131
  %35 = fmul <2 x double> %34, <double 1.250000e-01, double 1.250000e-01>
  %36 = fadd <2 x double> %28, %35
  %37 = add nuw nsw i64 %offset.idx123, 1
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv61, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !1
  %40 = fsub <2 x double> %wide.load132, %23
  %41 = add nsw i64 %offset.idx123, -1
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv61, i64 %41
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !1
  %44 = fadd <2 x double> %40, %wide.load133
  %45 = fmul <2 x double> %44, <double 1.250000e-01, double 1.250000e-01>
  %46 = fadd <2 x double> %36, %45
  %47 = fadd <2 x double> %wide.load128, %46
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv65, i64 %indvars.iv61, i64 %offset.idx123
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> %47, <2 x double>* %49, align 8, !alias.scope !4, !noalias !1
  %index.next119 = add i64 %index118, 2
  %50 = icmp eq i64 %index.next119, %n.vec99
  br i1 %50, label %middle.block94, label %vector.body93, !llvm.loop !6

middle.block94:                                   ; preds = %vector.body93
  br i1 %cmp.n122, label %._crit_edge.us, label %scalar.ph95.preheader

scalar.ph95.preheader:                            ; preds = %middle.block94, %vector.memcheck116, %min.iters.checked97, %.preheader7.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck116 ], [ 1, %min.iters.checked97 ], [ 1, %.preheader7.us ], [ %ind.end121, %middle.block94 ]
  br label %scalar.ph95

scalar.ph95:                                      ; preds = %scalar.ph95.preheader, %scalar.ph95
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph95 ], [ %indvars.iv.ph, %scalar.ph95.preheader ]
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %14, i64 %indvars.iv61, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, 2.000000e+00
  %56 = fsub double %52, %55
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %15, i64 %indvars.iv61, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  %60 = fmul double %59, 1.250000e-01
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv.next62, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fsub double %62, %55
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %18, i64 %indvars.iv
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  %67 = fmul double %66, 1.250000e-01
  %68 = fadd double %60, %67
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv.next
  %70 = load double, double* %69, align 8
  %71 = fsub double %70, %55
  %72 = add nsw i64 %indvars.iv, -1
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv61, i64 %72
  %74 = load double, double* %73, align 8
  %75 = fadd double %71, %74
  %76 = fmul double %75, 1.250000e-01
  %77 = fadd double %68, %76
  %78 = fadd double %54, %77
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv
  store double %78, double* %79, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count63
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph95, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph95
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block94
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  %indvar.next103 = add i64 %indvar102, 1
  br i1 %exitcond64, label %._crit_edge13, label %.preheader7.us

._crit_edge13:                                    ; preds = %._crit_edge.us
  %80 = icmp slt i64 %14, %7
  br i1 %80, label %.preheader9, label %.preheader10

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge29
  %indvars.iv74 = phi i64 [ %81, %._crit_edge29 ], [ 1, %.preheader8.preheader ]
  %81 = add nuw nsw i64 %indvars.iv74, 1
  %82 = add nsw i64 %indvars.iv74, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge26.us, %.preheader8
  %indvar = phi i64 [ %indvar.next, %._crit_edge26.us ], [ 0, %.preheader8 ]
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge26.us ], [ 1, %.preheader8 ]
  %83 = add i64 %indvar, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %83, i64 1
  %scevgep81 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %83, i64 %smax80
  %84 = add i64 %indvar, -118
  %scevgep83 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %84, i64 -119
  %scevgep85 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %81, i64 %83, i64 %smax80
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %85 = add nsw i64 %indvars.iv71, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep85
  %bound1 = icmp ult double* %scevgep83, %scevgep81
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %81, i64 %indvars.iv71, i64 %offset.idx
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !10
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %indvars.iv71, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fmul <2 x double> %wide.load87, <double 2.000000e+00, double 2.000000e+00>
  %91 = fsub <2 x double> %wide.load, %90
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %82, i64 %indvars.iv71, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = fadd <2 x double> %wide.load88, %91
  %95 = fmul <2 x double> %94, <double 1.250000e-01, double 1.250000e-01>
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %indvars.iv.next72, i64 %offset.idx
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fsub <2 x double> %wide.load89, %90
  %99 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %85, i64 %offset.idx
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = fadd <2 x double> %98, %wide.load90
  %102 = fmul <2 x double> %101, <double 1.250000e-01, double 1.250000e-01>
  %103 = fadd <2 x double> %95, %102
  %104 = add nuw nsw i64 %offset.idx, 1
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %indvars.iv71, i64 %104
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !10
  %107 = fsub <2 x double> %wide.load91, %90
  %108 = add nsw i64 %offset.idx, -1
  %109 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %indvars.iv71, i64 %108
  %110 = bitcast double* %109 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %110, align 8, !alias.scope !10
  %111 = fadd <2 x double> %107, %wide.load92
  %112 = fmul <2 x double> %111, <double 1.250000e-01, double 1.250000e-01>
  %113 = fadd <2 x double> %103, %112
  %114 = fadd <2 x double> %wide.load87, %113
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %indvars.iv71, i64 %offset.idx
  %116 = bitcast double* %115 to <2 x double>*
  store <2 x double> %114, <2 x double>* %116, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %117 = icmp eq i64 %index.next, %n.vec
  br i1 %117, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge26.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv68.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %scalar.ph ], [ %indvars.iv68.ph, %scalar.ph.preheader ]
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %81, i64 %indvars.iv71, i64 %indvars.iv68
  %119 = load double, double* %118, align 8
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv68
  %121 = load double, double* %120, align 8
  %122 = fmul double %121, 2.000000e+00
  %123 = fsub double %119, %122
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %82, i64 %indvars.iv71, i64 %indvars.iv68
  %125 = load double, double* %124, align 8
  %126 = fadd double %125, %123
  %127 = fmul double %126, 1.250000e-01
  %128 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %indvars.iv.next72, i64 %indvars.iv68
  %129 = load double, double* %128, align 8
  %130 = fsub double %129, %122
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %85, i64 %indvars.iv68
  %132 = load double, double* %131, align 8
  %133 = fadd double %130, %132
  %134 = fmul double %133, 1.250000e-01
  %135 = fadd double %127, %134
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv.next69
  %137 = load double, double* %136, align 8
  %138 = fsub double %137, %122
  %139 = add nsw i64 %indvars.iv68, -1
  %140 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv74, i64 %indvars.iv71, i64 %139
  %141 = load double, double* %140, align 8
  %142 = fadd double %138, %141
  %143 = fmul double %142, 1.250000e-01
  %144 = fadd double %135, %143
  %145 = fadd double %121, %144
  %146 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv68
  store double %145, double* %146, align 8
  %147 = icmp slt i64 %indvars.iv.next69, %7
  br i1 %147, label %scalar.ph, label %._crit_edge26.us.loopexit, !llvm.loop !16

._crit_edge26.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit, %middle.block
  %148 = icmp slt i64 %indvars.iv.next72, %7
  %indvar.next = add i64 %indvar, 1
  br i1 %148, label %.preheader.us, label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge26.us
  %149 = icmp slt i64 %81, %7
  br i1 %149, label %.preheader8, label %._crit_edge34.loopexit

._crit_edge34.loopexit:                           ; preds = %._crit_edge29
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %.preheader11, %.preheader10
  %150 = add nsw i32 %13, 1
  %151 = icmp slt i32 %150, 501
  br i1 %151, label %.preheader11, label %152

; <label>:152:                                    ; preds = %._crit_edge34
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader3.lr.ph, label %._crit_edge

.preheader3.lr.ph:                                ; preds = %2
  %wide.trip.count34 = zext i32 %0 to i64
  %8 = sext i32 %0 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us, %.preheader3.lr.ph
  %indvars.iv36 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next37, %._crit_edge5.us ]
  %9 = mul nsw i64 %indvars.iv36, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %11 = icmp slt i64 %indvars.iv.next37, %8
  br i1 %11, label %.preheader3.us, label %._crit_edge.loopexit

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader3.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %12 = trunc i64 %indvars.iv32 to i32
  %13 = add i32 %10, %12
  %14 = mul i32 %13, %0
  %15 = zext i32 %14 to i64
  br label %16

._crit_edge.us.us:                                ; preds = %._crit_edge39
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge5.us, label %.preheader.us.us

; <label>:16:                                     ; preds = %._crit_edge39, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge39 ], [ 0, %.preheader.us.us ]
  %17 = add i64 %15, %indvars.iv
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 20
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %._crit_edge39

; <label>:21:                                     ; preds = %16
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %22) #4
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %16, %21
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %25) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count34
  br i1 %exitcond, label %._crit_edge.us.us, label %16

._crit_edge.loopexit:                             ; preds = %._crit_edge5.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }

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

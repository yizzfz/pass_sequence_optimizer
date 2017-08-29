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
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
.preheader23.lr.ph:
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader23.lr.ph, %._crit_edge26.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge26.us ], [ 0, %.preheader23.lr.ph ]
  %3 = trunc i64 %indvars.iv41 to i32
  %4 = add i32 %3, 120
  br label %.preheader.us.us

._crit_edge26.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 120
  br i1 %exitcond44, label %._crit_edge28, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv38 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next39, %._crit_edge.us.us ]
  %5 = trunc i64 %indvars.iv38 to i32
  %6 = add i32 %4, %5
  br label %.preheader.us.us.new

._crit_edge.us.us:                                ; preds = %.preheader.us.us.new
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, 120
  br i1 %exitcond, label %._crit_edge26.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ 0, %.preheader.us.us ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sub i32 %6, %7
  %9 = sitofp i32 %8 to double
  %10 = fmul double %9, 1.000000e+01
  %11 = fdiv double %10, 1.200000e+02
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  store double %11, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %15 = sub i32 %6, %14
  %16 = sitofp i32 %15 to double
  %17 = fmul double %16, 1.000000e+01
  %18 = fdiv double %17, 1.200000e+02
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv.next
  store double %18, double* %20, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.preheader.us.us.new

._crit_edge28:                                    ; preds = %._crit_edge26.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge127, %4
  %.0111128 = phi i32 [ 1, %4 ], [ %139, %._crit_edge127 ]
  br label %.preheader114

.preheader114:                                    ; preds = %.preheader116, %._crit_edge119
  %indvar170 = phi i64 [ 0, %.preheader116 ], [ %indvar.next171, %._crit_edge119 ]
  %indvars.iv133 = phi i64 [ 1, %.preheader116 ], [ %indvars.iv.next134, %._crit_edge119 ]
  %5 = add i64 %indvar170, 1
  %6 = add i64 %indvar170, 2
  %7 = add nuw nsw i64 %indvars.iv133, 1
  %8 = add nsw i64 %indvars.iv133, -1
  br label %.preheader112.us

.preheader112.us:                                 ; preds = %._crit_edge.us, %.preheader114
  %indvar172 = phi i64 [ %indvar.next173, %._crit_edge.us ], [ 0, %.preheader114 ]
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge.us ], [ 1, %.preheader114 ]
  %9 = add i64 %indvar172, 1
  %scevgep174 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %5, i64 %9, i64 1
  %scevgep176 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %5, i64 %9, i64 119
  %scevgep178 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar170, i64 %9, i64 1
  %scevgep180 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %6, i64 %9, i64 119
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %10 = add nsw i64 %indvars.iv129, -1
  %bound0182 = icmp ult double* %scevgep174, %scevgep180
  %bound1183 = icmp ult double* %scevgep178, %scevgep176
  %memcheck.conflict185 = and i1 %bound0182, %bound1183
  br i1 %memcheck.conflict185, label %scalar.ph167.preheader, label %vector.body165.preheader

vector.body165.preheader:                         ; preds = %.preheader112.us
  br label %vector.body165

scalar.ph167.preheader:                           ; preds = %.preheader112.us
  br label %scalar.ph167

vector.body165:                                   ; preds = %vector.body165.preheader, %vector.body165
  %index188 = phi i64 [ %index.next189, %vector.body165 ], [ 0, %vector.body165.preheader ]
  %offset.idx192 = or i64 %index188, 1
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %7, i64 %indvars.iv129, i64 %offset.idx192
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load196 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %offset.idx192
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load197 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = fmul <2 x double> %wide.load197, <double 2.000000e+00, double 2.000000e+00>
  %16 = fsub <2 x double> %wide.load196, %15
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %8, i64 %indvars.iv129, i64 %offset.idx192
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load198 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fadd <2 x double> %wide.load198, %16
  %20 = fmul <2 x double> %19, <double 1.250000e-01, double 1.250000e-01>
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv.next130, i64 %offset.idx192
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load199 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fsub <2 x double> %wide.load199, %15
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %10, i64 %offset.idx192
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load200 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fadd <2 x double> %23, %wide.load200
  %27 = fmul <2 x double> %26, <double 1.250000e-01, double 1.250000e-01>
  %28 = fadd <2 x double> %20, %27
  %29 = add nuw nsw i64 %offset.idx192, 1
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %29
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load201 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fsub <2 x double> %wide.load201, %15
  %33 = add nsw i64 %offset.idx192, -1
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %33
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load202 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = fadd <2 x double> %32, %wide.load202
  %37 = fmul <2 x double> %36, <double 1.250000e-01, double 1.250000e-01>
  %38 = fadd <2 x double> %28, %37
  %39 = fadd <2 x double> %wide.load197, %38
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv133, i64 %indvars.iv129, i64 %offset.idx192
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> %39, <2 x double>* %41, align 8, !alias.scope !4, !noalias !1
  %index.next189 = add i64 %index188, 2
  %42 = icmp eq i64 %index.next189, 118
  br i1 %42, label %._crit_edge.us.loopexit204, label %vector.body165, !llvm.loop !6

scalar.ph167:                                     ; preds = %scalar.ph167.preheader, %scalar.ph167
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph167 ], [ 1, %scalar.ph167.preheader ]
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %7, i64 %indvars.iv129, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, 2.000000e+00
  %48 = fsub double %44, %47
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %8, i64 %indvars.iv129, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  %52 = fmul double %51, 1.250000e-01
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv.next130, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fsub double %54, %47
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %10, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fadd double %55, %57
  %59 = fmul double %58, 1.250000e-01
  %60 = fadd double %52, %59
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv.next
  %62 = load double, double* %61, align 8
  %63 = fsub double %62, %47
  %64 = add nsw i64 %indvars.iv, -1
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %64
  %66 = load double, double* %65, align 8
  %67 = fadd double %63, %66
  %68 = fmul double %67, 1.250000e-01
  %69 = fadd double %60, %68
  %70 = fadd double %46, %69
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv
  store double %70, double* %71, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph167, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph167
  br label %._crit_edge.us

._crit_edge.us.loopexit204:                       ; preds = %vector.body165
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit204, %._crit_edge.us.loopexit
  %exitcond132 = icmp eq i64 %indvars.iv.next130, 119
  %indvar.next173 = add i64 %indvar172, 1
  br i1 %exitcond132, label %._crit_edge119, label %.preheader112.us

._crit_edge119:                                   ; preds = %._crit_edge.us
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next134, 119
  %indvar.next171 = add i64 %indvar170, 1
  br i1 %exitcond136, label %.preheader.lr.ph.preheader, label %.preheader114

.preheader.lr.ph.preheader:                       ; preds = %._crit_edge119
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge125
  %indvar = phi i64 [ %indvar.next, %._crit_edge125 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge125 ], [ 1, %.preheader.lr.ph.preheader ]
  %72 = add i64 %indvar, 1
  %73 = add i64 %indvar, 2
  %74 = add nuw nsw i64 %indvars.iv145, 1
  %75 = add nsw i64 %indvars.iv145, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge123.us, %.preheader.lr.ph
  %indvar150 = phi i64 [ %indvar.next151, %._crit_edge123.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %._crit_edge123.us ], [ 1, %.preheader.lr.ph ]
  %76 = add i64 %indvar150, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %72, i64 %76, i64 1
  %scevgep153 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %72, i64 %76, i64 119
  %scevgep155 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %76, i64 1
  %scevgep157 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %73, i64 %76, i64 119
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %77 = add nsw i64 %indvars.iv141, -1
  %bound0 = icmp ult double* %scevgep, %scevgep157
  %bound1 = icmp ult double* %scevgep155, %scevgep153
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %74, i64 %indvars.iv141, i64 %offset.idx
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %offset.idx
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = fmul <2 x double> %wide.load159, <double 2.000000e+00, double 2.000000e+00>
  %83 = fsub <2 x double> %wide.load, %82
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %75, i64 %indvars.iv141, i64 %offset.idx
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fadd <2 x double> %wide.load160, %83
  %87 = fmul <2 x double> %86, <double 1.250000e-01, double 1.250000e-01>
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv.next142, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fsub <2 x double> %wide.load161, %82
  %91 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %77, i64 %offset.idx
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = fadd <2 x double> %90, %wide.load162
  %94 = fmul <2 x double> %93, <double 1.250000e-01, double 1.250000e-01>
  %95 = fadd <2 x double> %87, %94
  %96 = add nuw nsw i64 %offset.idx, 1
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %96
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !10
  %99 = fsub <2 x double> %wide.load163, %82
  %100 = add nsw i64 %offset.idx, -1
  %101 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %100
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !10
  %103 = fadd <2 x double> %99, %wide.load164
  %104 = fmul <2 x double> %103, <double 1.250000e-01, double 1.250000e-01>
  %105 = fadd <2 x double> %95, %104
  %106 = fadd <2 x double> %wide.load159, %105
  %107 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv145, i64 %indvars.iv141, i64 %offset.idx
  %108 = bitcast double* %107 to <2 x double>*
  store <2 x double> %106, <2 x double>* %108, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %109 = icmp eq i64 %index.next, 118
  br i1 %109, label %._crit_edge123.us.loopexit203, label %vector.body, !llvm.loop !15

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %scalar.ph ], [ 1, %scalar.ph.preheader ]
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %74, i64 %indvars.iv141, i64 %indvars.iv137
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv137
  %113 = load double, double* %112, align 8
  %114 = fmul double %113, 2.000000e+00
  %115 = fsub double %111, %114
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %75, i64 %indvars.iv141, i64 %indvars.iv137
  %117 = load double, double* %116, align 8
  %118 = fadd double %117, %115
  %119 = fmul double %118, 1.250000e-01
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv.next142, i64 %indvars.iv137
  %121 = load double, double* %120, align 8
  %122 = fsub double %121, %114
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %77, i64 %indvars.iv137
  %124 = load double, double* %123, align 8
  %125 = fadd double %122, %124
  %126 = fmul double %125, 1.250000e-01
  %127 = fadd double %119, %126
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %128 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv.next138
  %129 = load double, double* %128, align 8
  %130 = fsub double %129, %114
  %131 = add nsw i64 %indvars.iv137, -1
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %131
  %133 = load double, double* %132, align 8
  %134 = fadd double %130, %133
  %135 = fmul double %134, 1.250000e-01
  %136 = fadd double %127, %135
  %137 = fadd double %113, %136
  %138 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv137
  store double %137, double* %138, align 8
  %exitcond140 = icmp eq i64 %indvars.iv.next138, 119
  br i1 %exitcond140, label %._crit_edge123.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge123.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge123.us

._crit_edge123.us.loopexit203:                    ; preds = %vector.body
  br label %._crit_edge123.us

._crit_edge123.us:                                ; preds = %._crit_edge123.us.loopexit203, %._crit_edge123.us.loopexit
  %exitcond144 = icmp eq i64 %indvars.iv.next142, 119
  %indvar.next151 = add i64 %indvar150, 1
  br i1 %exitcond144, label %._crit_edge125, label %.preheader.us

._crit_edge125:                                   ; preds = %._crit_edge123.us
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond148 = icmp eq i64 %indvars.iv.next146, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond148, label %._crit_edge127, label %.preheader.lr.ph

._crit_edge127:                                   ; preds = %._crit_edge125
  %139 = add nuw nsw i32 %.0111128, 1
  %exitcond149 = icmp eq i32 %139, 501
  br i1 %exitcond149, label %140, label %.preheader116

; <label>:140:                                    ; preds = %._crit_edge127
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
.preheader20.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader20.lr.ph, %._crit_edge23.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge23.us ], [ 0, %.preheader20.lr.ph ]
  %6 = mul nsw i64 %indvars.iv39, 120
  br label %.preheader.us.us

._crit_edge23.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 120
  br i1 %exitcond42, label %._crit_edge25, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv35 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next36, %._crit_edge.us.us ]
  %7 = add i64 %indvars.iv35, %6
  %8 = mul i64 %7, 120
  br label %9

._crit_edge.us.us:                                ; preds = %16
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 120
  br i1 %exitcond38, label %._crit_edge23.us, label %.preheader.us.us

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
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %9

._crit_edge25:                                    ; preds = %._crit_edge23.us
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

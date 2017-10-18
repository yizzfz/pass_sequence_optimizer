; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
  tail call void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) #2 {
  br i1 true, label %.preheader23.lr.ph, label %._crit_edge28

.preheader23.lr.ph:                               ; preds = %3
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader23.lr.ph, %._crit_edge26.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge26.us ], [ 0, %.preheader23.lr.ph ]
  %4 = trunc i64 %indvars.iv41 to i32
  %5 = add i32 %4, 120
  br label %.preheader.us.us

._crit_edge26.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 120
  br i1 %exitcond44, label %._crit_edge28.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv38 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next39, %._crit_edge.us.us ]
  %6 = trunc i64 %indvars.iv38 to i32
  %7 = add i32 %5, %6
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %8 = sitofp i32 %7 to double
  %9 = fmul double %8, 1.000000e+01
  %10 = fdiv double %9, 1.200000e+02
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 0
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 0
  store double %10, double* %12, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 false, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, 120
  br i1 %exitcond, label %._crit_edge26.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %13 = trunc i64 %indvars.iv to i32
  %14 = sub i32 %7, %13
  %15 = sitofp i32 %14 to double
  %16 = fmul double %15, 1.000000e+01
  %17 = fdiv double %16, 1.200000e+02
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  store double %17, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %20 = trunc i64 %indvars.iv.next to i32
  %21 = sub i32 %7, %20
  %22 = sitofp i32 %21 to double
  %23 = fmul double %22, 1.000000e+01
  %24 = fdiv double %23, 1.200000e+02
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv.next
  store double %24, double* %25, align 8
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv.next
  store double %24, double* %26, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge28.loopexit:                           ; preds = %._crit_edge26.us
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_heat_3d(i32, i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) #2 {
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge127, %4
  %.0111128 = phi i32 [ 1, %4 ], [ %138, %._crit_edge127 ]
  br i1 true, label %.preheader114.preheader, label %._crit_edge127

.preheader114.preheader:                          ; preds = %.preheader116
  br label %.preheader114

.preheader114:                                    ; preds = %.preheader114.preheader, %._crit_edge119
  %indvars.iv133 = phi i64 [ %5, %._crit_edge119 ], [ 1, %.preheader114.preheader ]
  %5 = add nuw nsw i64 %indvars.iv133, 1
  %6 = add nsw i64 %indvars.iv133, -1
  br label %.preheader112.us

.preheader112.us:                                 ; preds = %._crit_edge.us, %.preheader114
  %indvar174 = phi i64 [ %indvar.next175, %._crit_edge.us ], [ 0, %.preheader114 ]
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge.us ], [ 1, %.preheader114 ]
  %7 = add i64 %indvar174, 1
  %scevgep176 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv133, i64 %7, i64 1
  %scevgep178 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv133, i64 %7, i64 119
  %8 = add i64 %indvar174, -118
  %scevgep180 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %8, i64 -119
  %scevgep182 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %5, i64 %7, i64 119
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %9 = add nsw i64 %indvars.iv129, -1
  br i1 false, label %scalar.ph167.preheader, label %min.iters.checked169

min.iters.checked169:                             ; preds = %.preheader112.us
  br i1 false, label %scalar.ph167.preheader, label %vector.memcheck188

vector.memcheck188:                               ; preds = %min.iters.checked169
  %bound0184 = icmp ult double* %scevgep176, %scevgep182
  %bound1185 = icmp ult double* %scevgep180, %scevgep178
  %memcheck.conflict187 = and i1 %bound0184, %bound1185
  br i1 %memcheck.conflict187, label %scalar.ph167.preheader, label %vector.body165.preheader

vector.body165.preheader:                         ; preds = %vector.memcheck188
  br label %vector.body165

vector.body165:                                   ; preds = %vector.body165.preheader, %vector.body165
  %index190 = phi i64 [ %index.next191, %vector.body165 ], [ 0, %vector.body165.preheader ]
  %offset.idx195 = or i64 %index190, 1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %5, i64 %indvars.iv129, i64 %offset.idx195
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load199 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %offset.idx195
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load200 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fmul <2 x double> %wide.load200, <double 2.000000e+00, double 2.000000e+00>
  %15 = fsub <2 x double> %wide.load199, %14
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %6, i64 %indvars.iv129, i64 %offset.idx195
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load201 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %wide.load201, %15
  %19 = fmul <2 x double> %18, <double 1.250000e-01, double 1.250000e-01>
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv.next130, i64 %offset.idx195
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load202 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fsub <2 x double> %wide.load202, %14
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %9, i64 %offset.idx195
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load203 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %22, %wide.load203
  %26 = fmul <2 x double> %25, <double 1.250000e-01, double 1.250000e-01>
  %27 = fadd <2 x double> %19, %26
  %28 = add nuw nsw i64 %offset.idx195, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load204 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fsub <2 x double> %wide.load204, %14
  %32 = add nsw i64 %offset.idx195, -1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load205 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %31, %wide.load205
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %27, %36
  %38 = fadd <2 x double> %wide.load200, %37
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv133, i64 %indvars.iv129, i64 %offset.idx195
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next191 = add i64 %index190, 2
  %41 = icmp eq i64 %index.next191, 118
  br i1 %41, label %middle.block166, label %vector.body165, !llvm.loop !6

middle.block166:                                  ; preds = %vector.body165
  br i1 true, label %._crit_edge.us, label %scalar.ph167.preheader

scalar.ph167.preheader:                           ; preds = %middle.block166, %vector.memcheck188, %min.iters.checked169, %.preheader112.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck188 ], [ 1, %min.iters.checked169 ], [ 1, %.preheader112.us ], [ 119, %middle.block166 ]
  br label %scalar.ph167

scalar.ph167:                                     ; preds = %scalar.ph167.preheader, %scalar.ph167
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph167 ], [ %indvars.iv.ph, %scalar.ph167.preheader ]
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %5, i64 %indvars.iv129, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, 2.000000e+00
  %47 = fsub double %43, %46
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %6, i64 %indvars.iv129, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  %51 = fmul double %50, 1.250000e-01
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv.next130, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = fsub double %53, %46
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %9, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  %58 = fmul double %57, 1.250000e-01
  %59 = fadd double %51, %58
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv.next
  %61 = load double, double* %60, align 8
  %62 = fsub double %61, %46
  %63 = add nsw i64 %indvars.iv, -1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %63
  %65 = load double, double* %64, align 8
  %66 = fadd double %62, %65
  %67 = fmul double %66, 1.250000e-01
  %68 = fadd double %59, %67
  %69 = fadd double %45, %68
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv
  store double %69, double* %70, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph167, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph167
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block166
  %exitcond132 = icmp eq i64 %indvars.iv.next130, 119
  %indvar.next175 = add i64 %indvar174, 1
  br i1 %exitcond132, label %._crit_edge119, label %.preheader112.us

._crit_edge119:                                   ; preds = %._crit_edge.us
  %exitcond136 = icmp eq i64 %5, 119
  br i1 %exitcond136, label %.preheader.lr.ph.preheader, label %.preheader114

.preheader.lr.ph.preheader:                       ; preds = %._crit_edge119
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge125
  %indvar = phi i64 [ %indvar.next, %._crit_edge125 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv145 = phi i64 [ %73, %._crit_edge125 ], [ 1, %.preheader.lr.ph.preheader ]
  %71 = add i64 %indvar, 1
  %72 = add i64 %indvar, 2
  %73 = add nuw nsw i64 %indvars.iv145, 1
  %74 = add nsw i64 %indvars.iv145, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge123.us, %.preheader.lr.ph
  %indvar150 = phi i64 [ %indvar.next151, %._crit_edge123.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %._crit_edge123.us ], [ 1, %.preheader.lr.ph ]
  %75 = add i64 %indvar150, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %71, i64 %75, i64 1
  %scevgep153 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %71, i64 %75, i64 119
  %scevgep155 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %75, i64 1
  %scevgep157 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %72, i64 %75, i64 119
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %76 = add nsw i64 %indvars.iv141, -1
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 false, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep157
  %bound1 = icmp ult double* %scevgep155, %scevgep153
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %73, i64 %indvars.iv141, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = fmul <2 x double> %wide.load159, <double 2.000000e+00, double 2.000000e+00>
  %82 = fsub <2 x double> %wide.load, %81
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %74, i64 %indvars.iv141, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = fadd <2 x double> %wide.load160, %82
  %86 = fmul <2 x double> %85, <double 1.250000e-01, double 1.250000e-01>
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv.next142, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = fsub <2 x double> %wide.load161, %81
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %76, i64 %offset.idx
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = fadd <2 x double> %89, %wide.load162
  %93 = fmul <2 x double> %92, <double 1.250000e-01, double 1.250000e-01>
  %94 = fadd <2 x double> %86, %93
  %95 = add nuw nsw i64 %offset.idx, 1
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %95
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fsub <2 x double> %wide.load163, %81
  %99 = add nsw i64 %offset.idx, -1
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %99
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fadd <2 x double> %98, %wide.load164
  %103 = fmul <2 x double> %102, <double 1.250000e-01, double 1.250000e-01>
  %104 = fadd <2 x double> %94, %103
  %105 = fadd <2 x double> %wide.load159, %104
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv145, i64 %indvars.iv141, i64 %offset.idx
  %107 = bitcast double* %106 to <2 x double>*
  store <2 x double> %105, <2 x double>* %107, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %108 = icmp eq i64 %index.next, 118
  br i1 %108, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge123.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv137.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ 119, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv137 = phi i64 [ %indvars.iv.next138, %scalar.ph ], [ %indvars.iv137.ph, %scalar.ph.preheader ]
  %109 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %73, i64 %indvars.iv141, i64 %indvars.iv137
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv137
  %112 = load double, double* %111, align 8
  %113 = fmul double %112, 2.000000e+00
  %114 = fsub double %110, %113
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %74, i64 %indvars.iv141, i64 %indvars.iv137
  %116 = load double, double* %115, align 8
  %117 = fadd double %116, %114
  %118 = fmul double %117, 1.250000e-01
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv.next142, i64 %indvars.iv137
  %120 = load double, double* %119, align 8
  %121 = fsub double %120, %113
  %122 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %76, i64 %indvars.iv137
  %123 = load double, double* %122, align 8
  %124 = fadd double %121, %123
  %125 = fmul double %124, 1.250000e-01
  %126 = fadd double %118, %125
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv.next138
  %128 = load double, double* %127, align 8
  %129 = fsub double %128, %113
  %130 = add nsw i64 %indvars.iv137, -1
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %130
  %132 = load double, double* %131, align 8
  %133 = fadd double %129, %132
  %134 = fmul double %133, 1.250000e-01
  %135 = fadd double %126, %134
  %136 = fadd double %112, %135
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv137
  store double %136, double* %137, align 8
  %exitcond140 = icmp eq i64 %indvars.iv.next138, 119
  br i1 %exitcond140, label %._crit_edge123.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge123.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge123.us

._crit_edge123.us:                                ; preds = %._crit_edge123.us.loopexit, %middle.block
  %exitcond144 = icmp eq i64 %indvars.iv.next142, 119
  %indvar.next151 = add i64 %indvar150, 1
  br i1 %exitcond144, label %._crit_edge125, label %.preheader.us

._crit_edge125:                                   ; preds = %._crit_edge123.us
  %exitcond148 = icmp eq i64 %73, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond148, label %._crit_edge127.loopexit, label %.preheader.lr.ph

._crit_edge127.loopexit:                          ; preds = %._crit_edge125
  br label %._crit_edge127

._crit_edge127:                                   ; preds = %._crit_edge127.loopexit, %.preheader116
  %138 = add nuw nsw i32 %.0111128, 1
  %exitcond149 = icmp eq i32 %138, 501
  br i1 %exitcond149, label %139, label %.preheader116

; <label>:139:                                    ; preds = %._crit_edge127
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [120 x [120 x double]]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader20.lr.ph, label %._crit_edge25

.preheader20.lr.ph:                               ; preds = %2
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader20.lr.ph, %._crit_edge23.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge23.us ], [ 0, %.preheader20.lr.ph ]
  %7 = mul nsw i64 %indvars.iv39, 120
  %8 = trunc i64 %7 to i32
  br label %.preheader.us.us

._crit_edge23.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 120
  br i1 %exitcond42, label %._crit_edge25.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv35 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next36, %._crit_edge.us.us ]
  %9 = trunc i64 %indvars.iv35 to i32
  %10 = add i32 %9, %8
  %11 = mul i32 %10, 120
  %12 = zext i32 %11 to i64
  br label %13

._crit_edge.us.us:                                ; preds = %20
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 120
  br i1 %exitcond38, label %._crit_edge23.us, label %.preheader.us.us

; <label>:13:                                     ; preds = %20, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %20 ], [ 0, %.preheader.us.us ]
  %14 = add i64 %indvars.iv, %12
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %20

; <label>:20:                                     ; preds = %18, %13
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %13

._crit_edge25.loopexit:                           ; preds = %._crit_edge23.us
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %2
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #6 = { cold nounwind }

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

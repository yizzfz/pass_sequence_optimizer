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
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
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
  br i1 true, label %.preheader19.lr.ph, label %.loopexit34

.preheader19.lr.ph:                               ; preds = %3
  br label %.preheader.lr.ph.us

.loopexit.loopexit:                               ; preds = %.unr-lcssa
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader.lr.ph.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next40, 120
  br i1 %exitcond43, label %.loopexit34.loopexit, label %.preheader.lr.ph.us

.preheader.lr.ph.us:                              ; preds = %.loopexit, %.preheader19.lr.ph
  %indvars.iv39 = phi i64 [ 0, %.preheader19.lr.ph ], [ %indvars.iv.next40, %.loopexit ]
  %4 = trunc i64 %indvars.iv39 to i32
  %5 = add i32 %4, 120
  br i1 true, label %.lr.ph.us.us.preheader, label %.loopexit

.lr.ph.us.us.preheader:                           ; preds = %.preheader.lr.ph.us
  br label %.lr.ph.us.us

.unr-lcssa.loopexit:                              ; preds = %.lr.ph.us.us.new
  br label %.unr-lcssa

.unr-lcssa:                                       ; preds = %.unr-lcssa.loopexit, %.prol.loopexit
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond = icmp eq i64 %indvars.iv.next36, 120
  br i1 %exitcond, label %.loopexit.loopexit, label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %.unr-lcssa
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %.unr-lcssa ], [ 0, %.lr.ph.us.us.preheader ]
  %6 = trunc i64 %indvars.iv35 to i32
  %7 = add i32 %5, %6
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 false, label %.unr-lcssa, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sub i32 %7, %8
  %10 = sitofp i32 %9 to double
  %11 = fmul double %10, 1.000000e+01
  %12 = fdiv double %11, 1.200000e+02
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  store double %12, double* %14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %16 = sub i32 %7, %15
  %17 = sitofp i32 %16 to double
  %18 = fmul double %17, 1.000000e+01
  %19 = fdiv double %18, 1.200000e+02
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv.next
  store double %19, double* %20, align 8
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv.next
  store double %19, double* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %.unr-lcssa.loopexit, label %.lr.ph.us.us.new

.loopexit34.loopexit:                             ; preds = %.loopexit
  br label %.loopexit34

.loopexit34:                                      ; preds = %.loopexit34.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader110

.preheader110:                                    ; preds = %.loopexit126, %4
  %storemerge122 = phi i32 [ 1, %4 ], [ %165, %.loopexit126 ]
  br i1 true, label %.preheader108.preheader, label %.preheader109

.preheader108.preheader:                          ; preds = %.preheader110
  br label %.preheader108

.preheader109.loopexit:                           ; preds = %.loopexit124
  br label %.preheader109

.preheader109:                                    ; preds = %.preheader109.loopexit, %.preheader110
  br i1 true, label %.preheader107.preheader, label %.loopexit126

.preheader107.preheader:                          ; preds = %.preheader109
  br label %.preheader107

.preheader108:                                    ; preds = %.preheader108.preheader, %.loopexit124
  %indvar180 = phi i64 [ %indvar.next181, %.loopexit124 ], [ 0, %.preheader108.preheader ]
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %.loopexit124 ], [ 1, %.preheader108.preheader ]
  %5 = add i64 %indvar180, 1
  %6 = add i64 %indvar180, 2
  br i1 true, label %.preheader106.lr.ph, label %.loopexit124

.preheader106.lr.ph:                              ; preds = %.preheader108
  %7 = add nuw nsw i64 %indvars.iv131, 1
  %8 = add nsw i64 %indvars.iv131, -1
  br i1 true, label %.lr.ph.us.preheader, label %.loopexit124

.lr.ph.us.preheader:                              ; preds = %.preheader106.lr.ph
  br label %.lr.ph.us

.loopexit218.loopexit:                            ; preds = %._crit_edge
  br label %.loopexit218

.loopexit218:                                     ; preds = %.loopexit218.loopexit, %middle.block172
  %exitcond130 = icmp eq i64 %indvars.iv.next128, 119
  %indvar.next183 = add i64 %indvar182, 1
  br i1 %exitcond130, label %.loopexit124.loopexit, label %.lr.ph.us

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ %indvars.iv.ph, %._crit_edge.preheader ]
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %7, i64 %indvars.iv127, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %indvars.iv127, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, 2.000000e+00
  %14 = fsub double %10, %13
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %8, i64 %indvars.iv127, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  %18 = fmul double %17, 1.250000e-01
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %indvars.iv.next128, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %indvars.iv127, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, 2.000000e+00
  %24 = fsub double %20, %23
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %47, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fadd double %26, %24
  %28 = fmul double %27, 1.250000e-01
  %29 = fadd double %18, %28
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %indvars.iv127, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %indvars.iv127, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, 2.000000e+00
  %35 = fsub double %31, %34
  %36 = add nsw i64 %indvars.iv, -1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %indvars.iv127, i64 %36
  %38 = load double, double* %37, align 8
  %39 = fadd double %38, %35
  %40 = fmul double %39, 1.250000e-01
  %41 = fadd double %29, %40
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %indvars.iv127, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = fadd double %43, %41
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv131, i64 %indvars.iv127, i64 %indvars.iv
  store double %44, double* %45, align 8
  %exitcond149 = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond149, label %.loopexit218.loopexit, label %._crit_edge, !llvm.loop !1

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %.loopexit218
  %indvar182 = phi i64 [ %indvar.next183, %.loopexit218 ], [ 0, %.lr.ph.us.preheader ]
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %.loopexit218 ], [ 1, %.lr.ph.us.preheader ]
  %46 = add i64 %indvar182, 1
  %scevgep184 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %5, i64 %46, i64 1
  %scevgep186 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %5, i64 %46, i64 119
  %scevgep188 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar180, i64 %46, i64 1
  %scevgep190 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %6, i64 %46, i64 119
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %47 = add nsw i64 %indvars.iv127, -1
  br i1 false, label %._crit_edge.preheader, label %min.iters.checked175

._crit_edge.preheader:                            ; preds = %middle.block172, %vector.memcheck196, %min.iters.checked175, %.lr.ph.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck196 ], [ 1, %min.iters.checked175 ], [ 1, %.lr.ph.us ], [ 119, %middle.block172 ]
  br label %._crit_edge

min.iters.checked175:                             ; preds = %.lr.ph.us
  br i1 false, label %._crit_edge.preheader, label %vector.memcheck196

vector.memcheck196:                               ; preds = %min.iters.checked175
  %bound0192 = icmp ult double* %scevgep184, %scevgep190
  %bound1193 = icmp ult double* %scevgep188, %scevgep186
  %memcheck.conflict195 = and i1 %bound0192, %bound1193
  br i1 %memcheck.conflict195, label %._crit_edge.preheader, label %vector.body171.preheader

vector.body171.preheader:                         ; preds = %vector.memcheck196
  br label %vector.body171

vector.body171:                                   ; preds = %vector.body171.preheader, %vector.body171
  %index198 = phi i64 [ %index.next199, %vector.body171 ], [ 0, %vector.body171.preheader ]
  %offset.idx203 = or i64 %index198, 1
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %7, i64 %indvars.iv127, i64 %offset.idx203
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load207 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !4
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %indvars.iv127, i64 %offset.idx203
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load208 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !4
  %52 = fmul <2 x double> %wide.load208, <double 2.000000e+00, double 2.000000e+00>
  %53 = fsub <2 x double> %wide.load207, %52
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %8, i64 %indvars.iv127, i64 %offset.idx203
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load209 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !4
  %56 = fadd <2 x double> %wide.load209, %53
  %57 = fmul <2 x double> %56, <double 1.250000e-01, double 1.250000e-01>
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %indvars.iv.next128, i64 %offset.idx203
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load210 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !4
  %60 = bitcast double* %50 to <2 x double>*
  %wide.load211 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !4
  %61 = fmul <2 x double> %wide.load211, <double 2.000000e+00, double 2.000000e+00>
  %62 = fsub <2 x double> %wide.load210, %61
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %47, i64 %offset.idx203
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load212 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !4
  %65 = fadd <2 x double> %wide.load212, %62
  %66 = fmul <2 x double> %65, <double 1.250000e-01, double 1.250000e-01>
  %67 = fadd <2 x double> %57, %66
  %68 = add nuw nsw i64 %offset.idx203, 1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %indvars.iv127, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load213 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !4
  %71 = bitcast double* %50 to <2 x double>*
  %wide.load214 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !4
  %72 = fmul <2 x double> %wide.load214, <double 2.000000e+00, double 2.000000e+00>
  %73 = fsub <2 x double> %wide.load213, %72
  %74 = add nsw i64 %offset.idx203, -1
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %indvars.iv127, i64 %74
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load215 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !4
  %77 = fadd <2 x double> %wide.load215, %73
  %78 = fmul <2 x double> %77, <double 1.250000e-01, double 1.250000e-01>
  %79 = fadd <2 x double> %67, %78
  %80 = bitcast double* %50 to <2 x double>*
  %wide.load216 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !4
  %81 = fadd <2 x double> %wide.load216, %79
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv131, i64 %indvars.iv127, i64 %offset.idx203
  %83 = bitcast double* %82 to <2 x double>*
  store <2 x double> %81, <2 x double>* %83, align 8, !alias.scope !7, !noalias !4
  %index.next199 = add i64 %index198, 2
  %84 = icmp eq i64 %index.next199, 118
  br i1 %84, label %middle.block172, label %vector.body171, !llvm.loop !9

middle.block172:                                  ; preds = %vector.body171
  br i1 true, label %.loopexit218, label %._crit_edge.preheader

.loopexit124.loopexit:                            ; preds = %.loopexit218
  br label %.loopexit124

.loopexit124:                                     ; preds = %.loopexit124.loopexit, %.preheader106.lr.ph, %.preheader108
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond = icmp eq i64 %indvars.iv.next132, 119
  %indvar.next181 = add i64 %indvar180, 1
  br i1 %exitcond, label %.preheader109.loopexit, label %.preheader108

.preheader107:                                    ; preds = %.preheader107.preheader, %.loopexit
  %indvar = phi i64 [ %indvar.next, %.loopexit ], [ 0, %.preheader107.preheader ]
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %.loopexit ], [ 1, %.preheader107.preheader ]
  %85 = add i64 %indvar, 1
  %86 = add i64 %indvar, 2
  br i1 true, label %.preheader.lr.ph, label %.loopexit

.preheader.lr.ph:                                 ; preds = %.preheader107
  %87 = add nuw nsw i64 %indvars.iv144, 1
  %88 = add nsw i64 %indvars.iv144, -1
  br i1 true, label %.lr.ph116.us.preheader, label %.loopexit

.lr.ph116.us.preheader:                           ; preds = %.preheader.lr.ph
  br label %.lr.ph116.us

.loopexit217.loopexit:                            ; preds = %._crit_edge152
  br label %.loopexit217

.loopexit217:                                     ; preds = %.loopexit217.loopexit, %middle.block
  %exitcond143 = icmp eq i64 %indvars.iv.next141, 119
  %indvar.next154 = add i64 %indvar153, 1
  br i1 %exitcond143, label %.loopexit.loopexit, label %.lr.ph116.us

._crit_edge152:                                   ; preds = %._crit_edge152.preheader, %._crit_edge152
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %._crit_edge152 ], [ %indvars.iv136.ph, %._crit_edge152.preheader ]
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %87, i64 %indvars.iv140, i64 %indvars.iv136
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv144, i64 %indvars.iv140, i64 %indvars.iv136
  %92 = load double, double* %91, align 8
  %93 = fmul double %92, 2.000000e+00
  %94 = fsub double %90, %93
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %88, i64 %indvars.iv140, i64 %indvars.iv136
  %96 = load double, double* %95, align 8
  %97 = fadd double %96, %94
  %98 = fmul double %97, 1.250000e-01
  %99 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv144, i64 %indvars.iv.next141, i64 %indvars.iv136
  %100 = load double, double* %99, align 8
  %101 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv144, i64 %indvars.iv140, i64 %indvars.iv136
  %102 = load double, double* %101, align 8
  %103 = fmul double %102, 2.000000e+00
  %104 = fsub double %100, %103
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv144, i64 %127, i64 %indvars.iv136
  %106 = load double, double* %105, align 8
  %107 = fadd double %106, %104
  %108 = fmul double %107, 1.250000e-01
  %109 = fadd double %98, %108
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv144, i64 %indvars.iv140, i64 %indvars.iv.next137
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv144, i64 %indvars.iv140, i64 %indvars.iv136
  %113 = load double, double* %112, align 8
  %114 = fmul double %113, 2.000000e+00
  %115 = fsub double %111, %114
  %116 = add nsw i64 %indvars.iv136, -1
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv144, i64 %indvars.iv140, i64 %116
  %118 = load double, double* %117, align 8
  %119 = fadd double %118, %115
  %120 = fmul double %119, 1.250000e-01
  %121 = fadd double %109, %120
  %122 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv144, i64 %indvars.iv140, i64 %indvars.iv136
  %123 = load double, double* %122, align 8
  %124 = fadd double %123, %121
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv144, i64 %indvars.iv140, i64 %indvars.iv136
  store double %124, double* %125, align 8
  %exitcond150 = icmp eq i64 %indvars.iv.next137, 119
  br i1 %exitcond150, label %.loopexit217.loopexit, label %._crit_edge152, !llvm.loop !10

.lr.ph116.us:                                     ; preds = %.lr.ph116.us.preheader, %.loopexit217
  %indvar153 = phi i64 [ %indvar.next154, %.loopexit217 ], [ 0, %.lr.ph116.us.preheader ]
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %.loopexit217 ], [ 1, %.lr.ph116.us.preheader ]
  %126 = add i64 %indvar153, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %85, i64 %126, i64 1
  %scevgep156 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %85, i64 %126, i64 119
  %scevgep158 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %126, i64 1
  %scevgep160 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %86, i64 %126, i64 119
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %127 = add nsw i64 %indvars.iv140, -1
  br i1 false, label %._crit_edge152.preheader, label %min.iters.checked

._crit_edge152.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph116.us
  %indvars.iv136.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.lr.ph116.us ], [ 119, %middle.block ]
  br label %._crit_edge152

min.iters.checked:                                ; preds = %.lr.ph116.us
  br i1 false, label %._crit_edge152.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep160
  %bound1 = icmp ult double* %scevgep158, %scevgep156
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge152.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %128 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %87, i64 %indvars.iv140, i64 %offset.idx
  %129 = bitcast double* %128 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %129, align 8, !alias.scope !11
  %130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv144, i64 %indvars.iv140, i64 %offset.idx
  %131 = bitcast double* %130 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %131, align 8, !alias.scope !11
  %132 = fmul <2 x double> %wide.load162, <double 2.000000e+00, double 2.000000e+00>
  %133 = fsub <2 x double> %wide.load, %132
  %134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %88, i64 %indvars.iv140, i64 %offset.idx
  %135 = bitcast double* %134 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %135, align 8, !alias.scope !11
  %136 = fadd <2 x double> %wide.load163, %133
  %137 = fmul <2 x double> %136, <double 1.250000e-01, double 1.250000e-01>
  %138 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv144, i64 %indvars.iv.next141, i64 %offset.idx
  %139 = bitcast double* %138 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %139, align 8, !alias.scope !11
  %140 = bitcast double* %130 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %140, align 8, !alias.scope !11
  %141 = fmul <2 x double> %wide.load165, <double 2.000000e+00, double 2.000000e+00>
  %142 = fsub <2 x double> %wide.load164, %141
  %143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv144, i64 %127, i64 %offset.idx
  %144 = bitcast double* %143 to <2 x double>*
  %wide.load166 = load <2 x double>, <2 x double>* %144, align 8, !alias.scope !11
  %145 = fadd <2 x double> %wide.load166, %142
  %146 = fmul <2 x double> %145, <double 1.250000e-01, double 1.250000e-01>
  %147 = fadd <2 x double> %137, %146
  %148 = add nuw nsw i64 %offset.idx, 1
  %149 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv144, i64 %indvars.iv140, i64 %148
  %150 = bitcast double* %149 to <2 x double>*
  %wide.load167 = load <2 x double>, <2 x double>* %150, align 8, !alias.scope !11
  %151 = bitcast double* %130 to <2 x double>*
  %wide.load168 = load <2 x double>, <2 x double>* %151, align 8, !alias.scope !11
  %152 = fmul <2 x double> %wide.load168, <double 2.000000e+00, double 2.000000e+00>
  %153 = fsub <2 x double> %wide.load167, %152
  %154 = add nsw i64 %offset.idx, -1
  %155 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv144, i64 %indvars.iv140, i64 %154
  %156 = bitcast double* %155 to <2 x double>*
  %wide.load169 = load <2 x double>, <2 x double>* %156, align 8, !alias.scope !11
  %157 = fadd <2 x double> %wide.load169, %153
  %158 = fmul <2 x double> %157, <double 1.250000e-01, double 1.250000e-01>
  %159 = fadd <2 x double> %147, %158
  %160 = bitcast double* %130 to <2 x double>*
  %wide.load170 = load <2 x double>, <2 x double>* %160, align 8, !alias.scope !11
  %161 = fadd <2 x double> %wide.load170, %159
  %162 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv144, i64 %indvars.iv140, i64 %offset.idx
  %163 = bitcast double* %162 to <2 x double>*
  store <2 x double> %161, <2 x double>* %163, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 2
  %164 = icmp eq i64 %index.next, 118
  br i1 %164, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 true, label %.loopexit217, label %._crit_edge152.preheader

.loopexit.loopexit:                               ; preds = %.loopexit217
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader.lr.ph, %.preheader107
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond151 = icmp eq i64 %indvars.iv.next145, 119
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond151, label %.loopexit126.loopexit, label %.preheader107

.loopexit126.loopexit:                            ; preds = %.loopexit
  br label %.loopexit126

.loopexit126:                                     ; preds = %.loopexit126.loopexit, %.preheader109
  %165 = add nuw nsw i32 %storemerge122, 1
  %exitcond148 = icmp eq i32 %165, 501
  br i1 %exitcond148, label %166, label %.preheader110

; <label>:166:                                    ; preds = %.loopexit126
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.lr.ph.us.preheader, label %.loopexit30

.preheader.lr.ph.us.preheader:                    ; preds = %2
  br label %.preheader.lr.ph.us

.loopexit.loopexit:                               ; preds = %8
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader.lr.ph.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next36, 120
  br i1 %exitcond40, label %.loopexit30.loopexit, label %.preheader.lr.ph.us

.preheader.lr.ph.us:                              ; preds = %.loopexit, %.preheader.lr.ph.us.preheader
  %indvars.iv35 = phi i64 [ 0, %.preheader.lr.ph.us.preheader ], [ %indvars.iv.next36, %.loopexit ]
  br i1 true, label %.lr.ph.us.us.preheader, label %.loopexit

.lr.ph.us.us.preheader:                           ; preds = %.preheader.lr.ph.us
  %7 = mul nsw i64 %indvars.iv35, 120
  br label %.lr.ph.us.us

; <label>:8:                                      ; preds = %._crit_edge
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next32, 120
  br i1 %exitcond, label %.loopexit.loopexit, label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %8, %.lr.ph.us.us.preheader
  %indvars.iv31 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next32, %8 ]
  %9 = add i64 %indvars.iv31, %7
  %10 = mul i64 %9, 120
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next, %._crit_edge ]
  %11 = add i64 %indvars.iv, %10
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %._crit_edge41
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge41, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv35, i64 %indvars.iv31, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond39, label %8, label %._crit_edge41

.loopexit30.loopexit:                             ; preds = %.loopexit
  br label %.loopexit30

.loopexit30:                                      ; preds = %.loopexit30.loopexit, %2
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !2, !3}
!10 = distinct !{!10, !2, !3}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !2, !3}

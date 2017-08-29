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
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader19.lr.ph, label %._crit_edge24

.preheader19.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = zext i32 %0 to i64
  %xtraiter = and i64 %6, 1
  %7 = icmp eq i64 %xtraiter, 0
  %8 = icmp eq i32 %0, 1
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader19.lr.ph, %._crit_edge22.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge22.us ], [ 0, %.preheader19.lr.ph ]
  %9 = trunc i64 %indvars.iv40 to i32
  %10 = add i32 %9, %0
  br label %.preheader.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next41, %6
  br i1 %exitcond44, label %._crit_edge24.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv36 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next37, %._crit_edge.us.us ]
  %11 = trunc i64 %indvars.iv36 to i32
  %12 = add i32 %10, %11
  br i1 %7, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %13 = sitofp i32 %12 to double
  %14 = fmul double %13, 1.000000e+01
  %15 = fdiv double %14, %5
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv40, i64 %indvars.iv36, i64 0
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv40, i64 %indvars.iv36, i64 0
  store double %15, double* %17, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %8, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, %6
  br i1 %exitcond, label %._crit_edge22.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %18 = sub nsw i64 0, %indvars.iv
  %19 = trunc i64 %18 to i32
  %20 = add i32 %12, %19
  %21 = sitofp i32 %20 to double
  %22 = fmul double %21, 1.000000e+01
  %23 = fdiv double %22, %5
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv40, i64 %indvars.iv36, i64 %indvars.iv
  store double %23, double* %24, align 8
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv40, i64 %indvars.iv36, i64 %indvars.iv
  store double %23, double* %25, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = trunc i64 %indvars.iv to i32
  %27 = xor i32 %26, -1
  %28 = add i32 %12, %27
  %29 = sitofp i32 %28 to double
  %30 = fmul double %29, 1.000000e+01
  %31 = fdiv double %30, %5
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv40, i64 %indvars.iv36, i64 %indvars.iv.next
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv40, i64 %indvars.iv36, i64 %indvars.iv.next
  store double %31, double* %33, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %6
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge24.loopexit:                           ; preds = %._crit_edge22.us
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  %5 = add nsw i32 %1, -1
  %6 = add nsw i32 %1, -1
  %7 = add nsw i32 %1, -1
  %8 = add nsw i32 %1, -1
  %9 = add nsw i32 %1, -1
  %10 = add nsw i32 %1, -1
  %11 = zext i32 %6 to i64
  %12 = zext i32 %6 to i64
  %13 = zext i32 %6 to i64
  %14 = zext i32 %6 to i64
  %wide.trip.count128 = zext i32 %6 to i64
  %wide.trip.count141 = zext i32 %6 to i64
  %15 = add nsw i64 %13, -1
  %16 = icmp sgt i32 %5, 1
  %17 = icmp sgt i32 %8, 1
  %18 = icmp sgt i32 %9, 1
  %19 = icmp sgt i32 %10, 1
  %min.iters.check = icmp ult i64 %15, 2
  %n.vec = and i64 %15, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %15, 1
  %cmp.n = icmp eq i64 %15, %n.vec
  %20 = icmp sgt i32 %6, 1
  %21 = icmp sgt i32 %7, 1
  %min.iters.check172 = icmp ult i64 %15, 2
  %n.vec175 = and i64 %15, -2
  %cmp.zero176 = icmp eq i64 %n.vec175, 0
  %ind.end199 = or i64 %15, 1
  %cmp.n200 = icmp eq i64 %15, %n.vec175
  br label %.preheader110

.preheader110:                                    ; preds = %._crit_edge121, %4
  %storemerge122 = phi i32 [ 1, %4 ], [ %182, %._crit_edge121 ]
  br i1 %16, label %.preheader108.preheader, label %.preheader109

.preheader108.preheader:                          ; preds = %.preheader110
  br label %.preheader108

.preheader109.loopexit:                           ; preds = %._crit_edge113
  br label %.preheader109

.preheader109:                                    ; preds = %.preheader109.loopexit, %.preheader110
  br i1 %17, label %.preheader107.preheader, label %._crit_edge121

.preheader107.preheader:                          ; preds = %.preheader109
  br label %.preheader107

.preheader108:                                    ; preds = %.preheader108.preheader, %._crit_edge113
  %indvar178 = phi i64 [ %indvar.next179, %._crit_edge113 ], [ 0, %.preheader108.preheader ]
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %._crit_edge113 ], [ 1, %.preheader108.preheader ]
  %22 = add i64 %indvar178, 1
  %23 = add i64 %indvar178, 2
  br i1 %20, label %.preheader106.lr.ph, label %._crit_edge113

.preheader106.lr.ph:                              ; preds = %.preheader108
  %24 = add nuw nsw i64 %indvars.iv130, 1
  %25 = add nsw i64 %indvars.iv130, -1
  br i1 %21, label %.preheader106.us.preheader, label %._crit_edge113

.preheader106.us.preheader:                       ; preds = %.preheader106.lr.ph
  br label %.preheader106.us

.preheader106.us:                                 ; preds = %.preheader106.us.preheader, %._crit_edge.us
  %indvar180 = phi i64 [ %indvar.next181, %._crit_edge.us ], [ 0, %.preheader106.us.preheader ]
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %._crit_edge.us ], [ 1, %.preheader106.us.preheader ]
  %26 = add i64 %indvar180, 1
  %scevgep182 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %22, i64 %26, i64 1
  %scevgep184 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %22, i64 %26, i64 %13
  %scevgep186 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar178, i64 %26, i64 1
  %scevgep188 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %23, i64 %26, i64 %13
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %27 = add nsw i64 %indvars.iv126, -1
  br i1 %min.iters.check172, label %scalar.ph171.preheader, label %min.iters.checked173

min.iters.checked173:                             ; preds = %.preheader106.us
  br i1 %cmp.zero176, label %scalar.ph171.preheader, label %vector.memcheck194

vector.memcheck194:                               ; preds = %min.iters.checked173
  %bound0190 = icmp ult double* %scevgep182, %scevgep188
  %bound1191 = icmp ult double* %scevgep186, %scevgep184
  %memcheck.conflict193 = and i1 %bound0190, %bound1191
  br i1 %memcheck.conflict193, label %scalar.ph171.preheader, label %vector.body169.preheader

vector.body169.preheader:                         ; preds = %vector.memcheck194
  br label %vector.body169

vector.body169:                                   ; preds = %vector.body169.preheader, %vector.body169
  %index196 = phi i64 [ %index.next197, %vector.body169 ], [ 0, %vector.body169.preheader ]
  %offset.idx201 = or i64 %index196, 1
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %24, i64 %indvars.iv126, i64 %offset.idx201
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load205 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv126, i64 %offset.idx201
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load206 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fmul <2 x double> %wide.load206, <double 2.000000e+00, double 2.000000e+00>
  %33 = fsub <2 x double> %wide.load205, %32
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %25, i64 %indvars.iv126, i64 %offset.idx201
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load207 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = fadd <2 x double> %wide.load207, %33
  %37 = fmul <2 x double> %36, <double 1.250000e-01, double 1.250000e-01>
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv.next127, i64 %offset.idx201
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load208 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !1
  %40 = bitcast double* %30 to <2 x double>*
  %wide.load209 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fmul <2 x double> %wide.load209, <double 2.000000e+00, double 2.000000e+00>
  %42 = fsub <2 x double> %wide.load208, %41
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %27, i64 %offset.idx201
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load210 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !1
  %45 = fadd <2 x double> %wide.load210, %42
  %46 = fmul <2 x double> %45, <double 1.250000e-01, double 1.250000e-01>
  %47 = fadd <2 x double> %37, %46
  %48 = add nuw nsw i64 %offset.idx201, 1
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv126, i64 %48
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load211 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !1
  %51 = bitcast double* %30 to <2 x double>*
  %wide.load212 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !1
  %52 = fmul <2 x double> %wide.load212, <double 2.000000e+00, double 2.000000e+00>
  %53 = fsub <2 x double> %wide.load211, %52
  %54 = add nsw i64 %offset.idx201, -1
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv126, i64 %54
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load213 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !1
  %57 = fadd <2 x double> %wide.load213, %53
  %58 = fmul <2 x double> %57, <double 1.250000e-01, double 1.250000e-01>
  %59 = fadd <2 x double> %47, %58
  %60 = bitcast double* %30 to <2 x double>*
  %wide.load214 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !1
  %61 = fadd <2 x double> %wide.load214, %59
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv130, i64 %indvars.iv126, i64 %offset.idx201
  %63 = bitcast double* %62 to <2 x double>*
  store <2 x double> %61, <2 x double>* %63, align 8, !alias.scope !4, !noalias !1
  %index.next197 = add i64 %index196, 2
  %64 = icmp eq i64 %index.next197, %n.vec175
  br i1 %64, label %middle.block170, label %vector.body169, !llvm.loop !6

middle.block170:                                  ; preds = %vector.body169
  br i1 %cmp.n200, label %._crit_edge.us, label %scalar.ph171.preheader

scalar.ph171.preheader:                           ; preds = %middle.block170, %vector.memcheck194, %min.iters.checked173, %.preheader106.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck194 ], [ 1, %min.iters.checked173 ], [ 1, %.preheader106.us ], [ %ind.end199, %middle.block170 ]
  br label %scalar.ph171

scalar.ph171:                                     ; preds = %scalar.ph171.preheader, %scalar.ph171
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph171 ], [ %indvars.iv.ph, %scalar.ph171.preheader ]
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %24, i64 %indvars.iv126, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv126, i64 %indvars.iv
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, 2.000000e+00
  %70 = fsub double %66, %69
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %25, i64 %indvars.iv126, i64 %indvars.iv
  %72 = load double, double* %71, align 8
  %73 = fadd double %72, %70
  %74 = fmul double %73, 1.250000e-01
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv.next127, i64 %indvars.iv
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv126, i64 %indvars.iv
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, 2.000000e+00
  %80 = fsub double %76, %79
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %27, i64 %indvars.iv
  %82 = load double, double* %81, align 8
  %83 = fadd double %82, %80
  %84 = fmul double %83, 1.250000e-01
  %85 = fadd double %74, %84
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv126, i64 %indvars.iv.next
  %87 = load double, double* %86, align 8
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv126, i64 %indvars.iv
  %89 = load double, double* %88, align 8
  %90 = fmul double %89, 2.000000e+00
  %91 = fsub double %87, %90
  %92 = add nsw i64 %indvars.iv, -1
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv126, i64 %92
  %94 = load double, double* %93, align 8
  %95 = fadd double %94, %91
  %96 = fmul double %95, 1.250000e-01
  %97 = fadd double %85, %96
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv130, i64 %indvars.iv126, i64 %indvars.iv
  %99 = load double, double* %98, align 8
  %100 = fadd double %99, %97
  %101 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv130, i64 %indvars.iv126, i64 %indvars.iv
  store double %100, double* %101, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %11
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph171, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph171
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block170
  %exitcond129 = icmp eq i64 %indvars.iv.next127, %wide.trip.count128
  %indvar.next181 = add i64 %indvar180, 1
  br i1 %exitcond129, label %._crit_edge113.loopexit, label %.preheader106.us

._crit_edge113.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit, %.preheader106.lr.ph, %.preheader108
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %exitcond148 = icmp eq i64 %indvars.iv.next131, %12
  %indvar.next179 = add i64 %indvar178, 1
  br i1 %exitcond148, label %.preheader109.loopexit, label %.preheader108

.preheader107:                                    ; preds = %.preheader107.preheader, %._crit_edge119
  %indvar = phi i64 [ %indvar.next, %._crit_edge119 ], [ 0, %.preheader107.preheader ]
  %indvars.iv143 = phi i64 [ %indvars.iv.next144, %._crit_edge119 ], [ 1, %.preheader107.preheader ]
  %102 = add i64 %indvar, 1
  %103 = add i64 %indvar, 2
  br i1 %18, label %.preheader.lr.ph, label %._crit_edge119

.preheader.lr.ph:                                 ; preds = %.preheader107
  %104 = add nuw nsw i64 %indvars.iv143, 1
  %105 = add nsw i64 %indvars.iv143, -1
  br i1 %19, label %.preheader.us.preheader, label %._crit_edge119

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge117.us
  %indvar151 = phi i64 [ %indvar.next152, %._crit_edge117.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %._crit_edge117.us ], [ 1, %.preheader.us.preheader ]
  %106 = add i64 %indvar151, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %102, i64 %106, i64 1
  %scevgep154 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %102, i64 %106, i64 %13
  %scevgep156 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %106, i64 1
  %scevgep158 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %103, i64 %106, i64 %13
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %107 = add nsw i64 %indvars.iv139, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep158
  %bound1 = icmp ult double* %scevgep156, %scevgep154
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %104, i64 %indvars.iv139, i64 %offset.idx
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !10
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv143, i64 %indvars.iv139, i64 %offset.idx
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !10
  %112 = fmul <2 x double> %wide.load160, <double 2.000000e+00, double 2.000000e+00>
  %113 = fsub <2 x double> %wide.load, %112
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %105, i64 %indvars.iv139, i64 %offset.idx
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !10
  %116 = fadd <2 x double> %wide.load161, %113
  %117 = fmul <2 x double> %116, <double 1.250000e-01, double 1.250000e-01>
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv143, i64 %indvars.iv.next140, i64 %offset.idx
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !10
  %120 = bitcast double* %110 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !10
  %121 = fmul <2 x double> %wide.load163, <double 2.000000e+00, double 2.000000e+00>
  %122 = fsub <2 x double> %wide.load162, %121
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv143, i64 %107, i64 %offset.idx
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !10
  %125 = fadd <2 x double> %wide.load164, %122
  %126 = fmul <2 x double> %125, <double 1.250000e-01, double 1.250000e-01>
  %127 = fadd <2 x double> %117, %126
  %128 = add nuw nsw i64 %offset.idx, 1
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv143, i64 %indvars.iv139, i64 %128
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !10
  %131 = bitcast double* %110 to <2 x double>*
  %wide.load166 = load <2 x double>, <2 x double>* %131, align 8, !alias.scope !10
  %132 = fmul <2 x double> %wide.load166, <double 2.000000e+00, double 2.000000e+00>
  %133 = fsub <2 x double> %wide.load165, %132
  %134 = add nsw i64 %offset.idx, -1
  %135 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv143, i64 %indvars.iv139, i64 %134
  %136 = bitcast double* %135 to <2 x double>*
  %wide.load167 = load <2 x double>, <2 x double>* %136, align 8, !alias.scope !10
  %137 = fadd <2 x double> %wide.load167, %133
  %138 = fmul <2 x double> %137, <double 1.250000e-01, double 1.250000e-01>
  %139 = fadd <2 x double> %127, %138
  %140 = bitcast double* %110 to <2 x double>*
  %wide.load168 = load <2 x double>, <2 x double>* %140, align 8, !alias.scope !10
  %141 = fadd <2 x double> %wide.load168, %139
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv143, i64 %indvars.iv139, i64 %offset.idx
  %143 = bitcast double* %142 to <2 x double>*
  store <2 x double> %141, <2 x double>* %143, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %144 = icmp eq i64 %index.next, %n.vec
  br i1 %144, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge117.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv135.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %scalar.ph ], [ %indvars.iv135.ph, %scalar.ph.preheader ]
  %145 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %104, i64 %indvars.iv139, i64 %indvars.iv135
  %146 = load double, double* %145, align 8
  %147 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv143, i64 %indvars.iv139, i64 %indvars.iv135
  %148 = load double, double* %147, align 8
  %149 = fmul double %148, 2.000000e+00
  %150 = fsub double %146, %149
  %151 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %105, i64 %indvars.iv139, i64 %indvars.iv135
  %152 = load double, double* %151, align 8
  %153 = fadd double %152, %150
  %154 = fmul double %153, 1.250000e-01
  %155 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv143, i64 %indvars.iv.next140, i64 %indvars.iv135
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv143, i64 %indvars.iv139, i64 %indvars.iv135
  %158 = load double, double* %157, align 8
  %159 = fmul double %158, 2.000000e+00
  %160 = fsub double %156, %159
  %161 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv143, i64 %107, i64 %indvars.iv135
  %162 = load double, double* %161, align 8
  %163 = fadd double %162, %160
  %164 = fmul double %163, 1.250000e-01
  %165 = fadd double %154, %164
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %166 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv143, i64 %indvars.iv139, i64 %indvars.iv.next136
  %167 = load double, double* %166, align 8
  %168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv143, i64 %indvars.iv139, i64 %indvars.iv135
  %169 = load double, double* %168, align 8
  %170 = fmul double %169, 2.000000e+00
  %171 = fsub double %167, %170
  %172 = add nsw i64 %indvars.iv135, -1
  %173 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv143, i64 %indvars.iv139, i64 %172
  %174 = load double, double* %173, align 8
  %175 = fadd double %174, %171
  %176 = fmul double %175, 1.250000e-01
  %177 = fadd double %165, %176
  %178 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv143, i64 %indvars.iv139, i64 %indvars.iv135
  %179 = load double, double* %178, align 8
  %180 = fadd double %179, %177
  %181 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv143, i64 %indvars.iv139, i64 %indvars.iv135
  store double %180, double* %181, align 8
  %exitcond149 = icmp eq i64 %indvars.iv.next136, %13
  br i1 %exitcond149, label %._crit_edge117.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge117.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge117.us

._crit_edge117.us:                                ; preds = %._crit_edge117.us.loopexit, %middle.block
  %exitcond142 = icmp eq i64 %indvars.iv.next140, %wide.trip.count141
  %indvar.next152 = add i64 %indvar151, 1
  br i1 %exitcond142, label %._crit_edge119.loopexit, label %.preheader.us

._crit_edge119.loopexit:                          ; preds = %._crit_edge117.us
  br label %._crit_edge119

._crit_edge119:                                   ; preds = %._crit_edge119.loopexit, %.preheader.lr.ph, %.preheader107
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %exitcond150 = icmp eq i64 %indvars.iv.next144, %14
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond150, label %._crit_edge121.loopexit, label %.preheader107

._crit_edge121.loopexit:                          ; preds = %._crit_edge119
  br label %._crit_edge121

._crit_edge121:                                   ; preds = %._crit_edge121.loopexit, %.preheader109
  %182 = add nuw nsw i32 %storemerge122, 1
  %exitcond147 = icmp eq i32 %182, 501
  br i1 %exitcond147, label %183, label %.preheader110

; <label>:183:                                    ; preds = %._crit_edge121
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
  br i1 %7, label %.preheader15.lr.ph, label %._crit_edge21

.preheader15.lr.ph:                               ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  %10 = zext i32 %0 to i64
  %11 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader15.lr.ph, %._crit_edge19.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge19.us ], [ 0, %.preheader15.lr.ph ]
  %12 = mul nsw i64 %indvars.iv37, %8
  %13 = trunc i64 %12 to i32
  br label %.preheader.us.us

._crit_edge19.us:                                 ; preds = %._crit_edge17.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next38, %11
  br i1 %exitcond42, label %._crit_edge21.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge17.us.us, %.preheader.us.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next34, %._crit_edge17.us.us ]
  %14 = trunc i64 %indvars.iv33 to i32
  %15 = add i32 %14, %13
  %16 = mul i32 %15, %0
  %17 = zext i32 %16 to i64
  br label %18

._crit_edge17.us.us:                              ; preds = %._crit_edge.us.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next34, %10
  br i1 %exitcond41, label %._crit_edge19.us, label %.preheader.us.us

; <label>:18:                                     ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %19 = add i64 %indvars.iv, %17
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %._crit_edge.us.us

; <label>:23:                                     ; preds = %18
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #4
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %18, %23
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %27) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond, label %._crit_edge17.us.us, label %18

._crit_edge21.loopexit:                           ; preds = %._crit_edge19.us
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %2
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #4
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

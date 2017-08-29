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
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader19.lr.ph, label %._crit_edge24

.preheader19.lr.ph:                               ; preds = %3
  %5 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %wide.trip.count.1 = zext i32 %0 to i64
  %6 = icmp eq i32 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader19.lr.ph, %._crit_edge22.us
  %storemerge23.us = phi i32 [ 0, %.preheader19.lr.ph ], [ %10, %._crit_edge22.us ]
  %8 = add i32 %storemerge23.us, %0
  %9 = sext i32 %storemerge23.us to i64
  br label %.preheader.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge.us.us
  %10 = add nsw i32 %storemerge23.us, 1
  %11 = icmp slt i32 %10, %0
  br i1 %11, label %.preheader.us.us.preheader, label %._crit_edge24.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %storemerge121.us.us = phi i32 [ %19, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %12 = add i32 %8, %storemerge121.us.us
  %13 = sext i32 %storemerge121.us.us to i64
  br i1 %6, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %14 = sitofp i32 %12 to double
  %15 = fmul double %14, 1.000000e+01
  %16 = fdiv double %15, %5
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %9, i64 %13, i64 0
  store double %16, double* %17, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %9, i64 %13, i64 0
  store double %16, double* %18, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %7, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %19 = add nsw i32 %storemerge121.us.us, 1
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %.preheader.us.us, label %._crit_edge22.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %21 = trunc i64 %indvars.iv to i32
  %22 = sub i32 %12, %21
  %23 = sitofp i32 %22 to double
  %24 = fmul double %23, 1.000000e+01
  %25 = fdiv double %24, %5
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %9, i64 %13, i64 %indvars.iv
  store double %25, double* %26, align 8
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %9, i64 %13, i64 %indvars.iv
  store double %25, double* %27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = trunc i64 %indvars.iv.next to i32
  %29 = sub i32 %12, %28
  %30 = sitofp i32 %29 to double
  %31 = fmul double %30, 1.000000e+01
  %32 = fdiv double %31, %5
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %9, i64 %13, i64 %indvars.iv.next
  store double %32, double* %33, align 8
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %9, i64 %13, i64 %indvars.iv.next
  store double %32, double* %34, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge24.loopexit:                           ; preds = %._crit_edge22.us
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  %5 = add nsw i32 %1, -1
  %wide.trip.count = zext i32 %5 to i64
  %wide.trip.count125 = zext i32 %5 to i64
  %wide.trip.count133 = zext i32 %5 to i64
  %wide.trip.count129 = zext i32 %5 to i64
  %6 = add nsw i64 %wide.trip.count129, -1
  %7 = icmp sgt i32 %5, 1
  %8 = icmp sgt i32 %5, 1
  %min.iters.check154 = icmp ult i64 %6, 2
  %n.vec157 = and i64 %6, -2
  %cmp.zero158 = icmp eq i64 %n.vec157, 0
  %ind.end181 = or i64 %6, 1
  %cmp.n182 = icmp eq i64 %6, %n.vec157
  %9 = icmp sgt i32 %5, 1
  %min.iters.check = icmp ult i64 %6, 2
  %n.vec = and i64 %6, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %6, 1
  %cmp.n = icmp eq i64 %6, %n.vec
  br label %.preheader110

.preheader110:                                    ; preds = %._crit_edge121, %4
  %storemerge122 = phi i32 [ 1, %4 ], [ %155, %._crit_edge121 ]
  br i1 %7, label %.preheader108.preheader, label %._crit_edge121

.preheader108.preheader:                          ; preds = %.preheader110
  br label %.preheader108

.preheader109:                                    ; preds = %._crit_edge113
  br i1 %9, label %.preheader.lr.ph.preheader, label %._crit_edge121

.preheader.lr.ph.preheader:                       ; preds = %.preheader109
  br label %.preheader.lr.ph

.preheader108:                                    ; preds = %.preheader108.preheader, %._crit_edge113
  %indvar160 = phi i64 [ %indvar.next161, %._crit_edge113 ], [ 0, %.preheader108.preheader ]
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %._crit_edge113 ], [ 1, %.preheader108.preheader ]
  %10 = add i64 %indvar160, 1
  %11 = add i64 %indvar160, 2
  br i1 %8, label %.preheader106.lr.ph, label %._crit_edge113

.preheader106.lr.ph:                              ; preds = %.preheader108
  %12 = add nuw nsw i64 %indvars.iv123, 1
  %13 = add nsw i64 %indvars.iv123, -1
  br label %.preheader106.us

.preheader106.us:                                 ; preds = %._crit_edge.us, %.preheader106.lr.ph
  %indvar162 = phi i64 [ %indvar.next163, %._crit_edge.us ], [ 0, %.preheader106.lr.ph ]
  %storemerge5112.us = phi i32 [ %81, %._crit_edge.us ], [ 1, %.preheader106.lr.ph ]
  %14 = add i64 %indvar162, 1
  %scevgep164 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %10, i64 %14, i64 1
  %scevgep166 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %10, i64 %14, i64 %wide.trip.count129
  %scevgep168 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar160, i64 %14, i64 1
  %scevgep170 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %11, i64 %14, i64 %wide.trip.count129
  %15 = sext i32 %storemerge5112.us to i64
  %16 = add nuw nsw i32 %storemerge5112.us, 1
  %17 = sext i32 %16 to i64
  %18 = add nsw i32 %storemerge5112.us, -1
  %19 = sext i32 %18 to i64
  br i1 %min.iters.check154, label %scalar.ph153.preheader, label %min.iters.checked155

min.iters.checked155:                             ; preds = %.preheader106.us
  br i1 %cmp.zero158, label %scalar.ph153.preheader, label %vector.memcheck176

vector.memcheck176:                               ; preds = %min.iters.checked155
  %bound0172 = icmp ult double* %scevgep164, %scevgep170
  %bound1173 = icmp ult double* %scevgep168, %scevgep166
  %memcheck.conflict175 = and i1 %bound0172, %bound1173
  br i1 %memcheck.conflict175, label %scalar.ph153.preheader, label %vector.body151.preheader

vector.body151.preheader:                         ; preds = %vector.memcheck176
  br label %vector.body151

vector.body151:                                   ; preds = %vector.body151.preheader, %vector.body151
  %index178 = phi i64 [ %index.next179, %vector.body151 ], [ 0, %vector.body151.preheader ]
  %offset.idx183 = or i64 %index178, 1
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %12, i64 %15, i64 %offset.idx183
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load187 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv123, i64 %15, i64 %offset.idx183
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load188 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fmul <2 x double> %wide.load188, <double 2.000000e+00, double 2.000000e+00>
  %25 = fsub <2 x double> %wide.load187, %24
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %13, i64 %15, i64 %offset.idx183
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load189 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %wide.load189, %25
  %29 = fmul <2 x double> %28, <double 1.250000e-01, double 1.250000e-01>
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv123, i64 %17, i64 %offset.idx183
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load190 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fsub <2 x double> %wide.load190, %24
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv123, i64 %19, i64 %offset.idx183
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load191 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %32, %wide.load191
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %29, %36
  %38 = add nuw nsw i64 %offset.idx183, 1
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv123, i64 %15, i64 %38
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load192 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fsub <2 x double> %wide.load192, %24
  %42 = add nsw i64 %offset.idx183, -1
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv123, i64 %15, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load193 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !1
  %45 = fadd <2 x double> %41, %wide.load193
  %46 = fmul <2 x double> %45, <double 1.250000e-01, double 1.250000e-01>
  %47 = fadd <2 x double> %37, %46
  %48 = fadd <2 x double> %wide.load188, %47
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv123, i64 %15, i64 %offset.idx183
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %48, <2 x double>* %50, align 8, !alias.scope !4, !noalias !1
  %index.next179 = add i64 %index178, 2
  %51 = icmp eq i64 %index.next179, %n.vec157
  br i1 %51, label %middle.block152, label %vector.body151, !llvm.loop !6

middle.block152:                                  ; preds = %vector.body151
  br i1 %cmp.n182, label %._crit_edge.us, label %scalar.ph153.preheader

scalar.ph153.preheader:                           ; preds = %middle.block152, %vector.memcheck176, %min.iters.checked155, %.preheader106.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck176 ], [ 1, %min.iters.checked155 ], [ 1, %.preheader106.us ], [ %ind.end181, %middle.block152 ]
  br label %scalar.ph153

scalar.ph153:                                     ; preds = %scalar.ph153.preheader, %scalar.ph153
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph153 ], [ %indvars.iv.ph, %scalar.ph153.preheader ]
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %12, i64 %15, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv123, i64 %15, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, 2.000000e+00
  %57 = fsub double %53, %56
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %13, i64 %15, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  %61 = fmul double %60, 1.250000e-01
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv123, i64 %17, i64 %indvars.iv
  %63 = load double, double* %62, align 8
  %64 = fsub double %63, %56
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv123, i64 %19, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  %68 = fmul double %67, 1.250000e-01
  %69 = fadd double %61, %68
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv123, i64 %15, i64 %indvars.iv.next
  %71 = load double, double* %70, align 8
  %72 = fsub double %71, %56
  %73 = add nsw i64 %indvars.iv, -1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv123, i64 %15, i64 %73
  %75 = load double, double* %74, align 8
  %76 = fadd double %72, %75
  %77 = fmul double %76, 1.250000e-01
  %78 = fadd double %69, %77
  %79 = fadd double %55, %78
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv123, i64 %15, i64 %indvars.iv
  store double %79, double* %80, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph153, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph153
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block152
  %81 = add nsw i32 %storemerge5112.us, 1
  %82 = icmp slt i32 %81, %5
  %indvar.next163 = add i64 %indvar162, 1
  br i1 %82, label %.preheader106.us, label %._crit_edge113.loopexit

._crit_edge113.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge113

._crit_edge113:                                   ; preds = %._crit_edge113.loopexit, %.preheader108
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next124, %wide.trip.count125
  %indvar.next161 = add i64 %indvar160, 1
  br i1 %exitcond126, label %.preheader109, label %.preheader108

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge119
  %indvar = phi i64 [ %indvar.next, %._crit_edge119 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %._crit_edge119 ], [ 1, %.preheader.lr.ph.preheader ]
  %83 = add i64 %indvar, 1
  %84 = add i64 %indvar, 2
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %85 = add nsw i64 %indvars.iv131, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge117.us, %.preheader.lr.ph
  %indvar136 = phi i64 [ %indvar.next137, %._crit_edge117.us ], [ 0, %.preheader.lr.ph ]
  %storemerge3118.us = phi i32 [ %153, %._crit_edge117.us ], [ 1, %.preheader.lr.ph ]
  %86 = add i64 %indvar136, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %83, i64 %86, i64 1
  %scevgep139 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %83, i64 %86, i64 %wide.trip.count129
  %scevgep141 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %86, i64 1
  %scevgep143 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %84, i64 %86, i64 %wide.trip.count129
  %87 = sext i32 %storemerge3118.us to i64
  %88 = add nuw nsw i32 %storemerge3118.us, 1
  %89 = sext i32 %88 to i64
  %90 = add nsw i32 %storemerge3118.us, -1
  %91 = sext i32 %90 to i64
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep143
  %bound1 = icmp ult double* %scevgep141, %scevgep139
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv.next132, i64 %87, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv131, i64 %87, i64 %offset.idx
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load145 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !10
  %96 = fmul <2 x double> %wide.load145, <double 2.000000e+00, double 2.000000e+00>
  %97 = fsub <2 x double> %wide.load, %96
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %85, i64 %87, i64 %offset.idx
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load146 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !10
  %100 = fadd <2 x double> %wide.load146, %97
  %101 = fmul <2 x double> %100, <double 1.250000e-01, double 1.250000e-01>
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv131, i64 %89, i64 %offset.idx
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load147 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !10
  %104 = fsub <2 x double> %wide.load147, %96
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv131, i64 %91, i64 %offset.idx
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load148 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !10
  %107 = fadd <2 x double> %104, %wide.load148
  %108 = fmul <2 x double> %107, <double 1.250000e-01, double 1.250000e-01>
  %109 = fadd <2 x double> %101, %108
  %110 = add nuw nsw i64 %offset.idx, 1
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv131, i64 %87, i64 %110
  %112 = bitcast double* %111 to <2 x double>*
  %wide.load149 = load <2 x double>, <2 x double>* %112, align 8, !alias.scope !10
  %113 = fsub <2 x double> %wide.load149, %96
  %114 = add nsw i64 %offset.idx, -1
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv131, i64 %87, i64 %114
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !10
  %117 = fadd <2 x double> %113, %wide.load150
  %118 = fmul <2 x double> %117, <double 1.250000e-01, double 1.250000e-01>
  %119 = fadd <2 x double> %109, %118
  %120 = fadd <2 x double> %wide.load145, %119
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %87, i64 %offset.idx
  %122 = bitcast double* %121 to <2 x double>*
  store <2 x double> %120, <2 x double>* %122, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %123 = icmp eq i64 %index.next, %n.vec
  br i1 %123, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge117.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv127.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %scalar.ph ], [ %indvars.iv127.ph, %scalar.ph.preheader ]
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv.next132, i64 %87, i64 %indvars.iv127
  %125 = load double, double* %124, align 8
  %126 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv131, i64 %87, i64 %indvars.iv127
  %127 = load double, double* %126, align 8
  %128 = fmul double %127, 2.000000e+00
  %129 = fsub double %125, %128
  %130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %85, i64 %87, i64 %indvars.iv127
  %131 = load double, double* %130, align 8
  %132 = fadd double %131, %129
  %133 = fmul double %132, 1.250000e-01
  %134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv131, i64 %89, i64 %indvars.iv127
  %135 = load double, double* %134, align 8
  %136 = fsub double %135, %128
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv131, i64 %91, i64 %indvars.iv127
  %138 = load double, double* %137, align 8
  %139 = fadd double %136, %138
  %140 = fmul double %139, 1.250000e-01
  %141 = fadd double %133, %140
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv131, i64 %87, i64 %indvars.iv.next128
  %143 = load double, double* %142, align 8
  %144 = fsub double %143, %128
  %145 = add nsw i64 %indvars.iv127, -1
  %146 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv131, i64 %87, i64 %145
  %147 = load double, double* %146, align 8
  %148 = fadd double %144, %147
  %149 = fmul double %148, 1.250000e-01
  %150 = fadd double %141, %149
  %151 = fadd double %127, %150
  %152 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv131, i64 %87, i64 %indvars.iv127
  store double %151, double* %152, align 8
  %exitcond130 = icmp eq i64 %indvars.iv.next128, %wide.trip.count129
  br i1 %exitcond130, label %._crit_edge117.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge117.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge117.us

._crit_edge117.us:                                ; preds = %._crit_edge117.us.loopexit, %middle.block
  %153 = add nsw i32 %storemerge3118.us, 1
  %154 = icmp slt i32 %153, %5
  %indvar.next137 = add i64 %indvar136, 1
  br i1 %154, label %.preheader.us, label %._crit_edge119

._crit_edge119:                                   ; preds = %._crit_edge117.us
  %exitcond134 = icmp eq i64 %indvars.iv.next132, %wide.trip.count133
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond134, label %._crit_edge121.loopexit, label %.preheader.lr.ph

._crit_edge121.loopexit:                          ; preds = %._crit_edge119
  br label %._crit_edge121

._crit_edge121:                                   ; preds = %._crit_edge121.loopexit, %.preheader110, %.preheader109
  %155 = add nuw nsw i32 %storemerge122, 1
  %exitcond135 = icmp eq i32 %155, 501
  br i1 %exitcond135, label %156, label %.preheader110

; <label>:156:                                    ; preds = %._crit_edge121
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.us.preheader.preheader, label %._crit_edge20

.preheader.us.us.preheader.preheader:             ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader.us.us.preheader.preheader, %._crit_edge18.us
  %storemerge19.us = phi i32 [ %10, %._crit_edge18.us ], [ 0, %.preheader.us.us.preheader.preheader ]
  %8 = mul nsw i32 %storemerge19.us, %0
  %9 = sext i32 %storemerge19.us to i64
  br label %.preheader.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge.us.us
  %10 = add nsw i32 %storemerge19.us, 1
  %11 = icmp slt i32 %10, %0
  br i1 %11, label %.preheader.us.us.preheader, label %._crit_edge20.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %storemerge117.us.us = phi i32 [ %16, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %12 = add i32 %storemerge117.us.us, %8
  %13 = mul i32 %12, %0
  %14 = sext i32 %storemerge117.us.us to i64
  %15 = zext i32 %13 to i64
  br label %18

._crit_edge.us.us:                                ; preds = %25
  %16 = add nsw i32 %storemerge117.us.us, 1
  %17 = icmp slt i32 %16, %0
  br i1 %17, label %.preheader.us.us, label %._crit_edge18.us

; <label>:18:                                     ; preds = %25, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %25 ], [ 0, %.preheader.us.us ]
  %19 = add i64 %indvars.iv, %15
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %18
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %25

; <label>:25:                                     ; preds = %23, %18
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %9, i64 %14, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %18

._crit_edge20.loopexit:                           ; preds = %._crit_edge18.us
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %2
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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

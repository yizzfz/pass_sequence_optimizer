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
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader3.lr.ph, label %._crit_edge8

.preheader3.lr.ph:                                ; preds = %3
  %5 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  %wide.trip.count20 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %wide.trip.count23 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.lr.ph, %._crit_edge6.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge6.us ], [ 0, %.preheader3.lr.ph ]
  %7 = trunc i64 %indvars.iv21 to i32
  %8 = add i32 %7, %0
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond24, label %._crit_edge8.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us.us ]
  %9 = trunc i64 %indvars.iv18 to i32
  %10 = add i32 %8, %9
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %11 = sitofp i32 %10 to double
  %12 = fmul double %11, 1.000000e+01
  %13 = fdiv double %12, %5
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv21, i64 %indvars.iv18, i64 0
  store double %13, double* %14, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv18, i64 0
  store double %13, double* %15, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %6, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond, label %._crit_edge6.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %16 = trunc i64 %indvars.iv to i32
  %17 = sub i32 %10, %16
  %18 = sitofp i32 %17 to double
  %19 = fmul double %18, 1.000000e+01
  %20 = fdiv double %19, %5
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv
  store double %20, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %23 = trunc i64 %indvars.iv.next to i32
  %24 = sub i32 %10, %23
  %25 = sitofp i32 %24 to double
  %26 = fmul double %25, 1.000000e+01
  %27 = fdiv double %26, %5
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv.next
  store double %27, double* %28, align 8
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv.next
  store double %27, double* %29, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %5 = add nsw i32 %1, -1
  %6 = icmp sgt i32 %5, 1
  %7 = icmp sgt i32 %5, 1
  %wide.trip.count25 = zext i32 %5 to i64
  %wide.trip.count = zext i32 %5 to i64
  %wide.trip.count29 = zext i32 %5 to i64
  %8 = icmp sgt i32 %5, 1
  %wide.trip.count37 = zext i32 %5 to i64
  %wide.trip.count33 = zext i32 %5 to i64
  %wide.trip.count41 = zext i32 %5 to i64
  %9 = add nsw i64 %wide.trip.count33, -1
  %min.iters.check62 = icmp ult i64 %9, 2
  %n.vec65 = and i64 %9, -2
  %cmp.zero66 = icmp eq i64 %n.vec65, 0
  %ind.end89 = or i64 %9, 1
  %cmp.n90 = icmp eq i64 %9, %n.vec65
  %min.iters.check = icmp ult i64 %9, 2
  %n.vec = and i64 %9, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %9, 1
  %cmp.n = icmp eq i64 %9, %n.vec
  br label %.preheader10

.preheader10:                                     ; preds = %._crit_edge21, %4
  %.0522 = phi i32 [ 1, %4 ], [ %144, %._crit_edge21 ]
  br i1 %6, label %.preheader8.preheader, label %._crit_edge21

.preheader8.preheader:                            ; preds = %.preheader10
  br label %.preheader8

.preheader9:                                      ; preds = %._crit_edge13
  br i1 %8, label %.preheader.lr.ph.preheader, label %._crit_edge21

.preheader.lr.ph.preheader:                       ; preds = %.preheader9
  br label %.preheader.lr.ph

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge13
  %indvar68 = phi i64 [ %indvar.next69, %._crit_edge13 ], [ 0, %.preheader8.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge13 ], [ 1, %.preheader8.preheader ]
  %10 = add i64 %indvar68, 1
  %11 = add i64 %indvar68, 2
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge13

.preheader6.lr.ph:                                ; preds = %.preheader8
  %12 = add nuw nsw i64 %indvars.iv27, 1
  %13 = add nsw i64 %indvars.iv27, -1
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge.us, %.preheader6.lr.ph
  %indvar70 = phi i64 [ %indvar.next71, %._crit_edge.us ], [ 0, %.preheader6.lr.ph ]
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge.us ], [ 1, %.preheader6.lr.ph ]
  %14 = add i64 %indvar70, 1
  %scevgep72 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %10, i64 %14, i64 1
  %scevgep74 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %10, i64 %14, i64 %wide.trip.count33
  %scevgep76 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar68, i64 %14, i64 1
  %scevgep78 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %11, i64 %14, i64 %wide.trip.count33
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %15 = add nsw i64 %indvars.iv23, -1
  br i1 %min.iters.check62, label %scalar.ph61.preheader, label %min.iters.checked63

min.iters.checked63:                              ; preds = %.preheader6.us
  br i1 %cmp.zero66, label %scalar.ph61.preheader, label %vector.memcheck84

vector.memcheck84:                                ; preds = %min.iters.checked63
  %bound080 = icmp ult double* %scevgep72, %scevgep78
  %bound181 = icmp ult double* %scevgep76, %scevgep74
  %memcheck.conflict83 = and i1 %bound080, %bound181
  br i1 %memcheck.conflict83, label %scalar.ph61.preheader, label %vector.body59.preheader

vector.body59.preheader:                          ; preds = %vector.memcheck84
  br label %vector.body59

vector.body59:                                    ; preds = %vector.body59.preheader, %vector.body59
  %index86 = phi i64 [ %index.next87, %vector.body59 ], [ 0, %vector.body59.preheader ]
  %offset.idx91 = or i64 %index86, 1
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %12, i64 %indvars.iv23, i64 %offset.idx91
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %offset.idx91
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fmul <2 x double> %wide.load96, <double 2.000000e+00, double 2.000000e+00>
  %21 = fsub <2 x double> %wide.load95, %20
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %13, i64 %indvars.iv23, i64 %offset.idx91
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fadd <2 x double> %wide.load97, %21
  %25 = fmul <2 x double> %24, <double 1.250000e-01, double 1.250000e-01>
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv.next24, i64 %offset.idx91
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fsub <2 x double> %wide.load98, %20
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %15, i64 %offset.idx91
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %28, %wide.load99
  %32 = fmul <2 x double> %31, <double 1.250000e-01, double 1.250000e-01>
  %33 = fadd <2 x double> %25, %32
  %34 = add nuw nsw i64 %offset.idx91, 1
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %34
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !1
  %37 = fsub <2 x double> %wide.load100, %20
  %38 = add nsw i64 %offset.idx91, -1
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %38
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fadd <2 x double> %37, %wide.load101
  %42 = fmul <2 x double> %41, <double 1.250000e-01, double 1.250000e-01>
  %43 = fadd <2 x double> %33, %42
  %44 = fadd <2 x double> %wide.load96, %43
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv27, i64 %indvars.iv23, i64 %offset.idx91
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> %44, <2 x double>* %46, align 8, !alias.scope !4, !noalias !1
  %index.next87 = add i64 %index86, 2
  %47 = icmp eq i64 %index.next87, %n.vec65
  br i1 %47, label %middle.block60, label %vector.body59, !llvm.loop !6

middle.block60:                                   ; preds = %vector.body59
  br i1 %cmp.n90, label %._crit_edge.us, label %scalar.ph61.preheader

scalar.ph61.preheader:                            ; preds = %middle.block60, %vector.memcheck84, %min.iters.checked63, %.preheader6.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck84 ], [ 1, %min.iters.checked63 ], [ 1, %.preheader6.us ], [ %ind.end89, %middle.block60 ]
  br label %scalar.ph61

scalar.ph61:                                      ; preds = %scalar.ph61.preheader, %scalar.ph61
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph61 ], [ %indvars.iv.ph, %scalar.ph61.preheader ]
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %12, i64 %indvars.iv23, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, 2.000000e+00
  %53 = fsub double %49, %52
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %13, i64 %indvars.iv23, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  %57 = fmul double %56, 1.250000e-01
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv.next24, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = fsub double %59, %52
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %15, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fadd double %60, %62
  %64 = fmul double %63, 1.250000e-01
  %65 = fadd double %57, %64
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = fsub double %67, %52
  %69 = add nsw i64 %indvars.iv, -1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv27, i64 %indvars.iv23, i64 %69
  %71 = load double, double* %70, align 8
  %72 = fadd double %68, %71
  %73 = fmul double %72, 1.250000e-01
  %74 = fadd double %65, %73
  %75 = fadd double %51, %74
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv27, i64 %indvars.iv23, i64 %indvars.iv
  store double %75, double* %76, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph61, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph61
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block60
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  %indvar.next71 = add i64 %indvar70, 1
  br i1 %exitcond26, label %._crit_edge13.loopexit, label %.preheader6.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  %indvar.next69 = add i64 %indvar68, 1
  br i1 %exitcond30, label %.preheader9, label %.preheader8

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge19
  %indvar = phi i64 [ %indvar.next, %._crit_edge19 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge19 ], [ 1, %.preheader.lr.ph.preheader ]
  %77 = add i64 %indvar, 1
  %78 = add i64 %indvar, 2
  %79 = add nuw nsw i64 %indvars.iv39, 1
  %80 = add nsw i64 %indvars.iv39, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge17.us, %.preheader.lr.ph
  %indvar44 = phi i64 [ %indvar.next45, %._crit_edge17.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge17.us ], [ 1, %.preheader.lr.ph ]
  %81 = add i64 %indvar44, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %77, i64 %81, i64 1
  %scevgep47 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %77, i64 %81, i64 %wide.trip.count33
  %scevgep49 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvar, i64 %81, i64 1
  %scevgep51 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %78, i64 %81, i64 %wide.trip.count33
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %82 = add nsw i64 %indvars.iv35, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep51
  %bound1 = icmp ult double* %scevgep49, %scevgep47
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %79, i64 %indvars.iv35, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %offset.idx
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = fmul <2 x double> %wide.load53, <double 2.000000e+00, double 2.000000e+00>
  %88 = fsub <2 x double> %wide.load, %87
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %80, i64 %indvars.iv35, i64 %offset.idx
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fadd <2 x double> %wide.load54, %88
  %92 = fmul <2 x double> %91, <double 1.250000e-01, double 1.250000e-01>
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv.next36, i64 %offset.idx
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fsub <2 x double> %wide.load55, %87
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %82, i64 %offset.idx
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !10
  %98 = fadd <2 x double> %95, %wide.load56
  %99 = fmul <2 x double> %98, <double 1.250000e-01, double 1.250000e-01>
  %100 = fadd <2 x double> %92, %99
  %101 = add nuw nsw i64 %offset.idx, 1
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %101
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !10
  %104 = fsub <2 x double> %wide.load57, %87
  %105 = add nsw i64 %offset.idx, -1
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %105
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !10
  %108 = fadd <2 x double> %104, %wide.load58
  %109 = fmul <2 x double> %108, <double 1.250000e-01, double 1.250000e-01>
  %110 = fadd <2 x double> %100, %109
  %111 = fadd <2 x double> %wide.load53, %110
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv39, i64 %indvars.iv35, i64 %offset.idx
  %113 = bitcast double* %112 to <2 x double>*
  store <2 x double> %111, <2 x double>* %113, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %114 = icmp eq i64 %index.next, %n.vec
  br i1 %114, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge17.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv31.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %scalar.ph ], [ %indvars.iv31.ph, %scalar.ph.preheader ]
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %79, i64 %indvars.iv35, i64 %indvars.iv31
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv31
  %118 = load double, double* %117, align 8
  %119 = fmul double %118, 2.000000e+00
  %120 = fsub double %116, %119
  %121 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %80, i64 %indvars.iv35, i64 %indvars.iv31
  %122 = load double, double* %121, align 8
  %123 = fadd double %122, %120
  %124 = fmul double %123, 1.250000e-01
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv.next36, i64 %indvars.iv31
  %126 = load double, double* %125, align 8
  %127 = fsub double %126, %119
  %128 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %82, i64 %indvars.iv31
  %129 = load double, double* %128, align 8
  %130 = fadd double %127, %129
  %131 = fmul double %130, 1.250000e-01
  %132 = fadd double %124, %131
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %133 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv.next32
  %134 = load double, double* %133, align 8
  %135 = fsub double %134, %119
  %136 = add nsw i64 %indvars.iv31, -1
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %136
  %138 = load double, double* %137, align 8
  %139 = fadd double %135, %138
  %140 = fmul double %139, 1.250000e-01
  %141 = fadd double %132, %140
  %142 = fadd double %118, %141
  %143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv31
  store double %142, double* %143, align 8
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge17.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge17.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %middle.block
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  %indvar.next45 = add i64 %indvar44, 1
  br i1 %exitcond38, label %._crit_edge19, label %.preheader.us

._crit_edge19:                                    ; preds = %._crit_edge17.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond42, label %._crit_edge21.loopexit, label %.preheader.lr.ph

._crit_edge21.loopexit:                           ; preds = %._crit_edge19
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %.preheader10, %.preheader9
  %144 = add nuw nsw i32 %.0522, 1
  %exitcond43 = icmp eq i32 %144, 501
  br i1 %exitcond43, label %145, label %.preheader10

; <label>:145:                                    ; preds = %._crit_edge21
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader3.lr.ph, label %._crit_edge8

.preheader3.lr.ph:                                ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count20 = zext i32 %0 to i64
  %wide.trip.count24 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.lr.ph, %._crit_edge6.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge6.us ], [ 0, %.preheader3.lr.ph ]
  %9 = mul nsw i64 %indvars.iv22, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, %wide.trip.count24
  br i1 %exitcond25, label %._crit_edge8.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us.us ]
  %11 = trunc i64 %indvars.iv18 to i32
  %12 = add i32 %11, %10
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %15

._crit_edge.us.us:                                ; preds = %22
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond21, label %._crit_edge6.us, label %.preheader.us.us

; <label>:15:                                     ; preds = %22, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %22 ], [ 0, %.preheader.us.us ]
  %16 = add i64 %indvars.iv, %14
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 20
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %15
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %21) #5
  br label %22

; <label>:22:                                     ; preds = %20, %15
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %25) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %15

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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

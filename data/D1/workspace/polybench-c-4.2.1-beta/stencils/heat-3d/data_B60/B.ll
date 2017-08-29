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
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %4 = add nsw i32 %0, -1
  %5 = icmp sgt i32 %4, 1
  %6 = icmp sgt i32 %4, 1
  %wide.trip.count20 = zext i32 %4 to i64
  %wide.trip.count = zext i32 %4 to i64
  %wide.trip.count24 = zext i32 %4 to i64
  %7 = icmp sgt i32 %4, 1
  %wide.trip.count32 = zext i32 %4 to i64
  %wide.trip.count28 = zext i32 %4 to i64
  %wide.trip.count36 = zext i32 %4 to i64
  %8 = add nsw i64 %wide.trip.count28, -1
  %min.iters.check57 = icmp ult i64 %8, 2
  %n.vec60 = and i64 %8, -2
  %cmp.zero61 = icmp eq i64 %n.vec60, 0
  %ind.end84 = or i64 %8, 1
  %cmp.n85 = icmp eq i64 %8, %n.vec60
  %min.iters.check = icmp ult i64 %8, 2
  %n.vec = and i64 %8, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %8, 1
  %cmp.n = icmp eq i64 %8, %n.vec
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge16, %3
  %.0517 = phi i32 [ 1, %3 ], [ %143, %._crit_edge16 ]
  br i1 %5, label %.preheader3.preheader, label %._crit_edge16

.preheader3.preheader:                            ; preds = %.preheader5
  br label %.preheader3

.preheader4:                                      ; preds = %._crit_edge8
  br i1 %7, label %.preheader.lr.ph.preheader, label %._crit_edge16

.preheader.lr.ph.preheader:                       ; preds = %.preheader4
  br label %.preheader.lr.ph

.preheader3:                                      ; preds = %.preheader3.preheader, %._crit_edge8
  %indvar63 = phi i64 [ %indvar.next64, %._crit_edge8 ], [ 0, %.preheader3.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge8 ], [ 1, %.preheader3.preheader ]
  %9 = add i64 %indvar63, 1
  %10 = add i64 %indvar63, 2
  br i1 %6, label %.preheader1.lr.ph, label %._crit_edge8

.preheader1.lr.ph:                                ; preds = %.preheader3
  %11 = add nuw nsw i64 %indvars.iv22, 1
  %12 = add nsw i64 %indvars.iv22, -1
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %._crit_edge.us, %.preheader1.lr.ph
  %indvar65 = phi i64 [ %indvar.next66, %._crit_edge.us ], [ 0, %.preheader1.lr.ph ]
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge.us ], [ 1, %.preheader1.lr.ph ]
  %13 = add i64 %indvar65, 1
  %scevgep67 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %9, i64 %13, i64 1
  %scevgep69 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %9, i64 %13, i64 %wide.trip.count28
  %scevgep71 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar63, i64 %13, i64 1
  %scevgep73 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %10, i64 %13, i64 %wide.trip.count28
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %14 = add nsw i64 %indvars.iv18, -1
  br i1 %min.iters.check57, label %scalar.ph56.preheader, label %min.iters.checked58

min.iters.checked58:                              ; preds = %.preheader1.us
  br i1 %cmp.zero61, label %scalar.ph56.preheader, label %vector.memcheck79

vector.memcheck79:                                ; preds = %min.iters.checked58
  %bound075 = icmp ult double* %scevgep67, %scevgep73
  %bound176 = icmp ult double* %scevgep71, %scevgep69
  %memcheck.conflict78 = and i1 %bound075, %bound176
  br i1 %memcheck.conflict78, label %scalar.ph56.preheader, label %vector.body54.preheader

vector.body54.preheader:                          ; preds = %vector.memcheck79
  br label %vector.body54

vector.body54:                                    ; preds = %vector.body54.preheader, %vector.body54
  %index81 = phi i64 [ %index.next82, %vector.body54 ], [ 0, %vector.body54.preheader ]
  %offset.idx86 = or i64 %index81, 1
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %11, i64 %indvars.iv18, i64 %offset.idx86
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %offset.idx86
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fmul <2 x double> %wide.load91, <double 2.000000e+00, double 2.000000e+00>
  %20 = fsub <2 x double> %wide.load90, %19
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %12, i64 %indvars.iv18, i64 %offset.idx86
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %wide.load92, %20
  %24 = fmul <2 x double> %23, <double 1.250000e-01, double 1.250000e-01>
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv.next19, i64 %offset.idx86
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fsub <2 x double> %wide.load93, %19
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %14, i64 %offset.idx86
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %27, %wide.load94
  %31 = fmul <2 x double> %30, <double 1.250000e-01, double 1.250000e-01>
  %32 = fadd <2 x double> %24, %31
  %33 = add nuw nsw i64 %offset.idx86, 1
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %33
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = fsub <2 x double> %wide.load95, %19
  %37 = add nsw i64 %offset.idx86, -1
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %37
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !1
  %40 = fadd <2 x double> %36, %wide.load96
  %41 = fmul <2 x double> %40, <double 1.250000e-01, double 1.250000e-01>
  %42 = fadd <2 x double> %32, %41
  %43 = fadd <2 x double> %wide.load91, %42
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv18, i64 %offset.idx86
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> %43, <2 x double>* %45, align 8, !alias.scope !4, !noalias !1
  %index.next82 = add i64 %index81, 2
  %46 = icmp eq i64 %index.next82, %n.vec60
  br i1 %46, label %middle.block55, label %vector.body54, !llvm.loop !6

middle.block55:                                   ; preds = %vector.body54
  br i1 %cmp.n85, label %._crit_edge.us, label %scalar.ph56.preheader

scalar.ph56.preheader:                            ; preds = %middle.block55, %vector.memcheck79, %min.iters.checked58, %.preheader1.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck79 ], [ 1, %min.iters.checked58 ], [ 1, %.preheader1.us ], [ %ind.end84, %middle.block55 ]
  br label %scalar.ph56

scalar.ph56:                                      ; preds = %scalar.ph56.preheader, %scalar.ph56
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph56 ], [ %indvars.iv.ph, %scalar.ph56.preheader ]
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %11, i64 %indvars.iv18, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, 2.000000e+00
  %52 = fsub double %48, %51
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %12, i64 %indvars.iv18, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  %56 = fmul double %55, 1.250000e-01
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv.next19, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fsub double %58, %51
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %14, i64 %indvars.iv
  %61 = load double, double* %60, align 8
  %62 = fadd double %59, %61
  %63 = fmul double %62, 1.250000e-01
  %64 = fadd double %56, %63
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv.next
  %66 = load double, double* %65, align 8
  %67 = fsub double %66, %51
  %68 = add nsw i64 %indvars.iv, -1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %68
  %70 = load double, double* %69, align 8
  %71 = fadd double %67, %70
  %72 = fmul double %71, 1.250000e-01
  %73 = fadd double %64, %72
  %74 = fadd double %50, %73
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  store double %74, double* %75, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph56, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph56
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block55
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  %indvar.next66 = add i64 %indvar65, 1
  br i1 %exitcond21, label %._crit_edge8.loopexit, label %.preheader1.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.preheader3
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, %wide.trip.count24
  %indvar.next64 = add i64 %indvar63, 1
  br i1 %exitcond25, label %.preheader4, label %.preheader3

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge14
  %indvar = phi i64 [ %indvar.next, %._crit_edge14 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge14 ], [ 1, %.preheader.lr.ph.preheader ]
  %76 = add i64 %indvar, 1
  %77 = add i64 %indvar, 2
  %78 = add nuw nsw i64 %indvars.iv34, 1
  %79 = add nsw i64 %indvars.iv34, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us, %.preheader.lr.ph
  %indvar39 = phi i64 [ %indvar.next40, %._crit_edge12.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge12.us ], [ 1, %.preheader.lr.ph ]
  %80 = add i64 %indvar39, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %76, i64 %80, i64 1
  %scevgep42 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %76, i64 %80, i64 %wide.trip.count28
  %scevgep44 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %80, i64 1
  %scevgep46 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %77, i64 %80, i64 %wide.trip.count28
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %81 = add nsw i64 %indvars.iv30, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep46
  %bound1 = icmp ult double* %scevgep44, %scevgep42
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %78, i64 %indvars.iv30, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %offset.idx
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !10
  %86 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %87 = fsub <2 x double> %wide.load, %86
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %79, i64 %indvars.iv30, i64 %offset.idx
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fadd <2 x double> %wide.load49, %87
  %91 = fmul <2 x double> %90, <double 1.250000e-01, double 1.250000e-01>
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv.next31, i64 %offset.idx
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !10
  %94 = fsub <2 x double> %wide.load50, %86
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %81, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = fadd <2 x double> %94, %wide.load51
  %98 = fmul <2 x double> %97, <double 1.250000e-01, double 1.250000e-01>
  %99 = fadd <2 x double> %91, %98
  %100 = add nuw nsw i64 %offset.idx, 1
  %101 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %100
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !10
  %103 = fsub <2 x double> %wide.load52, %86
  %104 = add nsw i64 %offset.idx, -1
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %104
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !10
  %107 = fadd <2 x double> %103, %wide.load53
  %108 = fmul <2 x double> %107, <double 1.250000e-01, double 1.250000e-01>
  %109 = fadd <2 x double> %99, %108
  %110 = fadd <2 x double> %wide.load48, %109
  %111 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %offset.idx
  %112 = bitcast double* %111 to <2 x double>*
  store <2 x double> %110, <2 x double>* %112, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %113 = icmp eq i64 %index.next, %n.vec
  br i1 %113, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge12.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv26.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %scalar.ph ], [ %indvars.iv26.ph, %scalar.ph.preheader ]
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %78, i64 %indvars.iv30, i64 %indvars.iv26
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv26
  %117 = load double, double* %116, align 8
  %118 = fmul double %117, 2.000000e+00
  %119 = fsub double %115, %118
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %79, i64 %indvars.iv30, i64 %indvars.iv26
  %121 = load double, double* %120, align 8
  %122 = fadd double %121, %119
  %123 = fmul double %122, 1.250000e-01
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv.next31, i64 %indvars.iv26
  %125 = load double, double* %124, align 8
  %126 = fsub double %125, %118
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %81, i64 %indvars.iv26
  %128 = load double, double* %127, align 8
  %129 = fadd double %126, %128
  %130 = fmul double %129, 1.250000e-01
  %131 = fadd double %123, %130
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv.next27
  %133 = load double, double* %132, align 8
  %134 = fsub double %133, %118
  %135 = add nsw i64 %indvars.iv26, -1
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %135
  %137 = load double, double* %136, align 8
  %138 = fadd double %134, %137
  %139 = fmul double %138, 1.250000e-01
  %140 = fadd double %131, %139
  %141 = fadd double %117, %140
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv26
  store double %141, double* %142, align 8
  %exitcond29 = icmp eq i64 %indvars.iv.next27, %wide.trip.count28
  br i1 %exitcond29, label %._crit_edge12.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge12.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %middle.block
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  %indvar.next40 = add i64 %indvar39, 1
  br i1 %exitcond33, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond37, label %._crit_edge16.loopexit, label %.preheader.lr.ph

._crit_edge16.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader5, %.preheader4
  %143 = add nuw nsw i32 %.0517, 1
  %exitcond38 = icmp eq i32 %143, 501
  br i1 %exitcond38, label %144, label %.preheader5

; <label>:144:                                    ; preds = %._crit_edge16
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
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %25) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %15

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

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
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
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
  %wide.trip.count = zext i32 %0 to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge6.us, %.preheader3.lr.ph
  %indvars.iv22 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next23, %._crit_edge6.us ]
  %7 = trunc i64 %indvars.iv22 to i32
  %8 = add i32 %7, %0
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, %wide.trip.count
  br i1 %exitcond25, label %._crit_edge8.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us.us ]
  %9 = trunc i64 %indvars.iv18 to i32
  %10 = add i32 %8, %9
  br i1 %lcmp.mod, label %._crit_edge.prol.loopexit.unr-lcssa, label %._crit_edge.prol.preheader

._crit_edge.prol.preheader:                       ; preds = %.preheader.us.us
  br label %._crit_edge.prol

._crit_edge.prol:                                 ; preds = %._crit_edge.prol.preheader
  %11 = sitofp i32 %10 to double
  %12 = fmul double %11, 1.000000e+01
  %13 = fdiv double %12, %5
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv18, i64 0
  store double %13, double* %14, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 0
  store double %13, double* %15, align 8
  br label %._crit_edge.prol.loopexit.unr-lcssa

._crit_edge.prol.loopexit.unr-lcssa:              ; preds = %.preheader.us.us, %._crit_edge.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge.prol ], [ 0, %.preheader.us.us ]
  br label %._crit_edge.prol.loopexit

._crit_edge.prol.loopexit:                        ; preds = %._crit_edge.prol.loopexit.unr-lcssa
  br i1 %6, label %._crit_edge.us.us, label %.preheader.us.us.new

.preheader.us.us.new:                             ; preds = %._crit_edge.prol.loopexit
  br label %._crit_edge

._crit_edge.us.us.unr-lcssa:                      ; preds = %._crit_edge
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count
  br i1 %exitcond21, label %._crit_edge6.us, label %.preheader.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us.us.new ], [ %indvars.iv.next.1, %._crit_edge ]
  %16 = trunc i64 %indvars.iv to i32
  %17 = sub i32 %10, %16
  %18 = sitofp i32 %17 to double
  %19 = fmul double %18, 1.000000e+01
  %20 = fdiv double %19, %5
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  store double %20, double* %21, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  store double %20, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %23 = trunc i64 %indvars.iv.next to i32
  %24 = sub i32 %10, %23
  %25 = sitofp i32 %24 to double
  %26 = fmul double %25, 1.000000e+01
  %27 = fdiv double %26, %5
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv.next
  store double %27, double* %28, align 8
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv.next
  store double %27, double* %29, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.us.unr-lcssa, label %._crit_edge

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
  %wide.trip.count20 = zext i32 %4 to i64
  %6 = add nsw i64 %wide.trip.count20, -1
  %min.iters.check58 = icmp ult i64 %6, 2
  %n.vec61 = and i64 %6, -2
  %cmp.zero62 = icmp eq i64 %n.vec61, 0
  %ind.end85 = or i64 %6, 1
  %cmp.n86 = icmp eq i64 %6, %n.vec61
  %min.iters.check = icmp ult i64 %6, 2
  %n.vec = and i64 %6, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %6, 1
  %cmp.n = icmp eq i64 %6, %n.vec
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge16, %3
  %.0517 = phi i32 [ 1, %3 ], [ %141, %._crit_edge16 ]
  br i1 %5, label %.preheader3.preheader, label %._crit_edge16

.preheader3.preheader:                            ; preds = %.preheader5
  br label %.preheader3

.preheader4:                                      ; preds = %._crit_edge8
  br i1 true, label %.preheader.lr.ph.preheader, label %.preheader4.._crit_edge16_crit_edge

.preheader4.._crit_edge16_crit_edge:              ; preds = %.preheader4
  br label %._crit_edge16

.preheader.lr.ph.preheader:                       ; preds = %.preheader4
  br label %.preheader.lr.ph

.preheader3:                                      ; preds = %.preheader3.preheader, %._crit_edge8
  %indvar64 = phi i64 [ %7, %._crit_edge8 ], [ 0, %.preheader3.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.pre-phi, %._crit_edge8 ], [ 1, %.preheader3.preheader ]
  %7 = add nuw nsw i64 %indvar64, 1
  %8 = add nuw nsw i64 %indvar64, 2
  br i1 true, label %.preheader1.lr.ph, label %.preheader3.._crit_edge8_crit_edge

.preheader3.._crit_edge8_crit_edge:               ; preds = %.preheader3
  br label %._crit_edge8

.preheader1.lr.ph:                                ; preds = %.preheader3
  %9 = add nuw nsw i64 %indvars.iv22, 1
  %10 = add nsw i64 %indvars.iv22, -1
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %._crit_edge.us, %.preheader1.lr.ph
  %indvar66 = phi i64 [ %11, %._crit_edge.us ], [ 0, %.preheader1.lr.ph ]
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge.us ], [ 1, %.preheader1.lr.ph ]
  %11 = add nuw nsw i64 %indvar66, 1
  %scevgep68 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %7, i64 %11, i64 1
  %scevgep70 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %7, i64 %11, i64 %wide.trip.count20
  %scevgep72 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar64, i64 %11, i64 1
  %scevgep74 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %8, i64 %11, i64 %wide.trip.count20
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %12 = add nsw i64 %indvars.iv18, -1
  br i1 %min.iters.check58, label %._crit_edge.preheader, label %min.iters.checked59

min.iters.checked59:                              ; preds = %.preheader1.us
  br i1 %cmp.zero62, label %._crit_edge.preheader, label %vector.memcheck80

vector.memcheck80:                                ; preds = %min.iters.checked59
  %bound076 = icmp ult double* %scevgep68, %scevgep74
  %bound177 = icmp ult double* %scevgep72, %scevgep70
  %memcheck.conflict79 = and i1 %bound076, %bound177
  br i1 %memcheck.conflict79, label %._crit_edge.preheader, label %vector.body55.preheader

vector.body55.preheader:                          ; preds = %vector.memcheck80
  br label %vector.body55

vector.body55:                                    ; preds = %vector.body55.preheader, %vector.body55
  %index82 = phi i64 [ %index.next83, %vector.body55 ], [ 0, %vector.body55.preheader ]
  %offset.idx87 = or i64 %index82, 1
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %9, i64 %indvars.iv18, i64 %offset.idx87
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %offset.idx87
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fmul <2 x double> %wide.load92, <double 2.000000e+00, double 2.000000e+00>
  %18 = fsub <2 x double> %wide.load91, %17
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %10, i64 %indvars.iv18, i64 %offset.idx87
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fadd <2 x double> %wide.load93, %18
  %22 = fmul <2 x double> %21, <double 1.250000e-01, double 1.250000e-01>
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv.next19, i64 %offset.idx87
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fsub <2 x double> %wide.load94, %17
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %12, i64 %offset.idx87
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %25, %wide.load95
  %29 = fmul <2 x double> %28, <double 1.250000e-01, double 1.250000e-01>
  %30 = fadd <2 x double> %22, %29
  %31 = add nuw nsw i64 %offset.idx87, 1
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %31
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fsub <2 x double> %wide.load96, %17
  %35 = add nsw i64 %offset.idx87, -1
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %35
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !1
  %38 = fadd <2 x double> %34, %wide.load97
  %39 = fmul <2 x double> %38, <double 1.250000e-01, double 1.250000e-01>
  %40 = fadd <2 x double> %30, %39
  %41 = fadd <2 x double> %wide.load92, %40
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv18, i64 %offset.idx87
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> %41, <2 x double>* %43, align 8, !alias.scope !4, !noalias !1
  %index.next83 = add i64 %index82, 2
  %44 = icmp eq i64 %index.next83, %n.vec61
  br i1 %44, label %middle.block56, label %vector.body55, !llvm.loop !6

middle.block56:                                   ; preds = %vector.body55
  br i1 %cmp.n86, label %._crit_edge.us, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %middle.block56, %vector.memcheck80, %min.iters.checked59, %.preheader1.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck80 ], [ 1, %min.iters.checked59 ], [ 1, %.preheader1.us ], [ %ind.end85, %middle.block56 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ %indvars.iv.ph, %._crit_edge.preheader ]
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %9, i64 %indvars.iv18, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, 2.000000e+00
  %50 = fsub double %46, %49
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %10, i64 %indvars.iv18, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  %54 = fmul double %53, 1.250000e-01
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv.next19, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fsub double %56, %49
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %12, i64 %indvars.iv
  %59 = load double, double* %58, align 8
  %60 = fadd double %57, %59
  %61 = fmul double %60, 1.250000e-01
  %62 = fadd double %54, %61
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = fsub double %64, %49
  %66 = add nsw i64 %indvars.iv, -1
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %66
  %68 = load double, double* %67, align 8
  %69 = fadd double %65, %68
  %70 = fmul double %69, 1.250000e-01
  %71 = fadd double %62, %70
  %72 = fadd double %48, %71
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  store double %72, double* %73, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count20
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %._crit_edge, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block56
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond21, label %._crit_edge8.loopexit, label %.preheader1.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %.preheader3.._crit_edge8_crit_edge, %._crit_edge8.loopexit
  %indvars.iv.next23.pre-phi = phi i64 [ undef, %.preheader3.._crit_edge8_crit_edge ], [ %9, %._crit_edge8.loopexit ]
  %exitcond25 = icmp eq i64 %indvars.iv.next23.pre-phi, %wide.trip.count20
  br i1 %exitcond25, label %.preheader4, label %.preheader3

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge14
  %indvar = phi i64 [ %74, %._crit_edge14 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv34 = phi i64 [ %76, %._crit_edge14 ], [ 1, %.preheader.lr.ph.preheader ]
  %74 = add nuw nsw i64 %indvar, 1
  %75 = add nuw nsw i64 %indvar, 2
  %76 = add nuw nsw i64 %indvars.iv34, 1
  %77 = add nsw i64 %indvars.iv34, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us, %.preheader.lr.ph
  %indvar40 = phi i64 [ %78, %._crit_edge12.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge12.us ], [ 1, %.preheader.lr.ph ]
  %78 = add nuw nsw i64 %indvar40, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %74, i64 %78, i64 1
  %scevgep43 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %74, i64 %78, i64 %wide.trip.count20
  %scevgep45 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %78, i64 1
  %scevgep47 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %75, i64 %78, i64 %wide.trip.count20
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %79 = add nsw i64 %indvars.iv30, -1
  br i1 %min.iters.check, label %._crit_edge39.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %._crit_edge39.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep47
  %bound1 = icmp ult double* %scevgep45, %scevgep43
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge39.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %76, i64 %indvars.iv30, i64 %offset.idx
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !10
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !10
  %84 = fmul <2 x double> %wide.load49, <double 2.000000e+00, double 2.000000e+00>
  %85 = fsub <2 x double> %wide.load, %84
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %77, i64 %indvars.iv30, i64 %offset.idx
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !10
  %88 = fadd <2 x double> %wide.load50, %85
  %89 = fmul <2 x double> %88, <double 1.250000e-01, double 1.250000e-01>
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv.next31, i64 %offset.idx
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !10
  %92 = fsub <2 x double> %wide.load51, %84
  %93 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %79, i64 %offset.idx
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = fadd <2 x double> %92, %wide.load52
  %96 = fmul <2 x double> %95, <double 1.250000e-01, double 1.250000e-01>
  %97 = fadd <2 x double> %89, %96
  %98 = add nuw nsw i64 %offset.idx, 1
  %99 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %98
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = fsub <2 x double> %wide.load53, %84
  %102 = add nsw i64 %offset.idx, -1
  %103 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %102
  %104 = bitcast double* %103 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %104, align 8, !alias.scope !10
  %105 = fadd <2 x double> %101, %wide.load54
  %106 = fmul <2 x double> %105, <double 1.250000e-01, double 1.250000e-01>
  %107 = fadd <2 x double> %97, %106
  %108 = fadd <2 x double> %wide.load49, %107
  %109 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %offset.idx
  %110 = bitcast double* %109 to <2 x double>*
  store <2 x double> %108, <2 x double>* %110, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %111 = icmp eq i64 %index.next, %n.vec
  br i1 %111, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge12.us, label %._crit_edge39.preheader

._crit_edge39.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv26.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.preheader, %._crit_edge39
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge39 ], [ %indvars.iv26.ph, %._crit_edge39.preheader ]
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %76, i64 %indvars.iv30, i64 %indvars.iv26
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv26
  %115 = load double, double* %114, align 8
  %116 = fmul double %115, 2.000000e+00
  %117 = fsub double %113, %116
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %77, i64 %indvars.iv30, i64 %indvars.iv26
  %119 = load double, double* %118, align 8
  %120 = fadd double %119, %117
  %121 = fmul double %120, 1.250000e-01
  %122 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv.next31, i64 %indvars.iv26
  %123 = load double, double* %122, align 8
  %124 = fsub double %123, %116
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %79, i64 %indvars.iv26
  %126 = load double, double* %125, align 8
  %127 = fadd double %124, %126
  %128 = fmul double %127, 1.250000e-01
  %129 = fadd double %121, %128
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv.next27
  %131 = load double, double* %130, align 8
  %132 = fsub double %131, %116
  %133 = add nsw i64 %indvars.iv26, -1
  %134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %133
  %135 = load double, double* %134, align 8
  %136 = fadd double %132, %135
  %137 = fmul double %136, 1.250000e-01
  %138 = fadd double %129, %137
  %139 = fadd double %115, %138
  %140 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv26
  store double %139, double* %140, align 8
  %exitcond29 = icmp eq i64 %indvars.iv.next27, %wide.trip.count20
  br i1 %exitcond29, label %._crit_edge12.us.loopexit, label %._crit_edge39, !llvm.loop !16

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge39
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %middle.block
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count20
  br i1 %exitcond33, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %exitcond37 = icmp eq i64 %76, %wide.trip.count20
  br i1 %exitcond37, label %._crit_edge16.loopexit, label %.preheader.lr.ph

._crit_edge16.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %.preheader4.._crit_edge16_crit_edge, %._crit_edge16.loopexit, %.preheader5
  %141 = add nuw nsw i32 %.0517, 1
  %exitcond38 = icmp eq i32 %141, 501
  br i1 %exitcond38, label %142, label %.preheader5

; <label>:142:                                    ; preds = %._crit_edge16
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
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge6.us, %.preheader3.lr.ph
  %indvars.iv22 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next23, %._crit_edge6.us ]
  %9 = mul nsw i64 %indvars.iv22, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, %wide.trip.count
  br i1 %exitcond25, label %._crit_edge8.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us.us ]
  %11 = trunc i64 %indvars.iv18 to i32
  %12 = add i32 %11, %10
  %13 = mul i32 %12, %0
  %14 = zext i32 %13 to i64
  br label %._crit_edge26

._crit_edge.us.us:                                ; preds = %._crit_edge
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count
  br i1 %exitcond21, label %._crit_edge6.us, label %.preheader.us.us

._crit_edge26:                                    ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge ]
  %15 = add i64 %indvars.iv, %14
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge26
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge26, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge26

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
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

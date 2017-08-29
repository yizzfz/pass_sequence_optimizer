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
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %12)
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
  %6 = zext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %7 = icmp eq i32 %xtraiter, 0
  %8 = icmp eq i32 %0, 1
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.lr.ph, %._crit_edge6.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge6.us ], [ 0, %.preheader3.lr.ph ]
  %9 = trunc i64 %indvars.iv21 to i32
  %10 = add i32 %9, %0
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, %6
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us.us ]
  %11 = trunc i64 %indvars.iv18 to i32
  %12 = add i32 %10, %11
  br i1 %7, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %13 = sitofp i32 %12 to double
  %14 = fmul double %13, 1.000000e+01
  %15 = fdiv double %14, %5
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv21, i64 %indvars.iv18, i64 0
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv18, i64 0
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
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next19, %6
  br i1 %exitcond25, label %._crit_edge6.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %18 = trunc i64 %indvars.iv to i32
  %19 = sub i32 %12, %18
  %20 = sitofp i32 %19 to double
  %21 = fmul double %20, 1.000000e+01
  %22 = fdiv double %21, %5
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv
  store double %22, double* %23, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv
  store double %22, double* %24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = trunc i64 %indvars.iv.next to i32
  %26 = sub i32 %12, %25
  %27 = sitofp i32 %26 to double
  %28 = fmul double %27, 1.000000e+01
  %29 = fdiv double %28, %5
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv.next
  store double %29, double* %30, align 8
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv.next
  store double %29, double* %31, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %6
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
  %5 = zext i32 %4 to i64
  %6 = add nsw i64 %5, -1
  %7 = icmp sgt i32 %4, 1
  %min.iters.check60 = icmp ult i64 %6, 2
  %n.vec63 = and i64 %6, -2
  %cmp.zero64 = icmp eq i64 %n.vec63, 0
  %ind.end87 = or i64 %6, 1
  %cmp.n88 = icmp eq i64 %6, %n.vec63
  %min.iters.check = icmp ult i64 %6, 2
  %n.vec = and i64 %6, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %6, 1
  %cmp.n = icmp eq i64 %6, %n.vec
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge16, %3
  %.0517 = phi i32 [ 1, %3 ], [ %142, %._crit_edge16 ]
  br i1 %7, label %.preheader3.preheader, label %._crit_edge16

.preheader3.preheader:                            ; preds = %.preheader5
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.preheader, %._crit_edge8
  %indvar66 = phi i64 [ %indvar.next67, %._crit_edge8 ], [ 0, %.preheader3.preheader ]
  %indvars.iv22 = phi i64 [ %10, %._crit_edge8 ], [ 1, %.preheader3.preheader ]
  %8 = add i64 %indvar66, 1
  %9 = add i64 %indvar66, 2
  %10 = add nuw nsw i64 %indvars.iv22, 1
  %11 = add nsw i64 %indvars.iv22, -1
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %._crit_edge.us, %.preheader3
  %indvar68 = phi i64 [ %indvar.next69, %._crit_edge.us ], [ 0, %.preheader3 ]
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge.us ], [ 1, %.preheader3 ]
  %12 = add i64 %indvar68, 1
  %scevgep70 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %8, i64 %12, i64 1
  %scevgep72 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %8, i64 %12, i64 %5
  %scevgep74 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar66, i64 %12, i64 1
  %scevgep76 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %9, i64 %12, i64 %5
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %13 = add nsw i64 %indvars.iv18, -1
  br i1 %min.iters.check60, label %scalar.ph59.preheader, label %min.iters.checked61

min.iters.checked61:                              ; preds = %.preheader1.us
  br i1 %cmp.zero64, label %scalar.ph59.preheader, label %vector.memcheck82

vector.memcheck82:                                ; preds = %min.iters.checked61
  %bound078 = icmp ult double* %scevgep70, %scevgep76
  %bound179 = icmp ult double* %scevgep74, %scevgep72
  %memcheck.conflict81 = and i1 %bound078, %bound179
  br i1 %memcheck.conflict81, label %scalar.ph59.preheader, label %vector.body57.preheader

vector.body57.preheader:                          ; preds = %vector.memcheck82
  br label %vector.body57

vector.body57:                                    ; preds = %vector.body57.preheader, %vector.body57
  %index84 = phi i64 [ %index.next85, %vector.body57 ], [ 0, %vector.body57.preheader ]
  %offset.idx89 = or i64 %index84, 1
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %10, i64 %indvars.iv18, i64 %offset.idx89
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %offset.idx89
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fmul <2 x double> %wide.load94, <double 2.000000e+00, double 2.000000e+00>
  %19 = fsub <2 x double> %wide.load93, %18
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %11, i64 %indvars.iv18, i64 %offset.idx89
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %wide.load95, %19
  %23 = fmul <2 x double> %22, <double 1.250000e-01, double 1.250000e-01>
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv.next19, i64 %offset.idx89
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fsub <2 x double> %wide.load96, %18
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %13, i64 %offset.idx89
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %26, %wide.load97
  %30 = fmul <2 x double> %29, <double 1.250000e-01, double 1.250000e-01>
  %31 = fadd <2 x double> %23, %30
  %32 = add nuw nsw i64 %offset.idx89, 1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fsub <2 x double> %wide.load98, %18
  %36 = add nsw i64 %offset.idx89, -1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %36
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !1
  %39 = fadd <2 x double> %35, %wide.load99
  %40 = fmul <2 x double> %39, <double 1.250000e-01, double 1.250000e-01>
  %41 = fadd <2 x double> %31, %40
  %42 = fadd <2 x double> %wide.load94, %41
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv18, i64 %offset.idx89
  %44 = bitcast double* %43 to <2 x double>*
  store <2 x double> %42, <2 x double>* %44, align 8, !alias.scope !4, !noalias !1
  %index.next85 = add i64 %index84, 2
  %45 = icmp eq i64 %index.next85, %n.vec63
  br i1 %45, label %middle.block58, label %vector.body57, !llvm.loop !6

middle.block58:                                   ; preds = %vector.body57
  br i1 %cmp.n88, label %._crit_edge.us, label %scalar.ph59.preheader

scalar.ph59.preheader:                            ; preds = %middle.block58, %vector.memcheck82, %min.iters.checked61, %.preheader1.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck82 ], [ 1, %min.iters.checked61 ], [ 1, %.preheader1.us ], [ %ind.end87, %middle.block58 ]
  br label %scalar.ph59

scalar.ph59:                                      ; preds = %scalar.ph59.preheader, %scalar.ph59
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph59 ], [ %indvars.iv.ph, %scalar.ph59.preheader ]
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %10, i64 %indvars.iv18, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, 2.000000e+00
  %51 = fsub double %47, %50
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %11, i64 %indvars.iv18, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  %55 = fmul double %54, 1.250000e-01
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv.next19, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fsub double %57, %50
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %13, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  %62 = fmul double %61, 1.250000e-01
  %63 = fadd double %55, %62
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv.next
  %65 = load double, double* %64, align 8
  %66 = fsub double %65, %50
  %67 = add nsw i64 %indvars.iv, -1
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %67
  %69 = load double, double* %68, align 8
  %70 = fadd double %66, %69
  %71 = fmul double %70, 1.250000e-01
  %72 = fadd double %63, %71
  %73 = fadd double %49, %72
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  store double %73, double* %74, align 8
  %exitcond39 = icmp eq i64 %indvars.iv.next, %5
  br i1 %exitcond39, label %._crit_edge.us.loopexit, label %scalar.ph59, !llvm.loop !9

._crit_edge.us.loopexit:                          ; preds = %scalar.ph59
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block58
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %5
  %indvar.next69 = add i64 %indvar68, 1
  br i1 %exitcond21, label %._crit_edge8, label %.preheader1.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  %exitcond = icmp eq i64 %10, %5
  %indvar.next67 = add i64 %indvar66, 1
  br i1 %exitcond, label %.preheader.lr.ph.preheader, label %.preheader3

.preheader.lr.ph.preheader:                       ; preds = %._crit_edge8
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge14
  %indvar = phi i64 [ %indvar.next, %._crit_edge14 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv34 = phi i64 [ %77, %._crit_edge14 ], [ 1, %.preheader.lr.ph.preheader ]
  %75 = add i64 %indvar, 1
  %76 = add i64 %indvar, 2
  %77 = add nuw nsw i64 %indvars.iv34, 1
  %78 = add nsw i64 %indvars.iv34, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us, %.preheader.lr.ph
  %indvar42 = phi i64 [ %indvar.next43, %._crit_edge12.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge12.us ], [ 1, %.preheader.lr.ph ]
  %79 = add i64 %indvar42, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %75, i64 %79, i64 1
  %scevgep45 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %75, i64 %79, i64 %5
  %scevgep47 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %79, i64 1
  %scevgep49 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %76, i64 %79, i64 %5
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %80 = add nsw i64 %indvars.iv30, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep49
  %bound1 = icmp ult double* %scevgep47, %scevgep45
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %77, i64 %indvars.iv30, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = fmul <2 x double> %wide.load51, <double 2.000000e+00, double 2.000000e+00>
  %86 = fsub <2 x double> %wide.load, %85
  %87 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %78, i64 %indvars.iv30, i64 %offset.idx
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = fadd <2 x double> %wide.load52, %86
  %90 = fmul <2 x double> %89, <double 1.250000e-01, double 1.250000e-01>
  %91 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv.next31, i64 %offset.idx
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !10
  %93 = fsub <2 x double> %wide.load53, %85
  %94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %80, i64 %offset.idx
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !10
  %96 = fadd <2 x double> %93, %wide.load54
  %97 = fmul <2 x double> %96, <double 1.250000e-01, double 1.250000e-01>
  %98 = fadd <2 x double> %90, %97
  %99 = add nuw nsw i64 %offset.idx, 1
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %99
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !10
  %102 = fsub <2 x double> %wide.load55, %85
  %103 = add nsw i64 %offset.idx, -1
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %103
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !10
  %106 = fadd <2 x double> %102, %wide.load56
  %107 = fmul <2 x double> %106, <double 1.250000e-01, double 1.250000e-01>
  %108 = fadd <2 x double> %98, %107
  %109 = fadd <2 x double> %wide.load51, %108
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %offset.idx
  %111 = bitcast double* %110 to <2 x double>*
  store <2 x double> %109, <2 x double>* %111, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %112 = icmp eq i64 %index.next, %n.vec
  br i1 %112, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge12.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv26.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %scalar.ph ], [ %indvars.iv26.ph, %scalar.ph.preheader ]
  %113 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %77, i64 %indvars.iv30, i64 %indvars.iv26
  %114 = load double, double* %113, align 8
  %115 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv26
  %116 = load double, double* %115, align 8
  %117 = fmul double %116, 2.000000e+00
  %118 = fsub double %114, %117
  %119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %78, i64 %indvars.iv30, i64 %indvars.iv26
  %120 = load double, double* %119, align 8
  %121 = fadd double %120, %118
  %122 = fmul double %121, 1.250000e-01
  %123 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv.next31, i64 %indvars.iv26
  %124 = load double, double* %123, align 8
  %125 = fsub double %124, %117
  %126 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %80, i64 %indvars.iv26
  %127 = load double, double* %126, align 8
  %128 = fadd double %125, %127
  %129 = fmul double %128, 1.250000e-01
  %130 = fadd double %122, %129
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv.next27
  %132 = load double, double* %131, align 8
  %133 = fsub double %132, %117
  %134 = add nsw i64 %indvars.iv26, -1
  %135 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %134
  %136 = load double, double* %135, align 8
  %137 = fadd double %133, %136
  %138 = fmul double %137, 1.250000e-01
  %139 = fadd double %130, %138
  %140 = fadd double %116, %139
  %141 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv26
  store double %140, double* %141, align 8
  %exitcond40 = icmp eq i64 %indvars.iv.next27, %5
  br i1 %exitcond40, label %._crit_edge12.us.loopexit, label %scalar.ph, !llvm.loop !16

._crit_edge12.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %middle.block
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %5
  %indvar.next43 = add i64 %indvar42, 1
  br i1 %exitcond33, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %exitcond41 = icmp eq i64 %77, %5
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond41, label %._crit_edge16.loopexit, label %.preheader.lr.ph

._crit_edge16.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %.preheader5
  %142 = add nuw nsw i32 %.0517, 1
  %exitcond38 = icmp eq i32 %142, 501
  br i1 %exitcond38, label %143, label %.preheader5

; <label>:143:                                    ; preds = %._crit_edge16
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
  br i1 %7, label %.preheader3.lr.ph, label %._crit_edge9

.preheader3.lr.ph:                                ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.lr.ph, %._crit_edge7.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge7.us ], [ 0, %.preheader3.lr.ph ]
  %10 = mul nsw i64 %indvars.iv24, %8
  %11 = trunc i64 %10 to i32
  br label %.preheader.us.us

._crit_edge7.us:                                  ; preds = %._crit_edge5.us.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next25, %9
  br i1 %exitcond29, label %._crit_edge9.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge5.us.us, %.preheader.us.us.preheader
  %indvars.iv20 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next21, %._crit_edge5.us.us ]
  %12 = trunc i64 %indvars.iv20 to i32
  %13 = add i32 %12, %11
  %14 = mul i32 %13, %0
  %15 = zext i32 %14 to i64
  br label %16

._crit_edge5.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp eq i64 %indvars.iv.next21, %9
  br i1 %exitcond, label %._crit_edge7.us, label %.preheader.us.us

; <label>:16:                                     ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %17 = add i64 %indvars.iv, %15
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 20
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %._crit_edge.us.us

; <label>:21:                                     ; preds = %16
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %22) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %16, %21
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv24, i64 %indvars.iv20, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %25) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next, %9
  br i1 %exitcond28, label %._crit_edge5.us.us, label %16

._crit_edge9.loopexit:                            ; preds = %._crit_edge7.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %2
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

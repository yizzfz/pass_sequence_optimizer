; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array([2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.._crit_edge_crit_edge.lr.ph:
  br label %.lr.ph84

.lr.ph84:                                         ; preds = %.lr.ph84.backedge, %.._crit_edge_crit_edge.lr.ph
  %indvars.iv115 = phi i64 [ 0, %.._crit_edge_crit_edge.lr.ph ], [ %indvars.iv.next116, %.lr.ph84.backedge ]
  %indvars.iv113 = phi i64 [ 1, %.._crit_edge_crit_edge.lr.ph ], [ %indvars.iv113.be, %.lr.ph84.backedge ]
  %1 = mul nuw nsw i64 %indvars.iv115, 2001
  %2 = sub i64 1998, %indvars.iv115
  %3 = shl i64 %2, 3
  br label %._crit_edge

._crit_edge.._crit_edge58_crit_edge:              ; preds = %._crit_edge
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %4 = icmp slt i64 %indvars.iv.next116, 2000
  br i1 %4, label %._crit_edge58._crit_edge.thread, label %._crit_edge58._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph84
  %indvars.iv100 = phi i64 [ 0, %.lr.ph84 ], [ %indvars.iv.next101, %._crit_edge ]
  %5 = sub nsw i64 0, %indvars.iv100
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 2000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 2.000000e+03
  %10 = fadd double %9, 1.000000e+00
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv115, i64 %indvars.iv100
  store double %10, double* %11, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next101, %indvars.iv113
  br i1 %exitcond104, label %._crit_edge.._crit_edge58_crit_edge, label %._crit_edge

._crit_edge58._crit_edge.thread:                  ; preds = %._crit_edge.._crit_edge58_crit_edge
  %12 = and i64 %3, 34359738360
  %13 = add nuw nsw i64 %12, 8
  %14 = add nuw nsw i64 %1, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %14
  %15 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %15, i8 0, i64 %13, i32 8, i1 false)
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv115, i64 %indvars.iv115
  store double 1.000000e+00, double* %16, align 8
  br label %.lr.ph84.backedge

.lr.ph84.backedge:                                ; preds = %._crit_edge58._crit_edge.thread, %._crit_edge58._crit_edge
  %indvars.iv113.be = add nuw nsw i64 %indvars.iv113, 1
  br label %.lr.ph84

._crit_edge58._crit_edge:                         ; preds = %._crit_edge.._crit_edge58_crit_edge
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv115, i64 %indvars.iv115
  store double 1.000000e+00, double* %17, align 8
  %exitcond117 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond117, label %._crit_edge60.._crit_edge61_crit_edge.lr.ph, label %.lr.ph84.backedge

._crit_edge60.._crit_edge61_crit_edge.lr.ph:      ; preds = %._crit_edge58._crit_edge
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %19 = bitcast i8* %18 to [2000 x [2000 x double]]*
  call void @llvm.memset.p0i8.i64(i8* %18, i8 0, i64 32000000, i32 8, i1 false)
  br label %._crit_edge60.._crit_edge61_crit_edge.us

._crit_edge60.._crit_edge61_crit_edge.us:         ; preds = %._crit_edge61._crit_edge.us, %._crit_edge60.._crit_edge61_crit_edge.lr.ph
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %._crit_edge61._crit_edge.us ], [ 0, %._crit_edge60.._crit_edge61_crit_edge.lr.ph ]
  br label %._crit_edge61.._crit_edge63_crit_edge.us.us

._crit_edge61._crit_edge.us:                      ; preds = %._crit_edge63._crit_edge.us.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 2000
  br i1 %exitcond6, label %._crit_edge62.._crit_edge64_crit_edge.us.preheader, label %._crit_edge60.._crit_edge61_crit_edge.us

._crit_edge62.._crit_edge64_crit_edge.us.preheader: ; preds = %._crit_edge61._crit_edge.us
  br label %._crit_edge62.._crit_edge64_crit_edge.us

._crit_edge61.._crit_edge63_crit_edge.us.us:      ; preds = %._crit_edge63._crit_edge.us.us, %._crit_edge60.._crit_edge61_crit_edge.us
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge63._crit_edge.us.us ], [ 0, %._crit_edge60.._crit_edge61_crit_edge.us ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv4
  br label %._crit_edge63.us.us

._crit_edge63._crit_edge.us.us:                   ; preds = %._crit_edge63.us.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %._crit_edge61._crit_edge.us, label %._crit_edge61.._crit_edge63_crit_edge.us.us

._crit_edge63.us.us:                              ; preds = %._crit_edge63.us.us, %._crit_edge61.._crit_edge63_crit_edge.us.us
  %indvars.iv91 = phi i64 [ 0, %._crit_edge61.._crit_edge63_crit_edge.us.us ], [ %indvars.iv.next92.1, %._crit_edge63.us.us ]
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv91, i64 %indvars.iv4
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv1, i64 %indvars.iv91
  %26 = load double, double* %25, align 8
  %27 = fadd double %26, %24
  store double %27, double* %25, align 8
  %indvars.iv.next92 = or i64 %indvars.iv91, 1
  %28 = load double, double* %20, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next92, i64 %indvars.iv4
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv1, i64 %indvars.iv.next92
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next92.1 = add nuw nsw i64 %indvars.iv91, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next92.1, 2000
  br i1 %exitcond93.1, label %._crit_edge63._crit_edge.us.us, label %._crit_edge63.us.us

._crit_edge62.._crit_edge64_crit_edge.us:         ; preds = %._crit_edge62.._crit_edge64_crit_edge.us.preheader, %._crit_edge64._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge64._crit_edge.us ], [ 0, %._crit_edge62.._crit_edge64_crit_edge.us.preheader ]
  %storemerge366.us = phi i64 [ %61, %._crit_edge64._crit_edge.us ], [ 0, %._crit_edge62.._crit_edge64_crit_edge.us.preheader ]
  %sext = shl i64 %storemerge366.us, 32
  %35 = ashr exact i64 %sext, 32
  br label %._crit_edge64.us

._crit_edge64.us:                                 ; preds = %._crit_edge64.us, %._crit_edge62.._crit_edge64_crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge62.._crit_edge64_crit_edge.us ], [ %indvars.iv.next.4, %._crit_edge64.us ]
  %36 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %35, i64 %indvars.iv
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %35, i64 %indvars.iv
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %35, i64 %indvars.iv.next
  %42 = bitcast double* %41 to i64*
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %35, i64 %indvars.iv.next
  %45 = bitcast double* %44 to i64*
  store i64 %43, i64* %45, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %46 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %35, i64 %indvars.iv.next.1
  %47 = bitcast double* %46 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %35, i64 %indvars.iv.next.1
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %51 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %35, i64 %indvars.iv.next.2
  %52 = bitcast double* %51 to i64*
  %53 = load i64, i64* %52, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %35, i64 %indvars.iv.next.2
  %55 = bitcast double* %54 to i64*
  store i64 %53, i64* %55, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %56 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %35, i64 %indvars.iv.next.3
  %57 = bitcast double* %56 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %35, i64 %indvars.iv.next.3
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge64._crit_edge.us, label %._crit_edge64.us

._crit_edge64._crit_edge.us:                      ; preds = %._crit_edge64.us
  %61 = add nsw i64 %35, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 2000
  br i1 %exitcond, label %._crit_edge62._crit_edge, label %._crit_edge62.._crit_edge64_crit_edge.us

._crit_edge62._crit_edge:                         ; preds = %._crit_edge64._crit_edge.us
  tail call void @free(i8* nonnull %18) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture) unnamed_addr #0 {
.._crit_edge_crit_edge.preheader:
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %._crit_edge36._crit_edge, %.._crit_edge_crit_edge.preheader
  %indvars.iv63 = phi i64 [ 0, %.._crit_edge_crit_edge.preheader ], [ %indvars.iv.next64, %._crit_edge36._crit_edge ]
  %1 = add i64 %indvars.iv63, -2
  %2 = add nuw nsw i64 %indvars.iv63, 4294967295
  %3 = icmp sgt i64 %indvars.iv63, 0
  br i1 %3, label %._crit_edge.._crit_edge35_crit_edge.preheader, label %.._crit_edge_crit_edge.._crit_edge36._crit_edge_crit_edge

.._crit_edge_crit_edge.._crit_edge36._crit_edge_crit_edge: ; preds = %.._crit_edge_crit_edge
  %.pre1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv63
  br label %._crit_edge36._crit_edge

._crit_edge.._crit_edge35_crit_edge.preheader:    ; preds = %.._crit_edge_crit_edge
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 0
  br label %._crit_edge.._crit_edge35_crit_edge

.lr.ph41:                                         ; preds = %._crit_edge
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv63
  %xtraiter5966 = and i64 %indvars.iv63, 1
  %lcmp.mod60 = icmp eq i64 %xtraiter5966, 0
  br i1 %lcmp.mod60, label %._crit_edge36.prol.loopexit, label %._crit_edge36.prol

._crit_edge36.prol:                               ; preds = %.lr.ph41
  %6 = load double, double* %4, align 8
  %7 = fmul double %6, %6
  %8 = load double, double* %5, align 8
  %9 = fsub double %8, %7
  store double %9, double* %5, align 8
  br label %._crit_edge36.prol.loopexit

._crit_edge36.prol.loopexit:                      ; preds = %.lr.ph41, %._crit_edge36.prol
  %indvars.iv54.unr.ph = phi i64 [ 1, %._crit_edge36.prol ], [ 0, %.lr.ph41 ]
  %10 = trunc i64 %2 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %._crit_edge36._crit_edge, label %._crit_edge36.prol.loopexit.._crit_edge36_crit_edge

._crit_edge36.prol.loopexit.._crit_edge36_crit_edge: ; preds = %._crit_edge36.prol.loopexit
  %.pre68 = load double, double* %5, align 8
  %12 = sub i64 %1, %indvars.iv54.unr.ph
  %13 = lshr i64 %12, 1
  %14 = and i64 %13, 1
  %lcmp.mod3 = icmp eq i64 %14, 0
  br i1 %lcmp.mod3, label %._crit_edge36.prol.preheader, label %._crit_edge36.prol.loopexit2.unr-lcssa

._crit_edge36.prol.preheader:                     ; preds = %._crit_edge36.prol.loopexit.._crit_edge36_crit_edge
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv54.unr.ph
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %16
  %18 = fsub double %.pre68, %17
  store double %18, double* %5, align 8
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv54.unr.ph, 1
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv.next55.prol
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %20
  %22 = fsub double %18, %21
  store double %22, double* %5, align 8
  %indvars.iv.next55.1.prol = or i64 %indvars.iv54.unr.ph, 2
  br label %._crit_edge36.prol.loopexit2.unr-lcssa

._crit_edge36.prol.loopexit2.unr-lcssa:           ; preds = %._crit_edge36.prol.loopexit.._crit_edge36_crit_edge, %._crit_edge36.prol.preheader
  %.unr.ph = phi double [ %22, %._crit_edge36.prol.preheader ], [ %.pre68, %._crit_edge36.prol.loopexit.._crit_edge36_crit_edge ]
  %indvars.iv54.unr.ph5 = phi i64 [ %indvars.iv.next55.1.prol, %._crit_edge36.prol.preheader ], [ %indvars.iv54.unr.ph, %._crit_edge36.prol.loopexit.._crit_edge36_crit_edge ]
  %23 = icmp eq i64 %13, 0
  br i1 %23, label %._crit_edge36._crit_edge.loopexit, label %._crit_edge36.prol.loopexit.._crit_edge36_crit_edge.new

._crit_edge36.prol.loopexit.._crit_edge36_crit_edge.new: ; preds = %._crit_edge36.prol.loopexit2.unr-lcssa
  br label %._crit_edge36

._crit_edge.._crit_edge35_crit_edge:              ; preds = %._crit_edge, %._crit_edge.._crit_edge35_crit_edge.preheader
  %indvars.iv49 = phi i64 [ 0, %._crit_edge.._crit_edge35_crit_edge.preheader ], [ %indvars.iv.next50, %._crit_edge ]
  %24 = add nuw nsw i64 %indvars.iv49, 4294967295
  %25 = icmp sgt i64 %indvars.iv49, 0
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv49
  br i1 %25, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge.._crit_edge35_crit_edge
  %xtraiter67 = and i64 %indvars.iv49, 1
  %lcmp.mod = icmp eq i64 %xtraiter67, 0
  br i1 %lcmp.mod, label %._crit_edge35.prol.loopexit, label %._crit_edge35.prol

._crit_edge35.prol:                               ; preds = %.lr.ph
  %27 = load double, double* %4, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 0
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = load double, double* %26, align 8
  %32 = fsub double %31, %30
  store double %32, double* %26, align 8
  br label %._crit_edge35.prol.loopexit

._crit_edge35.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge35.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge35.prol ], [ 0, %.lr.ph ]
  %33 = trunc i64 %24 to i32
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %._crit_edge, label %._crit_edge35.prol.loopexit.._crit_edge35_crit_edge

._crit_edge35.prol.loopexit.._crit_edge35_crit_edge: ; preds = %._crit_edge35.prol.loopexit
  %.pre = load double, double* %26, align 8
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35, %._crit_edge35.prol.loopexit.._crit_edge35_crit_edge
  %35 = phi double [ %.pre, %._crit_edge35.prol.loopexit.._crit_edge35_crit_edge ], [ %47, %._crit_edge35 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge35.prol.loopexit.._crit_edge35_crit_edge ], [ %indvars.iv.next.1, %._crit_edge35 ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  store double %41, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv.next
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv.next
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %41, %46
  store double %47, double* %26, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv49
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %._crit_edge35

._crit_edge.loopexit:                             ; preds = %._crit_edge35
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge35.prol.loopexit, %._crit_edge.._crit_edge35_crit_edge
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv49
  %49 = load double, double* %48, align 8
  %50 = load double, double* %26, align 8
  %51 = fdiv double %50, %49
  store double %51, double* %26, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond = icmp eq i64 %indvars.iv.next50, %indvars.iv63
  br i1 %exitcond, label %.lr.ph41, label %._crit_edge.._crit_edge35_crit_edge

._crit_edge36:                                    ; preds = %._crit_edge36, %._crit_edge36.prol.loopexit.._crit_edge36_crit_edge.new
  %52 = phi double [ %.unr.ph, %._crit_edge36.prol.loopexit.._crit_edge36_crit_edge.new ], [ %68, %._crit_edge36 ]
  %indvars.iv54 = phi i64 [ %indvars.iv54.unr.ph5, %._crit_edge36.prol.loopexit.._crit_edge36_crit_edge.new ], [ %indvars.iv.next55.1.1, %._crit_edge36 ]
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv54
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %54
  %56 = fsub double %52, %55
  store double %56, double* %5, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv.next55
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %58
  %60 = fsub double %56, %59
  store double %60, double* %5, align 8
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv.next55.1
  %62 = load double, double* %61, align 8
  %63 = fmul double %62, %62
  %64 = fsub double %60, %63
  store double %64, double* %5, align 8
  %indvars.iv.next55.16 = add nsw i64 %indvars.iv54, 3
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv.next55.16
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, %66
  %68 = fsub double %64, %67
  store double %68, double* %5, align 8
  %indvars.iv.next55.1.1 = add nsw i64 %indvars.iv54, 4
  %exitcond58.1.1 = icmp eq i64 %indvars.iv.next55.1.1, %indvars.iv63
  br i1 %exitcond58.1.1, label %._crit_edge36._crit_edge.loopexit.unr-lcssa, label %._crit_edge36

._crit_edge36._crit_edge.loopexit.unr-lcssa:      ; preds = %._crit_edge36
  br label %._crit_edge36._crit_edge.loopexit

._crit_edge36._crit_edge.loopexit:                ; preds = %._crit_edge36.prol.loopexit2.unr-lcssa, %._crit_edge36._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge36._crit_edge

._crit_edge36._crit_edge:                         ; preds = %._crit_edge36._crit_edge.loopexit, %.._crit_edge_crit_edge.._crit_edge36._crit_edge_crit_edge, %._crit_edge36.prol.loopexit
  %.pre-phi = phi double* [ %.pre1, %.._crit_edge_crit_edge.._crit_edge36._crit_edge_crit_edge ], [ %5, %._crit_edge36.prol.loopexit ], [ %5, %._crit_edge36._crit_edge.loopexit ]
  %69 = load double, double* %.pre-phi, align 8
  %70 = tail call double @sqrt(double %69) #3
  store double %70, double* %.pre-phi, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next64, 2000
  br i1 %exitcond65, label %._crit_edge44, label %.._crit_edge_crit_edge

._crit_edge44:                                    ; preds = %._crit_edge36._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge_crit_edge.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge._crit_edge, %.._crit_edge_crit_edge.preheader
  %indvars.iv18 = phi i64 [ 0, %.._crit_edge_crit_edge.preheader ], [ %indvars.iv.next19, %._crit_edge._crit_edge ]
  %indvars.iv16 = phi i64 [ 1, %.._crit_edge_crit_edge.preheader ], [ %indvars.iv.next17, %._crit_edge._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv18, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge10, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge10 ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge10

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv16
  br i1 %exitcond, label %._crit_edge._crit_edge, label %6

._crit_edge._crit_edge:                           ; preds = %._crit_edge10
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond20, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %._crit_edge._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

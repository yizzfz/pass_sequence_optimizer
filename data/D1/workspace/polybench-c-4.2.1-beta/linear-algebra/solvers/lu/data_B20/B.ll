; ModuleID = 'A.ll'
source_filename = "lu.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %3) #4
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
  %18 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  tail call void @free(i8* nonnull %18) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.._crit_edge_crit_edge.preheader:
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %._crit_edge35._crit_edge, %.._crit_edge_crit_edge.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge35._crit_edge ], [ 0, %.._crit_edge_crit_edge.preheader ]
  %1 = add nuw nsw i64 %indvars.iv1, 4294967295
  %2 = icmp sgt i64 %indvars.iv1, 0
  br i1 %2, label %._crit_edge.._crit_edge34_crit_edge.preheader, label %._crit_edge35._crit_edge

._crit_edge.._crit_edge34_crit_edge.preheader:    ; preds = %.._crit_edge_crit_edge
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  br label %._crit_edge.._crit_edge34_crit_edge

._crit_edge35.._crit_edge36_crit_edge.us.preheader: ; preds = %._crit_edge
  %xtraiter6370 = and i64 %indvars.iv1, 1
  %4 = trunc i64 %1 to i32
  %5 = icmp eq i64 %xtraiter6370, 0
  %6 = icmp eq i32 %4, 0
  br label %._crit_edge35.._crit_edge36_crit_edge.us

._crit_edge35.._crit_edge36_crit_edge.us:         ; preds = %._crit_edge36._crit_edge.us, %._crit_edge35.._crit_edge36_crit_edge.us.preheader
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge36._crit_edge.us ], [ %indvars.iv1, %._crit_edge35.._crit_edge36_crit_edge.us.preheader ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv3
  br i1 %5, label %._crit_edge36.us.prol.loopexit, label %._crit_edge36.us.prol

._crit_edge36.us.prol:                            ; preds = %._crit_edge35.._crit_edge36_crit_edge.us
  %8 = load double, double* %3, align 8
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv3
  %10 = load double, double* %9, align 8
  %11 = fmul double %8, %10
  %12 = load double, double* %7, align 8
  %13 = fsub double %12, %11
  store double %13, double* %7, align 8
  br label %._crit_edge36.us.prol.loopexit

._crit_edge36.us.prol.loopexit:                   ; preds = %._crit_edge35.._crit_edge36_crit_edge.us, %._crit_edge36.us.prol
  %indvars.iv58.unr.ph = phi i64 [ 1, %._crit_edge36.us.prol ], [ 0, %._crit_edge35.._crit_edge36_crit_edge.us ]
  br i1 %6, label %._crit_edge36._crit_edge.us, label %._crit_edge36.us.prol.loopexit.._crit_edge36.us_crit_edge

._crit_edge36.us.prol.loopexit.._crit_edge36.us_crit_edge: ; preds = %._crit_edge36.us.prol.loopexit
  %.pre72 = load double, double* %7, align 8
  br label %._crit_edge36.us

._crit_edge36.us:                                 ; preds = %._crit_edge36.us, %._crit_edge36.us.prol.loopexit.._crit_edge36.us_crit_edge
  %14 = phi double [ %.pre72, %._crit_edge36.us.prol.loopexit.._crit_edge36.us_crit_edge ], [ %26, %._crit_edge36.us ]
  %indvars.iv58 = phi i64 [ %indvars.iv58.unr.ph, %._crit_edge36.us.prol.loopexit.._crit_edge36.us_crit_edge ], [ %indvars.iv.next59.1, %._crit_edge36.us ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv58
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv58, i64 %indvars.iv3
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %14, %19
  store double %20, double* %7, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next59
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next59, i64 %indvars.iv3
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %7, align 8
  %indvars.iv.next59.1 = add nuw nsw i64 %indvars.iv58, 2
  %exitcond62.1 = icmp eq i64 %indvars.iv.next59.1, %indvars.iv1
  br i1 %exitcond62.1, label %._crit_edge36._crit_edge.us.loopexit, label %._crit_edge36.us

._crit_edge36._crit_edge.us.loopexit:             ; preds = %._crit_edge36.us
  br label %._crit_edge36._crit_edge.us

._crit_edge36._crit_edge.us:                      ; preds = %._crit_edge36._crit_edge.us.loopexit, %._crit_edge36.us.prol.loopexit
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond5, label %._crit_edge35._crit_edge.loopexit, label %._crit_edge35.._crit_edge36_crit_edge.us

._crit_edge.._crit_edge34_crit_edge:              ; preds = %._crit_edge, %._crit_edge.._crit_edge34_crit_edge.preheader
  %indvars.iv52 = phi i64 [ 0, %._crit_edge.._crit_edge34_crit_edge.preheader ], [ %indvars.iv.next53, %._crit_edge ]
  %27 = add nuw nsw i64 %indvars.iv52, 4294967295
  %28 = icmp sgt i64 %indvars.iv52, 0
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv52
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge.._crit_edge34_crit_edge
  %xtraiter71 = and i64 %indvars.iv52, 1
  %lcmp.mod = icmp eq i64 %xtraiter71, 0
  br i1 %lcmp.mod, label %._crit_edge34.prol.loopexit, label %._crit_edge34.prol

._crit_edge34.prol:                               ; preds = %.lr.ph
  %30 = load double, double* %3, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv52
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = load double, double* %29, align 8
  %35 = fsub double %34, %33
  store double %35, double* %29, align 8
  br label %._crit_edge34.prol.loopexit

._crit_edge34.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge34.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge34.prol ], [ 0, %.lr.ph ]
  %36 = trunc i64 %27 to i32
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %._crit_edge, label %._crit_edge34.prol.loopexit.._crit_edge34_crit_edge

._crit_edge34.prol.loopexit.._crit_edge34_crit_edge: ; preds = %._crit_edge34.prol.loopexit
  %.pre = load double, double* %29, align 8
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34, %._crit_edge34.prol.loopexit.._crit_edge34_crit_edge
  %38 = phi double [ %.pre, %._crit_edge34.prol.loopexit.._crit_edge34_crit_edge ], [ %50, %._crit_edge34 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge34.prol.loopexit.._crit_edge34_crit_edge ], [ %indvars.iv.next.1, %._crit_edge34 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv52
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  store double %44, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv52
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %44, %49
  store double %50, double* %29, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv52
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %._crit_edge34

._crit_edge.loopexit:                             ; preds = %._crit_edge34
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge34.prol.loopexit, %._crit_edge.._crit_edge34_crit_edge
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv52, i64 %indvars.iv52
  %52 = load double, double* %51, align 8
  %53 = load double, double* %29, align 8
  %54 = fdiv double %53, %52
  store double %54, double* %29, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, %indvars.iv1
  br i1 %exitcond, label %._crit_edge35.._crit_edge36_crit_edge.us.preheader, label %._crit_edge.._crit_edge34_crit_edge

._crit_edge35._crit_edge.loopexit:                ; preds = %._crit_edge36._crit_edge.us
  br label %._crit_edge35._crit_edge

._crit_edge35._crit_edge:                         ; preds = %._crit_edge35._crit_edge.loopexit, %.._crit_edge_crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond69, label %._crit_edge45, label %.._crit_edge_crit_edge

._crit_edge45:                                    ; preds = %._crit_edge35._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge_crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.us.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv1, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge10.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge10.us ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge10.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %6

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge10.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %._crit_edge, label %.._crit_edge_crit_edge.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]*) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.backedge, %1
  %indvars.iv113 = phi i64 [ 0, %1 ], [ %indvars.iv.next114, %.lr.ph.backedge ]
  %indvars.iv111 = phi i64 [ 1, %1 ], [ %indvars.iv111.be, %.lr.ph.backedge ]
  %2 = mul nuw nsw i64 %indvars.iv113, 2001
  %3 = add nuw nsw i64 %2, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %3
  %4 = sub i64 1998, %indvars.iv113
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  %7 = add nuw nsw i64 %6, 8
  br label %8

; <label>:8:                                      ; preds = %8, %.lr.ph
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %8 ], [ 0, %.lr.ph ]
  %9 = sub nsw i64 0, %indvars.iv98
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv113, i64 %indvars.iv98
  store double %14, double* %15, align 8
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next99, %indvars.iv111
  br i1 %exitcond102, label %._crit_edge, label %8

._crit_edge:                                      ; preds = %8
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %16 = icmp slt i64 %indvars.iv.next114, 2000
  br i1 %16, label %._crit_edge85.thread, label %._crit_edge85

._crit_edge85.thread:                             ; preds = %._crit_edge
  %17 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %17, i8 0, i64 %7, i32 8, i1 false)
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv113, i64 %indvars.iv113
  store double 1.000000e+00, double* %18, align 8
  br label %.lr.ph.backedge

._crit_edge85:                                    ; preds = %._crit_edge
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv113, i64 %indvars.iv113
  store double 1.000000e+00, double* %19, align 8
  %exitcond115 = icmp eq i64 %indvars.iv.next114, 2000
  br i1 %exitcond115, label %.preheader70.preheader, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge85, %._crit_edge85.thread
  %indvars.iv111.be = add nuw nsw i64 %indvars.iv111, 1
  br label %.lr.ph

.preheader70.preheader:                           ; preds = %._crit_edge85
  %20 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  call void @llvm.memset.p0i8.i64(i8* %20, i8 0, i64 32000000, i32 8, i1 false)
  %21 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %22 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %.preheader70

.preheader70:                                     ; preds = %.preheader70.preheader, %44
  %.06178 = phi i32 [ %45, %44 ], [ 0, %.preheader70.preheader ]
  %23 = sext i32 %.06178 to i64
  br label %.preheader69

.preheader69:                                     ; preds = %.preheader70, %41
  %.16477 = phi i32 [ 0, %.preheader70 ], [ %42, %41 ]
  %24 = sext i32 %.16477 to i64
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %24, i64 %23
  br label %26

; <label>:26:                                     ; preds = %26, %.preheader69
  %indvars.iv89 = phi i64 [ 0, %.preheader69 ], [ %indvars.iv.next90.1, %26 ]
  %27 = load double, double* %25, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89, i64 %23
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %24, i64 %indvars.iv89
  %32 = load double, double* %31, align 8
  %33 = fadd double %32, %30
  store double %33, double* %31, align 8
  %indvars.iv.next90 = or i64 %indvars.iv89, 1
  %34 = load double, double* %25, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next90, i64 %23
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %24, i64 %indvars.iv.next90
  %39 = load double, double* %38, align 8
  %40 = fadd double %39, %37
  store double %40, double* %38, align 8
  %indvars.iv.next90.1 = add nsw i64 %indvars.iv89, 2
  %exitcond91.1 = icmp eq i64 %indvars.iv.next90.1, 2000
  br i1 %exitcond91.1, label %41, label %26

; <label>:41:                                     ; preds = %26
  %42 = add nsw i32 %.16477, 1
  %43 = icmp slt i32 %42, 2000
  br i1 %43, label %.preheader69, label %44

; <label>:44:                                     ; preds = %41
  %45 = add nsw i32 %.06178, 1
  %46 = icmp slt i32 %45, 2000
  br i1 %46, label %.preheader70, label %.preheader.preheader

.preheader.preheader:                             ; preds = %44
  %47 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %48 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %49 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %50 = bitcast i8* %20 to [2000 x [2000 x double]]*
  %51 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %79
  %indvar = phi i64 [ %indvar.next, %79 ], [ 0, %.preheader.preheader ]
  %.26575 = phi i64 [ %80, %79 ], [ 0, %.preheader.preheader ]
  %sext = shl i64 %.26575, 32
  %52 = ashr exact i64 %sext, 32
  br label %53

; <label>:53:                                     ; preds = %53, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %53 ]
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %52, i64 %indvars.iv
  %55 = bitcast double* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %52, i64 %indvars.iv
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %52, i64 %indvars.iv.next
  %60 = bitcast double* %59 to i64*
  %61 = load i64, i64* %60, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %52, i64 %indvars.iv.next
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %52, i64 %indvars.iv.next.1
  %65 = bitcast double* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %52, i64 %indvars.iv.next.1
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %52, i64 %indvars.iv.next.2
  %70 = bitcast double* %69 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %52, i64 %indvars.iv.next.2
  %73 = bitcast double* %72 to i64*
  store i64 %71, i64* %73, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %52, i64 %indvars.iv.next.3
  %75 = bitcast double* %74 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %52, i64 %indvars.iv.next.3
  %78 = bitcast double* %77 to i64*
  store i64 %76, i64* %78, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %79, label %53

; <label>:79:                                     ; preds = %53
  %80 = add nsw i64 %52, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond88 = icmp eq i64 %indvar.next, 2000
  br i1 %exitcond88, label %81, label %.preheader

; <label>:81:                                     ; preds = %79
  tail call void @free(i8* nonnull %20) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]*) unnamed_addr #0 {
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge49, %1
  %indvars.iv64 = phi i64 [ 0, %1 ], [ %indvars.iv.next65, %._crit_edge49 ]
  %2 = add i64 %indvars.iv64, -2
  %3 = icmp sgt i64 %indvars.iv64, 0
  br i1 %3, label %.preheader.preheader, label %._crit_edge49

.preheader.preheader:                             ; preds = %.preheader44
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 0
  br label %.preheader

.preheader43:                                     ; preds = %._crit_edge
  %5 = icmp sgt i64 %indvars.iv64, 0
  br i1 %5, label %.lr.ph48, label %._crit_edge49

.lr.ph48:                                         ; preds = %.preheader43
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv64
  %xtraiter3 = and i64 %indvars.iv64, 1
  %lcmp.mod4 = icmp eq i64 %xtraiter3, 0
  br i1 %lcmp.mod4, label %.prol.loopexit2, label %.prol.preheader1

.prol.preheader1:                                 ; preds = %.lr.ph48
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 0
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = load double, double* %6, align 8
  %11 = fsub double %10, %9
  store double %11, double* %6, align 8
  br label %.prol.loopexit2

.prol.loopexit2:                                  ; preds = %.prol.preheader1, %.lr.ph48
  %indvars.iv59.unr.ph = phi i64 [ 1, %.prol.preheader1 ], [ 0, %.lr.ph48 ]
  %12 = icmp eq i64 %indvars.iv64, 1
  br i1 %12, label %._crit_edge49, label %.lr.ph48.new.preheader

.lr.ph48.new.preheader:                           ; preds = %.prol.loopexit2
  %13 = sub i64 %2, %indvars.iv59.unr.ph
  %14 = lshr i64 %13, 1
  %15 = and i64 %14, 1
  %lcmp.mod6 = icmp eq i64 %15, 0
  br i1 %lcmp.mod6, label %.lr.ph48.new.prol.preheader, label %.lr.ph48.new.prol.loopexit.unr-lcssa

.lr.ph48.new.prol.preheader:                      ; preds = %.lr.ph48.new.preheader
  br label %.lr.ph48.new.prol

.lr.ph48.new.prol:                                ; preds = %.lr.ph48.new.prol.preheader
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv59.unr.ph
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %17
  %19 = load double, double* %6, align 8
  %20 = fsub double %19, %18
  store double %20, double* %6, align 8
  %indvars.iv.next60.prol = add nuw nsw i64 %indvars.iv59.unr.ph, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv.next60.prol
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %22
  %24 = fsub double %20, %23
  store double %24, double* %6, align 8
  %indvars.iv.next60.1.prol = or i64 %indvars.iv59.unr.ph, 2
  br label %.lr.ph48.new.prol.loopexit.unr-lcssa

.lr.ph48.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph48.new.preheader, %.lr.ph48.new.prol
  %indvars.iv59.unr.ph7 = phi i64 [ %indvars.iv.next60.1.prol, %.lr.ph48.new.prol ], [ %indvars.iv59.unr.ph, %.lr.ph48.new.preheader ]
  br label %.lr.ph48.new.prol.loopexit

.lr.ph48.new.prol.loopexit:                       ; preds = %.lr.ph48.new.prol.loopexit.unr-lcssa
  %25 = icmp eq i64 %14, 0
  br i1 %25, label %._crit_edge49.loopexit, label %.lr.ph48.new.preheader.new

.lr.ph48.new.preheader.new:                       ; preds = %.lr.ph48.new.prol.loopexit
  br label %.lr.ph48.new

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge ], [ 0, %.preheader.preheader ]
  %26 = icmp sgt i64 %indvars.iv53, 0
  br i1 %26, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv53
  %xtraiter = and i64 %indvars.iv53, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %28 = load double, double* %4, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv53, i64 0
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = load double, double* %27, align 8
  %33 = fsub double %32, %31
  store double %33, double* %27, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %34 = icmp eq i64 %indvars.iv53, 1
  br i1 %34, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv53, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = load double, double* %27, align 8
  %41 = fsub double %40, %39
  store double %41, double* %27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv.next
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv53, i64 %indvars.iv.next
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = load double, double* %27, align 8
  %48 = fsub double %47, %46
  store double %48, double* %27, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv53
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv53, i64 %indvars.iv53
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv53
  %52 = load double, double* %51, align 8
  %53 = fdiv double %52, %50
  store double %53, double* %51, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next54, %indvars.iv64
  br i1 %exitcond58, label %.preheader43, label %.preheader

.lr.ph48.new:                                     ; preds = %.lr.ph48.new, %.lr.ph48.new.preheader.new
  %indvars.iv59 = phi i64 [ %indvars.iv59.unr.ph7, %.lr.ph48.new.preheader.new ], [ %indvars.iv.next60.1.1, %.lr.ph48.new ]
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv59
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %55
  %57 = load double, double* %6, align 8
  %58 = fsub double %57, %56
  store double %58, double* %6, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv.next60
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %60
  %62 = fsub double %58, %61
  store double %62, double* %6, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv.next60.1
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %64
  %66 = fsub double %62, %65
  store double %66, double* %6, align 8
  %indvars.iv.next60.18 = add nsw i64 %indvars.iv59, 3
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv.next60.18
  %68 = load double, double* %67, align 8
  %69 = fmul double %68, %68
  %70 = fsub double %66, %69
  store double %70, double* %6, align 8
  %indvars.iv.next60.1.1 = add nsw i64 %indvars.iv59, 4
  %exitcond63.1.1 = icmp eq i64 %indvars.iv.next60.1.1, %indvars.iv64
  br i1 %exitcond63.1.1, label %._crit_edge49.loopexit.unr-lcssa, label %.lr.ph48.new

._crit_edge49.loopexit.unr-lcssa:                 ; preds = %.lr.ph48.new
  br label %._crit_edge49.loopexit

._crit_edge49.loopexit:                           ; preds = %.lr.ph48.new.prol.loopexit, %._crit_edge49.loopexit.unr-lcssa
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %.preheader44, %.prol.loopexit2, %.preheader43
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %indvars.iv64
  %72 = load double, double* %71, align 8
  %73 = tail call double @sqrt(double %72) #3
  store double %73, double* %71, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next65, 2000
  br i1 %exitcond66, label %74, label %.preheader44

; <label>:74:                                     ; preds = %._crit_edge49
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph

.lr.ph:                                           ; preds = %1, %._crit_edge
  %indvars.iv19 = phi i64 [ 0, %1 ], [ %indvars.iv.next20, %._crit_edge ]
  %indvars.iv17 = phi i64 [ 1, %1 ], [ %indvars.iv.next18, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv19, 2000
  br label %7

; <label>:7:                                      ; preds = %14, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %14 ], [ 0, %.lr.ph ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv17
  br i1 %exitcond, label %._crit_edge, label %7

._crit_edge:                                      ; preds = %14
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 2000
  br i1 %exitcond21, label %19, label %.lr.ph

; <label>:19:                                     ; preds = %._crit_edge
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

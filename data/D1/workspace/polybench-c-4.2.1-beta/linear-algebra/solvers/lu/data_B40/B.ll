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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
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
  %20 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  tail call void @free(i8* nonnull %20) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]*) unnamed_addr #2 {
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge51, %1
  %indvars.iv69 = phi i64 [ 0, %1 ], [ %indvars.iv.next70, %._crit_edge51 ]
  %2 = icmp sgt i64 %indvars.iv69, 0
  br i1 %2, label %.preheader42.preheader, label %._crit_edge51

.preheader42.preheader:                           ; preds = %.preheader44
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69, i64 0
  br label %.preheader42

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %4 = icmp sgt i64 %indvars.iv69, 0
  br i1 %4, label %.preheader.us.preheader, label %._crit_edge51

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %5 = trunc i64 %indvars.iv69 to i32
  %xtraiter3 = and i64 %indvars.iv69, 1
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69, i64 0
  %7 = icmp eq i64 %xtraiter3, 0
  %8 = icmp eq i64 %indvars.iv69, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge49.us
  %.14050.us = phi i32 [ %31, %._crit_edge49.us ], [ %5, %.preheader.us.preheader ]
  %9 = sext i32 %.14050.us to i64
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69, i64 %9
  br i1 %7, label %.prol.loopexit2, label %.prol.preheader1

.prol.preheader1:                                 ; preds = %.preheader.us
  %11 = load double, double* %6, align 8
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %9
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = load double, double* %10, align 8
  %16 = fsub double %15, %14
  store double %16, double* %10, align 8
  br label %.prol.loopexit2

.prol.loopexit2:                                  ; preds = %.prol.preheader1, %.preheader.us
  %indvars.iv64.unr.ph = phi i64 [ 1, %.prol.preheader1 ], [ 0, %.preheader.us ]
  br i1 %8, label %._crit_edge49.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit2
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv64 = phi i64 [ %indvars.iv.next65.1, %.preheader.us.new ], [ %indvars.iv64.unr.ph, %.preheader.us.new.preheader ]
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69, i64 %indvars.iv64
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv64, i64 %9
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = load double, double* %10, align 8
  %23 = fsub double %22, %21
  store double %23, double* %10, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69, i64 %indvars.iv.next65
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next65, i64 %9
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = load double, double* %10, align 8
  %30 = fsub double %29, %28
  store double %30, double* %10, align 8
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, 2
  %exitcond68.1 = icmp eq i64 %indvars.iv.next65.1, %indvars.iv69
  br i1 %exitcond68.1, label %._crit_edge49.us.loopexit, label %.preheader.us.new

._crit_edge49.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge49.us

._crit_edge49.us:                                 ; preds = %._crit_edge49.us.loopexit, %.prol.loopexit2
  %31 = add nsw i32 %.14050.us, 1
  %32 = icmp slt i32 %31, 2000
  br i1 %32, label %.preheader.us, label %._crit_edge51.loopexit

.preheader42:                                     ; preds = %.preheader42.preheader, %._crit_edge
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge ], [ 0, %.preheader42.preheader ]
  %33 = icmp sgt i64 %indvars.iv57, 0
  br i1 %33, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader42
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69, i64 %indvars.iv57
  %xtraiter = and i64 %indvars.iv57, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %35 = load double, double* %3, align 8
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv57
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = load double, double* %34, align 8
  %40 = fsub double %39, %38
  store double %40, double* %34, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %41 = icmp eq i64 %indvars.iv57, 1
  br i1 %41, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv57
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = load double, double* %34, align 8
  %48 = fsub double %47, %46
  store double %48, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv57
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = load double, double* %34, align 8
  %55 = fsub double %54, %53
  store double %55, double* %34, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv57
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader42
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv57
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69, i64 %indvars.iv57
  %59 = load double, double* %58, align 8
  %60 = fdiv double %59, %57
  store double %60, double* %58, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next58, %indvars.iv69
  br i1 %exitcond62, label %.preheader.lr.ph, label %.preheader42

._crit_edge51.loopexit:                           ; preds = %._crit_edge49.us
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %.preheader44, %.preheader.lr.ph
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next70, 2000
  br i1 %exitcond71, label %61, label %.preheader44

; <label>:61:                                     ; preds = %._crit_edge51
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %1, %21
  %.01113 = phi i32 [ 0, %1 ], [ %22, %21 ]
  %6 = mul nuw nsw i32 %.01113, 2000
  %7 = sext i32 %.01113 to i64
  %8 = zext i32 %6 to i64
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %16 ]
  %10 = add i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %7, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %21, label %9

; <label>:21:                                     ; preds = %16
  %22 = add nsw i32 %.01113, 1
  %23 = icmp slt i32 %22, 2000
  br i1 %23, label %.preheader, label %24

; <label>:24:                                     ; preds = %21
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

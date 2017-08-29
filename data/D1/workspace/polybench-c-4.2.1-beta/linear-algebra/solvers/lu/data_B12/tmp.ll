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
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.backedge, %2
  %indvars.iv109 = phi i64 [ 0, %2 ], [ %indvars.iv.next110, %.lr.ph.backedge ]
  %indvars.iv107 = phi i64 [ 1, %2 ], [ %indvars.iv107.be, %.lr.ph.backedge ]
  %3 = sub i64 1998, %indvars.iv109
  br label %11

.preheader63:                                     ; preds = %11
  %4 = shl i64 %3, 3
  %5 = add nuw nsw i64 %indvars.iv109, 1
  %6 = and i64 %4, 34359738360
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %7 = icmp slt i64 %indvars.iv.next110, 2000
  br i1 %7, label %._crit_edge.thread, label %._crit_edge

._crit_edge.thread:                               ; preds = %.preheader63
  %8 = add nuw nsw i64 %6, 8
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %5
  %9 = mul nuw nsw i64 %indvars.iv109, 2000
  %scevgep105 = getelementptr double, double* %scevgep, i64 %9
  %scevgep105106 = bitcast double* %scevgep105 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105106, i8 0, i64 %8, i32 8, i1 false)
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv109
  store double 1.000000e+00, double* %10, align 8
  br label %.lr.ph.backedge

; <label>:11:                                     ; preds = %11, %.lr.ph
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %11 ], [ 0, %.lr.ph ]
  %12 = sub nsw i64 0, %indvars.iv95
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 2000
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 2.000000e+03
  %17 = fadd double %16, 1.000000e+00
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv95
  store double %17, double* %18, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next96, %indvars.iv107
  br i1 %exitcond99, label %.preheader63, label %11

._crit_edge:                                      ; preds = %.preheader63
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv109, i64 %indvars.iv109
  store double 1.000000e+00, double* %19, align 8
  %exitcond111 = icmp eq i64 %indvars.iv.next110, 2000
  br i1 %exitcond111, label %.preheader60.preheader, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge, %._crit_edge.thread
  %indvars.iv107.be = add nuw nsw i64 %indvars.iv107, 1
  br label %.lr.ph

.preheader60.preheader:                           ; preds = %._crit_edge
  %20 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %20, i8 0, i64 32000000, i32 8, i1 false)
  %21 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %.preheader60

.preheader60:                                     ; preds = %39, %.preheader60.preheader
  %indvars.iv86 = phi i64 [ 0, %.preheader60.preheader ], [ %indvars.iv.next87, %39 ]
  br label %.preheader59

.preheader59:                                     ; preds = %38, %.preheader60
  %indvars.iv83 = phi i64 [ 0, %.preheader60 ], [ %indvars.iv.next84, %38 ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv83, i64 %indvars.iv86
  br label %23

; <label>:23:                                     ; preds = %23, %.preheader59
  %indvars.iv80 = phi i64 [ 0, %.preheader59 ], [ %indvars.iv.next81.1, %23 ]
  %24 = load double, double* %22, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv80, i64 %indvars.iv86
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv83, i64 %indvars.iv80
  %29 = load double, double* %28, align 8
  %30 = fadd double %29, %27
  store double %30, double* %28, align 8
  %indvars.iv.next81 = or i64 %indvars.iv80, 1
  %31 = load double, double* %22, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next81, i64 %indvars.iv86
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next81
  %36 = load double, double* %35, align 8
  %37 = fadd double %36, %34
  store double %37, double* %35, align 8
  %indvars.iv.next81.1 = add nuw nsw i64 %indvars.iv80, 2
  %exitcond82.1 = icmp eq i64 %indvars.iv.next81.1, 2000
  br i1 %exitcond82.1, label %38, label %23

; <label>:38:                                     ; preds = %23
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next84, 2000
  br i1 %exitcond85, label %39, label %.preheader59

; <label>:39:                                     ; preds = %38
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next87, 2000
  br i1 %exitcond88, label %.preheader.preheader, label %.preheader60

.preheader.preheader:                             ; preds = %39
  %40 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %67
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %67 ], [ 0, %.preheader.preheader ]
  br label %41

; <label>:41:                                     ; preds = %41, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %41 ]
  %42 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv78, i64 %indvars.iv
  %43 = bitcast double* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv78, i64 %indvars.iv
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv78, i64 %indvars.iv.next
  %48 = bitcast double* %47 to i64*
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv78, i64 %indvars.iv.next
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv78, i64 %indvars.iv.next.1
  %53 = bitcast double* %52 to i64*
  %54 = load i64, i64* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv78, i64 %indvars.iv.next.1
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv78, i64 %indvars.iv.next.2
  %58 = bitcast double* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv78, i64 %indvars.iv.next.2
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv78, i64 %indvars.iv.next.3
  %63 = bitcast double* %62 to i64*
  %64 = load i64, i64* %63, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv78, i64 %indvars.iv.next.3
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %67, label %41

; <label>:67:                                     ; preds = %41
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond = icmp eq i64 %indvars.iv.next79, 2000
  br i1 %exitcond, label %68, label %.preheader

; <label>:68:                                     ; preds = %67
  tail call void @free(i8* nonnull %20) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]*) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader36.preheader, label %._crit_edge47

.preheader36.preheader:                           ; preds = %2
  %wide.trip.count83 = zext i32 %0 to i64
  %wide.trip.count77 = zext i32 %0 to i64
  br label %.preheader36

.preheader36:                                     ; preds = %.preheader36.preheader, %._crit_edge43
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %._crit_edge43 ], [ 0, %.preheader36.preheader ]
  %4 = add nuw i64 %indvars.iv81, 4294967295
  %5 = icmp sgt i64 %indvars.iv81, 0
  br i1 %5, label %.preheader34.preheader, label %._crit_edge43

.preheader34.preheader:                           ; preds = %.preheader36
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81, i64 0
  br label %.preheader34

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %7 = icmp sgt i64 %indvars.iv81, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge43

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter7085 = and i64 %indvars.iv81, 1
  %8 = trunc i64 %4 to i32
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81, i64 0
  %10 = icmp eq i64 %xtraiter7085, 0
  %11 = icmp eq i32 %8, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge41.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %._crit_edge41.us ], [ %indvars.iv81, %.preheader.us.preheader ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81, i64 %indvars.iv75
  %.pre51 = load double, double* %12, align 8
  br i1 %10, label %.prol.loopexit69, label %13

; <label>:13:                                     ; preds = %.preheader.us
  %14 = load double, double* %9, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv75
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre51, %17
  store double %18, double* %12, align 8
  br label %.prol.loopexit69

.prol.loopexit69:                                 ; preds = %.preheader.us, %13
  %indvars.iv63.unr.ph = phi i64 [ 1, %13 ], [ 0, %.preheader.us ]
  %.unr72.ph = phi double [ %18, %13 ], [ %.pre51, %.preheader.us ]
  br i1 %11, label %._crit_edge41.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit69
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.1, %.preheader.us.new ], [ %indvars.iv63.unr.ph, %.preheader.us.new.preheader ]
  %19 = phi double [ %31, %.preheader.us.new ], [ %.unr72.ph, %.preheader.us.new.preheader ]
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81, i64 %indvars.iv63
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv63, i64 %indvars.iv75
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  store double %25, double* %12, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81, i64 %indvars.iv.next64
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next64, i64 %indvars.iv75
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fsub double %25, %30
  store double %31, double* %12, align 8
  %indvars.iv.next64.1 = add nuw nsw i64 %indvars.iv63, 2
  %exitcond67.1 = icmp eq i64 %indvars.iv.next64.1, %indvars.iv81
  br i1 %exitcond67.1, label %._crit_edge41.us.loopexit, label %.preheader.us.new

._crit_edge41.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %._crit_edge41.us.loopexit, %.prol.loopexit69
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, %wide.trip.count77
  br i1 %exitcond78, label %._crit_edge43.loopexit, label %.preheader.us

.preheader34:                                     ; preds = %.preheader34.preheader, %._crit_edge
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge ], [ 0, %.preheader34.preheader ]
  %32 = add nuw i64 %indvars.iv57, 4294967295
  %33 = icmp sgt i64 %indvars.iv57, 0
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81, i64 %indvars.iv57
  %.pre = load double, double* %34, align 8
  br i1 %33, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader34
  %xtraiter86 = and i64 %indvars.iv57, 1
  %lcmp.mod = icmp eq i64 %xtraiter86, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %35

; <label>:35:                                     ; preds = %.lr.ph
  %36 = load double, double* %6, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv57
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fsub double %.pre, %39
  store double %40, double* %34, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %35
  %indvars.iv.unr.ph = phi i64 [ 1, %35 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %40, %35 ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %40, %35 ], [ undef, %.lr.ph ]
  %41 = trunc i64 %32 to i32
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %43 = phi double [ %55, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv57
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  store double %49, double* %34, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv81, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv57
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fsub double %49, %54
  store double %55, double* %34, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv57
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader34, %.prol.loopexit
  %56 = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %.pre, %.preheader34 ], [ %55, %._crit_edge.loopexit ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv57
  %58 = load double, double* %57, align 8
  %59 = fdiv double %56, %58
  store double %59, double* %34, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond = icmp eq i64 %indvars.iv.next58, %indvars.iv81
  br i1 %exitcond, label %.preheader.lr.ph, label %.preheader34

._crit_edge43.loopexit:                           ; preds = %._crit_edge41.us
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge43.loopexit, %.preheader36, %.preheader.lr.ph
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next82, %wide.trip.count83
  br i1 %exitcond84, label %._crit_edge47.loopexit, label %.preheader36

._crit_edge47.loopexit:                           ; preds = %._crit_edge43
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge47.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge12

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count15 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv13, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %wide.trip.count15
  br i1 %exitcond16, label %._crit_edge12.loopexit, label %.preheader.us

._crit_edge12.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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

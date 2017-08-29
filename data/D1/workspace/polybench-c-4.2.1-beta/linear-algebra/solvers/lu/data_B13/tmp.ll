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
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.backedge, %1
  %indvars.iv109 = phi i64 [ 0, %1 ], [ %indvars.iv.next110, %.lr.ph.backedge ]
  %indvars.iv107 = phi i64 [ 1, %1 ], [ %indvars.iv107.be, %.lr.ph.backedge ]
  %2 = sub i64 1998, %indvars.iv109
  %3 = shl i64 %2, 3
  br label %10

.preheader61:                                     ; preds = %10
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %4 = icmp slt i64 %indvars.iv.next110, 2000
  br i1 %4, label %._crit_edge.thread, label %._crit_edge

._crit_edge.thread:                               ; preds = %.preheader61
  %5 = and i64 %3, 34359738360
  %6 = add nuw nsw i64 %indvars.iv109, 1
  %7 = add nuw nsw i64 %5, 8
  %scevgep104 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %6
  %8 = mul nuw nsw i64 %indvars.iv109, 2000
  %scevgep105 = getelementptr double, double* %scevgep104, i64 %8
  %scevgep105106 = bitcast double* %scevgep105 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep105106, i8 0, i64 %7, i32 8, i1 false)
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %indvars.iv109
  store double 1.000000e+00, double* %9, align 8
  br label %.lr.ph.backedge

; <label>:10:                                     ; preds = %10, %.lr.ph
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %10 ], [ 0, %.lr.ph ]
  %11 = sub nsw i64 0, %indvars.iv94
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 2000
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 2.000000e+03
  %16 = fadd double %15, 1.000000e+00
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %indvars.iv94
  store double %16, double* %17, align 8
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next95, %indvars.iv107
  br i1 %exitcond98, label %.preheader61, label %10

._crit_edge:                                      ; preds = %.preheader61
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %indvars.iv109
  store double 1.000000e+00, double* %18, align 8
  %exitcond111 = icmp eq i64 %indvars.iv.next110, 2000
  br i1 %exitcond111, label %19, label %.lr.ph.backedge

.lr.ph.backedge:                                  ; preds = %._crit_edge, %._crit_edge.thread
  %indvars.iv107.be = add nuw nsw i64 %indvars.iv107, 1
  br label %.lr.ph

; <label>:19:                                     ; preds = %._crit_edge
  %20 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %20, i8 0, i64 32000000, i32 8, i1 false)
  %21 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %.preheader58

.preheader58:                                     ; preds = %39, %19
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %39 ], [ 0, %19 ]
  br label %.preheader57

.preheader57:                                     ; preds = %38, %.preheader58
  %indvars.iv82 = phi i64 [ 0, %.preheader58 ], [ %indvars.iv.next83, %38 ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv82, i64 %indvars.iv85
  br label %23

; <label>:23:                                     ; preds = %23, %.preheader57
  %indvars.iv79 = phi i64 [ 0, %.preheader57 ], [ %indvars.iv.next80.1, %23 ]
  %24 = load double, double* %22, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79, i64 %indvars.iv85
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv82, i64 %indvars.iv79
  %29 = load double, double* %28, align 8
  %30 = fadd double %29, %27
  store double %30, double* %28, align 8
  %indvars.iv.next80 = or i64 %indvars.iv79, 1
  %31 = load double, double* %22, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next80, i64 %indvars.iv85
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next80
  %36 = load double, double* %35, align 8
  %37 = fadd double %36, %34
  store double %37, double* %35, align 8
  %indvars.iv.next80.1 = add nuw nsw i64 %indvars.iv79, 2
  %exitcond81.1 = icmp eq i64 %indvars.iv.next80.1, 2000
  br i1 %exitcond81.1, label %38, label %23

; <label>:38:                                     ; preds = %23
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next83, 2000
  br i1 %exitcond84, label %39, label %.preheader57

; <label>:39:                                     ; preds = %38
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next86, 2000
  br i1 %exitcond87, label %.preheader.preheader, label %.preheader58

.preheader.preheader:                             ; preds = %39
  %40 = bitcast i8* %20 to [2000 x [2000 x double]]*
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %67
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %67 ], [ 0, %.preheader.preheader ]
  br label %41

; <label>:41:                                     ; preds = %41, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.4, %41 ]
  %42 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv76, i64 %indvars.iv
  %43 = bitcast double* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv
  %46 = bitcast double* %45 to i64*
  store i64 %44, i64* %46, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv76, i64 %indvars.iv.next
  %48 = bitcast double* %47 to i64*
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv.next
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %52 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv76, i64 %indvars.iv.next.1
  %53 = bitcast double* %52 to i64*
  %54 = load i64, i64* %53, align 8
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv.next.1
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv76, i64 %indvars.iv.next.2
  %58 = bitcast double* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv.next.2
  %61 = bitcast double* %60 to i64*
  store i64 %59, i64* %61, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv76, i64 %indvars.iv.next.3
  %63 = bitcast double* %62 to i64*
  %64 = load i64, i64* %63, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv.next.3
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %67, label %41

; <label>:67:                                     ; preds = %41
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next77, 2000
  br i1 %exitcond78, label %68, label %.preheader

; <label>:68:                                     ; preds = %67
  tail call void @free(i8* nonnull %20) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader35

.preheader35:                                     ; preds = %._crit_edge42, %1
  %indvars.iv70 = phi i64 [ 0, %1 ], [ %indvars.iv.next71, %._crit_edge42 ]
  %2 = icmp sgt i64 %indvars.iv70, 0
  br i1 %2, label %.preheader33.preheader, label %._crit_edge42

.preheader33.preheader:                           ; preds = %.preheader35
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 0
  br label %.preheader33

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %4 = icmp sgt i64 %indvars.iv70, 0
  br i1 %4, label %.preheader.us.preheader, label %._crit_edge42

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter75 = and i64 %indvars.iv70, 1
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 0
  %6 = icmp eq i64 %xtraiter75, 0
  %7 = icmp eq i64 %indvars.iv70, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge40.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge40.us ], [ %indvars.iv70, %.preheader.us.preheader ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 %indvars.iv67
  %.pre49 = load double, double* %8, align 8
  br i1 %6, label %.prol.loopexit74, label %9

; <label>:9:                                      ; preds = %.preheader.us
  %10 = load double, double* %5, align 8
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv67
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fsub double %.pre49, %13
  store double %14, double* %8, align 8
  br label %.prol.loopexit74

.prol.loopexit74:                                 ; preds = %.preheader.us, %9
  %indvars.iv60.unr.ph = phi i64 [ 1, %9 ], [ 0, %.preheader.us ]
  %.unr77.ph = phi double [ %14, %9 ], [ %.pre49, %.preheader.us ]
  br i1 %7, label %._crit_edge40.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit74
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.1, %.preheader.us.new ], [ %indvars.iv60.unr.ph, %.preheader.us.new.preheader ]
  %15 = phi double [ %27, %.preheader.us.new ], [ %.unr77.ph, %.preheader.us.new.preheader ]
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 %indvars.iv60
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv60, i64 %indvars.iv67
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fsub double %15, %20
  store double %21, double* %8, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 %indvars.iv.next61
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next61, i64 %indvars.iv67
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fsub double %21, %26
  store double %27, double* %8, align 8
  %indvars.iv.next61.1 = add nuw nsw i64 %indvars.iv60, 2
  %exitcond64.1 = icmp eq i64 %indvars.iv.next61.1, %indvars.iv70
  br i1 %exitcond64.1, label %._crit_edge40.us.loopexit, label %.preheader.us.new

._crit_edge40.us.loopexit:                        ; preds = %.preheader.us.new
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge40.us.loopexit, %.prol.loopexit74
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 2000
  br i1 %exitcond69, label %._crit_edge42.loopexit, label %.preheader.us

.preheader33:                                     ; preds = %.preheader33.preheader, %._crit_edge
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge ], [ 0, %.preheader33.preheader ]
  %28 = icmp sgt i64 %indvars.iv53, 0
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 %indvars.iv53
  %.pre = load double, double* %29, align 8
  br i1 %28, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader33
  %xtraiter = and i64 %indvars.iv53, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %30

; <label>:30:                                     ; preds = %.lr.ph
  %31 = load double, double* %3, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv53
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %.pre, %34
  store double %35, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %30
  %indvars.iv.unr.ph = phi i64 [ 1, %30 ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %35, %30 ], [ %.pre, %.lr.ph ]
  %.lcssa.unr.ph = phi double [ %35, %30 ], [ undef, %.lr.ph ]
  %36 = icmp eq i64 %indvars.iv53, 1
  br i1 %36, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %37 = phi double [ %49, %.lr.ph.new ], [ %.unr.ph, %.lr.ph.new.preheader ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv53
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fsub double %37, %42
  store double %43, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv70, i64 %indvars.iv.next
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv53
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fsub double %43, %48
  store double %49, double* %29, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv53
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader33, %.prol.loopexit
  %50 = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %.pre, %.preheader33 ], [ %49, %._crit_edge.loopexit ]
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv53, i64 %indvars.iv53
  %52 = load double, double* %51, align 8
  %53 = fdiv double %50, %52
  store double %53, double* %29, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next54, %indvars.iv70
  br i1 %exitcond58, label %.preheader.lr.ph, label %.preheader33

._crit_edge42.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader35, %.preheader.lr.ph
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next71, 2000
  br i1 %exitcond72, label %54, label %.preheader35

; <label>:54:                                     ; preds = %._crit_edge42
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %19, %1
  %indvars.iv11 = phi i64 [ 0, %1 ], [ %indvars.iv.next12, %19 ]
  %6 = mul nuw nsw i64 %indvars.iv11, 2000
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv11, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %19, label %7

; <label>:19:                                     ; preds = %14
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond13, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
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

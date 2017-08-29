; ModuleID = 'A.ll'
source_filename = "doitgen.c"
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

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]*, double* nocapture) local_unnamed_addr #0 {
  %7 = sext i32 %1 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.lr.ph, label %.._crit_edge49_crit_edge

.._crit_edge49_crit_edge:                         ; preds = %6
  br label %._crit_edge49

._crit_edge.lr.ph:                                ; preds = %6
  %9 = icmp sgt i32 %1, 0
  %10 = icmp sgt i32 %2, 0
  %11 = sext i32 %2 to i64
  %12 = add nsw i64 %11, -1
  %xtraiter61 = and i64 %11, 1
  %lcmp.mod62 = icmp eq i64 %xtraiter61, 0
  %13 = icmp eq i64 %12, 0
  %xtraiter67 = and i64 %11, 3
  %lcmp.mod68 = icmp eq i64 %xtraiter67, 0
  %14 = icmp ult i64 %12, 3
  %15 = add nsw i64 %7, -1
  %16 = zext i32 %0 to i64
  %xtraiter = and i64 %7, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %17 = icmp ult i64 %15, 7
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge35.._crit_edge_crit_edge, %._crit_edge.lr.ph
  %indvars.iv = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next, %._crit_edge35.._crit_edge_crit_edge ]
  br i1 %9, label %._crit_edge16.lr.ph, label %._crit_edge.._crit_edge35_crit_edge

._crit_edge.._crit_edge35_crit_edge:              ; preds = %._crit_edge
  br label %._crit_edge35

._crit_edge16.lr.ph:                              ; preds = %._crit_edge
  br i1 %10, label %._crit_edge16.us.preheader, label %._crit_edge16.preheader

._crit_edge16.preheader:                          ; preds = %._crit_edge16.lr.ph
  br i1 %lcmp.mod, label %._crit_edge16.preheader.._crit_edge16.prol.loopexit_crit_edge, label %._crit_edge16.prol.preheader

._crit_edge16.preheader.._crit_edge16.prol.loopexit_crit_edge: ; preds = %._crit_edge16.preheader
  br label %._crit_edge16.prol.loopexit

._crit_edge16.prol.preheader:                     ; preds = %._crit_edge16.preheader
  br label %._crit_edge16.prol

._crit_edge16.prol:                               ; preds = %._crit_edge16.prol.._crit_edge16.prol_crit_edge, %._crit_edge16.prol.preheader
  %indvars.iv1431.prol = phi i64 [ %indvars.iv.next15.prol, %._crit_edge16.prol.._crit_edge16.prol_crit_edge ], [ 0, %._crit_edge16.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge16.prol.._crit_edge16.prol_crit_edge ], [ %xtraiter, %._crit_edge16.prol.preheader ]
  %indvars.iv.next15.prol = add nuw nsw i64 %indvars.iv1431.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge16.prol.loopexit.unr-lcssa, label %._crit_edge16.prol.._crit_edge16.prol_crit_edge, !llvm.loop !1

._crit_edge16.prol.._crit_edge16.prol_crit_edge:  ; preds = %._crit_edge16.prol
  br label %._crit_edge16.prol

._crit_edge16.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge16.prol
  br label %._crit_edge16.prol.loopexit

._crit_edge16.prol.loopexit:                      ; preds = %._crit_edge16.preheader.._crit_edge16.prol.loopexit_crit_edge, %._crit_edge16.prol.loopexit.unr-lcssa
  %indvars.iv1431.unr = phi i64 [ 0, %._crit_edge16.preheader.._crit_edge16.prol.loopexit_crit_edge ], [ %indvars.iv.next15.prol, %._crit_edge16.prol.loopexit.unr-lcssa ]
  br i1 %17, label %._crit_edge16.prol.loopexit.._crit_edge35.loopexit72_crit_edge, label %._crit_edge16.preheader.new

._crit_edge16.prol.loopexit.._crit_edge35.loopexit72_crit_edge: ; preds = %._crit_edge16.prol.loopexit
  br label %._crit_edge35.loopexit72

._crit_edge16.preheader.new:                      ; preds = %._crit_edge16.prol.loopexit
  br label %._crit_edge16

._crit_edge16.us.preheader:                       ; preds = %._crit_edge16.lr.ph
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge30.us.._crit_edge16.us_crit_edge, %._crit_edge16.us.preheader
  %indvars.iv1431.us = phi i64 [ %indvars.iv.next15.us, %._crit_edge30.us.._crit_edge16.us_crit_edge ], [ 0, %._crit_edge16.us.preheader ]
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv1431.us, i64 0
  br label %.lr.ph.us.us

._crit_edge30.us.loopexit:                        ; preds = %.lr.ph29.us.new
  br label %._crit_edge30.us

._crit_edge30.us:                                 ; preds = %.prol.loopexit66.._crit_edge30.us_crit_edge, %._crit_edge30.us.loopexit
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1431.us, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next15.us, %7
  br i1 %exitcond57, label %._crit_edge35.loopexit, label %._crit_edge30.us.._crit_edge16.us_crit_edge

._crit_edge30.us.._crit_edge16.us_crit_edge:      ; preds = %._crit_edge30.us
  br label %._crit_edge16.us

.lr.ph29.us.new:                                  ; preds = %.lr.ph29.us.new..lr.ph29.us.new_crit_edge, %.lr.ph29.us.new.preheader
  %indvars.iv1227.us = phi i64 [ %indvars.iv.next13.us.3, %.lr.ph29.us.new..lr.ph29.us.new_crit_edge ], [ %indvars.iv1227.us.unr, %.lr.ph29.us.new.preheader ]
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv1227.us
  %20 = bitcast double* %19 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv1431.us, i64 %indvars.iv1227.us
  %23 = bitcast double* %22 to i64*
  store i64 %21, i64* %23, align 8
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1227.us, 1
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next13.us
  %25 = bitcast double* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv1431.us, i64 %indvars.iv.next13.us
  %28 = bitcast double* %27 to i64*
  store i64 %26, i64* %28, align 8
  %indvars.iv.next13.us.1 = add nsw i64 %indvars.iv1227.us, 2
  %29 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next13.us.1
  %30 = bitcast double* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv1431.us, i64 %indvars.iv.next13.us.1
  %33 = bitcast double* %32 to i64*
  store i64 %31, i64* %33, align 8
  %indvars.iv.next13.us.2 = add nsw i64 %indvars.iv1227.us, 3
  %34 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next13.us.2
  %35 = bitcast double* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv1431.us, i64 %indvars.iv.next13.us.2
  %38 = bitcast double* %37 to i64*
  store i64 %36, i64* %38, align 8
  %indvars.iv.next13.us.3 = add nuw nsw i64 %indvars.iv1227.us, 4
  %exitcond56.3 = icmp eq i64 %indvars.iv.next13.us.3, %11
  br i1 %exitcond56.3, label %._crit_edge30.us.loopexit, label %.lr.ph29.us.new..lr.ph29.us.new_crit_edge

.lr.ph29.us.new..lr.ph29.us.new_crit_edge:        ; preds = %.lr.ph29.us.new
  br label %.lr.ph29.us.new

.lr.ph.us.us:                                     ; preds = %._crit_edge21.us.us..lr.ph.us.us_crit_edge, %._crit_edge16.us
  %indvars.iv1022.us.us = phi i64 [ %indvars.iv.next11.us.us, %._crit_edge21.us.us..lr.ph.us.us_crit_edge ], [ 0, %._crit_edge16.us ]
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv1022.us.us
  store double 0.000000e+00, double* %39, align 8
  br i1 %lcmp.mod62, label %.lr.ph.us.us..prol.loopexit60_crit_edge, label %.prol.preheader59

.lr.ph.us.us..prol.loopexit60_crit_edge:          ; preds = %.lr.ph.us.us
  br label %.prol.loopexit60

.prol.preheader59:                                ; preds = %.lr.ph.us.us
  %40 = load double, double* %18, align 8
  %41 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv1022.us.us
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %43, 0.000000e+00
  store double %44, double* %39, align 8
  br label %.prol.loopexit60

.prol.loopexit60:                                 ; preds = %.lr.ph.us.us..prol.loopexit60_crit_edge, %.prol.preheader59
  %.unr.ph = phi double [ %44, %.prol.preheader59 ], [ 0.000000e+00, %.lr.ph.us.us..prol.loopexit60_crit_edge ]
  %indvars.iv19.us.us.unr.ph = phi i64 [ 1, %.prol.preheader59 ], [ 0, %.lr.ph.us.us..prol.loopexit60_crit_edge ]
  br i1 %13, label %.prol.loopexit60.._crit_edge21.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit60.._crit_edge21.us.us_crit_edge:   ; preds = %.prol.loopexit60
  br label %._crit_edge21.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit60
  br label %.lr.ph.us.us.new

._crit_edge21.us.us.loopexit:                     ; preds = %.lr.ph.us.us.new
  br label %._crit_edge21.us.us

._crit_edge21.us.us:                              ; preds = %.prol.loopexit60.._crit_edge21.us.us_crit_edge, %._crit_edge21.us.us.loopexit
  %indvars.iv.next11.us.us = add nuw nsw i64 %indvars.iv1022.us.us, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next11.us.us, %11
  br i1 %exitcond55, label %.lr.ph29.us, label %._crit_edge21.us.us..lr.ph.us.us_crit_edge

._crit_edge21.us.us..lr.ph.us.us_crit_edge:       ; preds = %._crit_edge21.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %45 = phi double [ %57, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %indvars.iv19.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv19.us.us.unr.ph, %.lr.ph.us.us.new.preheader ]
  %46 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv1431.us, i64 %indvars.iv19.us.us
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv19.us.us, i64 %indvars.iv1022.us.us
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %45, %50
  store double %51, double* %39, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv19.us.us, 1
  %52 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv1431.us, i64 %indvars.iv.next.us.us
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next.us.us, i64 %indvars.iv1022.us.us
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %51, %56
  store double %57, double* %39, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv19.us.us, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next.us.us.1, %11
  br i1 %exitcond54.1, label %._crit_edge21.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.lr.ph29.us:                                      ; preds = %._crit_edge21.us.us
  br i1 %lcmp.mod68, label %.lr.ph29.us..prol.loopexit66_crit_edge, label %.prol.preheader65.preheader

.lr.ph29.us..prol.loopexit66_crit_edge:           ; preds = %.lr.ph29.us
  br label %.prol.loopexit66

.prol.preheader65.preheader:                      ; preds = %.lr.ph29.us
  br label %.prol.preheader65

.prol.preheader65:                                ; preds = %.prol.preheader65..prol.preheader65_crit_edge, %.prol.preheader65.preheader
  %indvars.iv1227.us.prol = phi i64 [ %indvars.iv.next13.us.prol, %.prol.preheader65..prol.preheader65_crit_edge ], [ 0, %.prol.preheader65.preheader ]
  %prol.iter69 = phi i64 [ %prol.iter69.sub, %.prol.preheader65..prol.preheader65_crit_edge ], [ %xtraiter67, %.prol.preheader65.preheader ]
  %58 = getelementptr inbounds double, double* %5, i64 %indvars.iv1227.us.prol
  %59 = bitcast double* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv, i64 %indvars.iv1431.us, i64 %indvars.iv1227.us.prol
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next13.us.prol = add nuw nsw i64 %indvars.iv1227.us.prol, 1
  %prol.iter69.sub = add nsw i64 %prol.iter69, -1
  %prol.iter69.cmp = icmp eq i64 %prol.iter69.sub, 0
  br i1 %prol.iter69.cmp, label %.prol.loopexit66.loopexit, label %.prol.preheader65..prol.preheader65_crit_edge, !llvm.loop !3

.prol.preheader65..prol.preheader65_crit_edge:    ; preds = %.prol.preheader65
  br label %.prol.preheader65

.prol.loopexit66.loopexit:                        ; preds = %.prol.preheader65
  br label %.prol.loopexit66

.prol.loopexit66:                                 ; preds = %.lr.ph29.us..prol.loopexit66_crit_edge, %.prol.loopexit66.loopexit
  %indvars.iv1227.us.unr = phi i64 [ 0, %.lr.ph29.us..prol.loopexit66_crit_edge ], [ %xtraiter67, %.prol.loopexit66.loopexit ]
  br i1 %14, label %.prol.loopexit66.._crit_edge30.us_crit_edge, label %.lr.ph29.us.new.preheader

.prol.loopexit66.._crit_edge30.us_crit_edge:      ; preds = %.prol.loopexit66
  br label %._crit_edge30.us

.lr.ph29.us.new.preheader:                        ; preds = %.prol.loopexit66
  br label %.lr.ph29.us.new

._crit_edge16:                                    ; preds = %._crit_edge16.._crit_edge16_crit_edge, %._crit_edge16.preheader.new
  %indvars.iv1431 = phi i64 [ %indvars.iv1431.unr, %._crit_edge16.preheader.new ], [ %indvars.iv.next15.7, %._crit_edge16.._crit_edge16_crit_edge ]
  %indvars.iv.next15.7 = add nsw i64 %indvars.iv1431, 8
  %exitcond52.7 = icmp eq i64 %indvars.iv.next15.7, %7
  br i1 %exitcond52.7, label %._crit_edge35.loopexit72.unr-lcssa, label %._crit_edge16.._crit_edge16_crit_edge

._crit_edge16.._crit_edge16_crit_edge:            ; preds = %._crit_edge16
  br label %._crit_edge16

._crit_edge35.loopexit:                           ; preds = %._crit_edge30.us
  br label %._crit_edge35

._crit_edge35.loopexit72.unr-lcssa:               ; preds = %._crit_edge16
  br label %._crit_edge35.loopexit72

._crit_edge35.loopexit72:                         ; preds = %._crit_edge16.prol.loopexit.._crit_edge35.loopexit72_crit_edge, %._crit_edge35.loopexit72.unr-lcssa
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge.._crit_edge35_crit_edge, %._crit_edge35.loopexit72, %._crit_edge35.loopexit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next, %16
  br i1 %exitcond73, label %._crit_edge49.loopexit, label %._crit_edge35.._crit_edge_crit_edge

._crit_edge35.._crit_edge_crit_edge:              ; preds = %._crit_edge35
  br label %._crit_edge

._crit_edge49.loopexit:                           ; preds = %._crit_edge35
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %.._crit_edge49_crit_edge, %._crit_edge49.loopexit
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array([140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
._crit_edge.us.preheader:
  br label %._crit_edge9.us.us.preheader

._crit_edge9.us.us.preheader:                     ; preds = %._crit_edge22.us.._crit_edge9.us.us.preheader_crit_edge, %._crit_edge.us.preheader
  %indvars.iv723.us = phi i64 [ %indvars.iv.next8.us, %._crit_edge22.us.._crit_edge9.us.us.preheader_crit_edge ], [ 0, %._crit_edge.us.preheader ]
  br label %._crit_edge9.us.us.new

._crit_edge22.us:                                 ; preds = %._crit_edge19.us.us
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv723.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next8.us, 150
  br i1 %exitcond44, label %._crit_edge10.new.preheader, label %._crit_edge22.us.._crit_edge9.us.us.preheader_crit_edge

._crit_edge22.us.._crit_edge9.us.us.preheader_crit_edge: ; preds = %._crit_edge22.us
  br label %._crit_edge9.us.us.preheader

._crit_edge10.new.preheader:                      ; preds = %._crit_edge22.us
  br label %._crit_edge10.new

._crit_edge9.us.us.new:                           ; preds = %._crit_edge19.us.us.._crit_edge9.us.us.new_crit_edge, %._crit_edge9.us.us.preheader
  %indvars.iv520.us.us = phi i64 [ %indvars.iv.next6.us.us, %._crit_edge19.us.us.._crit_edge9.us.us.new_crit_edge ], [ 0, %._crit_edge9.us.us.preheader ]
  %2 = mul nuw nsw i64 %indvars.iv520.us.us, %indvars.iv723.us
  br label %3

._crit_edge19.us.us:                              ; preds = %3
  %indvars.iv.next6.us.us = add nuw nsw i64 %indvars.iv520.us.us, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next6.us.us, 140
  br i1 %exitcond43, label %._crit_edge22.us, label %._crit_edge19.us.us.._crit_edge9.us.us.new_crit_edge

._crit_edge19.us.us.._crit_edge9.us.us.new_crit_edge: ; preds = %._crit_edge19.us.us
  br label %._crit_edge9.us.us.new

; <label>:3:                                      ; preds = %._crit_edge, %._crit_edge9.us.us.new
  %indvars.iv317.us.us = phi i64 [ 0, %._crit_edge9.us.us.new ], [ %indvars.iv.next4.us.us.1, %._crit_edge ]
  %4 = add nuw nsw i64 %indvars.iv317.us.us, %2
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv723.us, i64 %indvars.iv520.us.us, i64 %indvars.iv317.us.us
  %indvars.iv.next4.us.us = or i64 %indvars.iv317.us.us, 1
  %9 = add nuw nsw i64 %indvars.iv.next4.us.us, %2
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next4.us.us.1 = add nuw nsw i64 %indvars.iv317.us.us, 2
  %exitcond42.1 = icmp eq i64 %indvars.iv.next4.us.us.1, 160
  br i1 %exitcond42.1, label %._crit_edge19.us.us, label %._crit_edge

._crit_edge:                                      ; preds = %3
  br label %3

._crit_edge10.new:                                ; preds = %._crit_edge13.._crit_edge10.new_crit_edge, %._crit_edge10.new.preheader
  %indvars.iv114 = phi i64 [ %indvars.iv.next2, %._crit_edge13.._crit_edge10.new_crit_edge ], [ 0, %._crit_edge10.new.preheader ]
  br label %17

; <label>:17:                                     ; preds = %._crit_edge1, %._crit_edge10.new
  %indvars.iv12 = phi i64 [ 0, %._crit_edge10.new ], [ %indvars.iv.next.1, %._crit_edge1 ]
  %18 = mul nuw nsw i64 %indvars.iv12, %indvars.iv114
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv114, i64 %indvars.iv12
  %indvars.iv.next = or i64 %indvars.iv12, 1
  %23 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv114
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 160
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 1.600000e+02, double 1.600000e+02>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv12, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge13, label %._crit_edge1

._crit_edge1:                                     ; preds = %17
  br label %17

._crit_edge13:                                    ; preds = %17
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next2, 160
  br i1 %exitcond40, label %._crit_edge16, label %._crit_edge13.._crit_edge10.new_crit_edge

._crit_edge13.._crit_edge10.new_crit_edge:        ; preds = %._crit_edge13
  br label %._crit_edge10.new

._crit_edge16:                                    ; preds = %._crit_edge13
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
._crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge5.us.us.preheader

._crit_edge5.us.us.preheader:                     ; preds = %._crit_edge11.us.._crit_edge5.us.us.preheader_crit_edge, %._crit_edge.us.preheader
  %indvars.iv312.us = phi i64 [ %indvars.iv.next4.us, %._crit_edge11.us.._crit_edge5.us.us.preheader_crit_edge ], [ 0, %._crit_edge.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv312.us, 22400
  br label %._crit_edge5.us.us

._crit_edge11.us:                                 ; preds = %._crit_edge8.us.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv312.us, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next4.us, 150
  br i1 %exitcond32, label %._crit_edge15, label %._crit_edge11.us.._crit_edge5.us.us.preheader_crit_edge

._crit_edge11.us.._crit_edge5.us.us.preheader_crit_edge: ; preds = %._crit_edge11.us
  br label %._crit_edge5.us.us.preheader

._crit_edge5.us.us:                               ; preds = %._crit_edge8.us.us.._crit_edge5.us.us_crit_edge, %._crit_edge5.us.us.preheader
  %indvars.iv19.us.us = phi i64 [ %indvars.iv.next2.us.us, %._crit_edge8.us.us.._crit_edge5.us.us_crit_edge ], [ 0, %._crit_edge5.us.us.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv19.us.us, 160
  %7 = add nuw nsw i64 %6, %5
  br label %8

._crit_edge8.us.us:                               ; preds = %._crit_edge6.us.us
  %indvars.iv.next2.us.us = add nuw nsw i64 %indvars.iv19.us.us, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next2.us.us, 140
  br i1 %exitcond31, label %._crit_edge11.us, label %._crit_edge8.us.us.._crit_edge5.us.us_crit_edge

._crit_edge8.us.us.._crit_edge5.us.us_crit_edge:  ; preds = %._crit_edge8.us.us
  br label %._crit_edge5.us.us

; <label>:8:                                      ; preds = %._crit_edge6.us.us._crit_edge, %._crit_edge5.us.us
  %indvars.iv7.us.us = phi i64 [ 0, %._crit_edge5.us.us ], [ %indvars.iv.next.us.us, %._crit_edge6.us.us._crit_edge ]
  %9 = add nuw nsw i64 %7, %indvars.iv7.us.us
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.._crit_edge6.us.us_crit_edge

.._crit_edge6.us.us_crit_edge:                    ; preds = %8
  br label %._crit_edge6.us.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge6.us.us

._crit_edge6.us.us:                               ; preds = %.._crit_edge6.us.us_crit_edge, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv312.us, i64 %indvars.iv19.us.us, i64 %indvars.iv7.us.us
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv7.us.us, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next.us.us, 160
  br i1 %exitcond30, label %._crit_edge8.us.us, label %._crit_edge6.us.us._crit_edge

._crit_edge6.us.us._crit_edge:                    ; preds = %._crit_edge6.us.us
  br label %8

._crit_edge15:                                    ; preds = %._crit_edge11.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}

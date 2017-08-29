; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) #0 {
  %7 = bitcast double* %5 to i8*
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader35.preheader.lr.ph, label %._crit_edge69

.preheader35.preheader.lr.ph:                     ; preds = %6
  %12 = icmp sgt i32 %1, 0
  %13 = icmp sgt i32 %2, 0
  %wide.trip.count = zext i32 %2 to i64
  %exitcond44 = icmp eq i32 %2, 0
  %14 = add nsw i64 %8, -1
  %15 = shl nsw i64 %8, 3
  %xtraiter79 = and i64 %8, 3
  %lcmp.mod80 = icmp eq i64 %xtraiter79, 0
  %16 = icmp ult i64 %14, 3
  %xtraiter73 = and i64 %wide.trip.count, 1
  %lcmp.mod74 = icmp eq i64 %xtraiter73, 0
  %17 = icmp eq i32 %2, 1
  %18 = add nsw i64 %9, -1
  %xtraiter = and i64 %9, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %19 = icmp ult i64 %18, 7
  br label %.preheader35.preheader

.preheader35.preheader:                           ; preds = %.preheader35._crit_edge, %.preheader35.preheader.lr.ph
  %indvars.iv4266 = phi i64 [ 0, %.preheader35.preheader.lr.ph ], [ %indvars.iv.next43, %.preheader35._crit_edge ]
  br i1 %12, label %.preheader34.preheader.lr.ph, label %.preheader35._crit_edge

.preheader34.preheader.lr.ph:                     ; preds = %.preheader35.preheader
  br i1 %13, label %.preheader34.preheader.us.preheader, label %.preheader34.preheader.preheader

.preheader34.preheader.preheader:                 ; preds = %.preheader34.preheader.lr.ph
  br i1 %lcmp.mod, label %.preheader34.preheader.prol.loopexit, label %.preheader34.preheader.prol.preheader

.preheader34.preheader.prol.preheader:            ; preds = %.preheader34.preheader.preheader
  br label %.preheader34.preheader.prol

.preheader34.preheader.prol:                      ; preds = %.preheader34.preheader.prol, %.preheader34.preheader.prol.preheader
  %indvars.iv4051.prol = phi i64 [ %indvars.iv.next41.prol, %.preheader34.preheader.prol ], [ 0, %.preheader34.preheader.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader34.preheader.prol ], [ %xtraiter, %.preheader34.preheader.prol.preheader ]
  %indvars.iv.next41.prol = add nuw nsw i64 %indvars.iv4051.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader34.preheader.prol.loopexit.unr-lcssa, label %.preheader34.preheader.prol, !llvm.loop !1

.preheader34.preheader.prol.loopexit.unr-lcssa:   ; preds = %.preheader34.preheader.prol
  br label %.preheader34.preheader.prol.loopexit

.preheader34.preheader.prol.loopexit:             ; preds = %.preheader34.preheader.preheader, %.preheader34.preheader.prol.loopexit.unr-lcssa
  %indvars.iv4051.unr = phi i64 [ 0, %.preheader34.preheader.preheader ], [ %indvars.iv.next41.prol, %.preheader34.preheader.prol.loopexit.unr-lcssa ]
  br i1 %19, label %.preheader35._crit_edge.loopexit93, label %.preheader34.preheader.preheader.new

.preheader34.preheader.preheader.new:             ; preds = %.preheader34.preheader.prol.loopexit
  br label %.preheader34.preheader

.preheader34.preheader.us.preheader:              ; preds = %.preheader34.preheader.lr.ph
  br label %.preheader34.preheader.us

.preheader34.preheader.us:                        ; preds = %.preheader34.preheader.us.preheader, %.preheader35.us
  %indvars.iv4051.us = phi i64 [ %indvars.iv.next41.us, %.preheader35.us ], [ 0, %.preheader34.preheader.us.preheader ]
  br i1 %exitcond44, label %.preheader34..preheader.preheader_crit_edge.us.loopexit, label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.preheader34.preheader.us
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv4266, i64 %indvars.iv4051.us, i64 0
  br label %.lr.ph.us.us

.preheader35.us.loopexit:                         ; preds = %.preheader.us
  br label %.preheader35.us

.preheader35.us:                                  ; preds = %.preheader35.us.loopexit, %.preheader.us.prol.loopexit
  %indvars.iv.next41.us = add nuw nsw i64 %indvars.iv4051.us, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next41.us, %9
  br i1 %exitcond82, label %.preheader35._crit_edge.loopexit, label %.preheader34.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader92, %.preheader.us
  %indvars.iv3849.us = phi i64 [ %indvars.iv.next39.us.3, %.preheader.us ], [ %indvars.iv3849.us.unr, %.preheader.us.preheader92 ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv3849.us
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv4266, i64 %indvars.iv4051.us, i64 %indvars.iv3849.us
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next39.us = add nuw nsw i64 %indvars.iv3849.us, 1
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next39.us
  %27 = bitcast double* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv4266, i64 %indvars.iv4051.us, i64 %indvars.iv.next39.us
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next39.us.1 = add nsw i64 %indvars.iv3849.us, 2
  %31 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next39.us.1
  %32 = bitcast double* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv4266, i64 %indvars.iv4051.us, i64 %indvars.iv.next39.us.1
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next39.us.2 = add nsw i64 %indvars.iv3849.us, 3
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next39.us.2
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv4266, i64 %indvars.iv4051.us, i64 %indvars.iv.next39.us.2
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next39.us.3 = add nsw i64 %indvars.iv3849.us, 4
  %exitcond77.3 = icmp eq i64 %indvars.iv.next39.us.3, %8
  br i1 %exitcond77.3, label %.preheader35.us.loopexit, label %.preheader.us

.preheader34..preheader.preheader_crit_edge.us.loopexit: ; preds = %.preheader34.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %15, i32 8, i1 false)
  br label %.preheader.us.preheader

.preheader.us.preheader.loopexit:                 ; preds = %._crit_edge.us.us
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %.preheader34..preheader.preheader_crit_edge.us.loopexit
  br i1 %lcmp.mod80, label %.preheader.us.prol.loopexit, label %.preheader.us.prol.preheader

.preheader.us.prol.preheader:                     ; preds = %.preheader.us.preheader
  br label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.prol.preheader, %.preheader.us.prol
  %indvars.iv3849.us.prol = phi i64 [ %indvars.iv.next39.us.prol, %.preheader.us.prol ], [ 0, %.preheader.us.prol.preheader ]
  %prol.iter81 = phi i64 [ %prol.iter81.sub, %.preheader.us.prol ], [ %xtraiter79, %.preheader.us.prol.preheader ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv3849.us.prol
  %42 = bitcast double* %41 to i64*
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv4266, i64 %indvars.iv4051.us, i64 %indvars.iv3849.us.prol
  %45 = bitcast double* %44 to i64*
  store i64 %43, i64* %45, align 8
  %indvars.iv.next39.us.prol = add nuw nsw i64 %indvars.iv3849.us.prol, 1
  %prol.iter81.sub = add i64 %prol.iter81, -1
  %prol.iter81.cmp = icmp eq i64 %prol.iter81.sub, 0
  br i1 %prol.iter81.cmp, label %.preheader.us.prol.loopexit.loopexit, label %.preheader.us.prol, !llvm.loop !3

.preheader.us.prol.loopexit.loopexit:             ; preds = %.preheader.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv3849.us.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next39.us.prol, %.preheader.us.prol.loopexit.loopexit ]
  br i1 %16, label %.preheader35.us, label %.preheader.us.preheader92

.preheader.us.preheader92:                        ; preds = %.preheader.us.prol.loopexit
  br label %.preheader.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv3646.us.us = phi i64 [ %indvars.iv.next37.us.us, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %46 = getelementptr inbounds double, double* %5, i64 %indvars.iv3646.us.us
  store double 0.000000e+00, double* %46, align 8
  br i1 %lcmp.mod74, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %47 = load double, double* %20, align 8
  %48 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv3646.us.us
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %50, 0.000000e+00
  store double %51, double* %46, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %52 = phi double [ %51, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv45.us.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %17, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next37.us.us = add nuw nsw i64 %indvars.iv3646.us.us, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next37.us.us, %8
  br i1 %exitcond75, label %.preheader.us.preheader.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %53 = phi double [ %65, %.lr.ph.us.us.new ], [ %52, %.lr.ph.us.us.new.preheader ]
  %indvars.iv45.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.lr.ph.us.us.new ], [ %indvars.iv45.us.us.unr.ph, %.lr.ph.us.us.new.preheader ]
  %54 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv4266, i64 %indvars.iv4051.us, i64 %indvars.iv45.us.us
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv45.us.us, i64 %indvars.iv3646.us.us
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  store double %59, double* %46, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv45.us.us, 1
  %60 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv4266, i64 %indvars.iv4051.us, i64 %indvars.iv.next.us.us
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next.us.us, i64 %indvars.iv3646.us.us
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  store double %65, double* %46, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv45.us.us, 2
  %exitcond.us.us.1 = icmp eq i64 %indvars.iv.next.us.us.1, %wide.trip.count
  br i1 %exitcond.us.us.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.preheader34.preheader:                           ; preds = %.preheader34.preheader, %.preheader34.preheader.preheader.new
  %indvars.iv4051 = phi i64 [ %indvars.iv4051.unr, %.preheader34.preheader.preheader.new ], [ %indvars.iv.next41.7, %.preheader34.preheader ]
  %indvars.iv.next41.7 = add nsw i64 %indvars.iv4051, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next41.7, %9
  br i1 %exitcond.7, label %.preheader35._crit_edge.loopexit93.unr-lcssa, label %.preheader34.preheader

.preheader35._crit_edge.loopexit:                 ; preds = %.preheader35.us
  br label %.preheader35._crit_edge

.preheader35._crit_edge.loopexit93.unr-lcssa:     ; preds = %.preheader34.preheader
  br label %.preheader35._crit_edge.loopexit93

.preheader35._crit_edge.loopexit93:               ; preds = %.preheader34.preheader.prol.loopexit, %.preheader35._crit_edge.loopexit93.unr-lcssa
  br label %.preheader35._crit_edge

.preheader35._crit_edge:                          ; preds = %.preheader35._crit_edge.loopexit93, %.preheader35._crit_edge.loopexit, %.preheader35.preheader
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv4266, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next43, %10
  br i1 %exitcond83, label %._crit_edge69.loopexit, label %.preheader35.preheader

._crit_edge69.loopexit:                           ; preds = %.preheader35._crit_edge
  br label %._crit_edge69

._crit_edge69:                                    ; preds = %._crit_edge69.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #5
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #5
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #5
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #5
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #5
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) #0 {
  br i1 true, label %.preheader35.preheader.lr.ph, label %.preheader33

.preheader35.preheader.lr.ph:                     ; preds = %5
  br i1 true, label %.preheader35.preheader.us.preheader, label %.preheader33

.preheader35.preheader.us.preheader:              ; preds = %.preheader35.preheader.lr.ph
  br label %.preheader35.preheader.us

.preheader35.preheader.us:                        ; preds = %.preheader35.preheader.us.preheader, %.preheader35._crit_edge.us
  %indvars.iv4252.us = phi i64 [ %indvars.iv.next43.us, %.preheader35._crit_edge.us ], [ 0, %.preheader35.preheader.us.preheader ]
  br i1 true, label %.preheader34.preheader.us.us.preheader, label %.preheader35._crit_edge.us

.preheader34.preheader.us.us.preheader:           ; preds = %.preheader35.preheader.us
  br label %.preheader34.preheader.us.us

.preheader35._crit_edge.us.loopexit:              ; preds = %.preheader34._crit_edge.us.us
  br label %.preheader35._crit_edge.us

.preheader35._crit_edge.us:                       ; preds = %.preheader35._crit_edge.us.loopexit, %.preheader35.preheader.us
  %indvars.iv.next43.us = add nuw nsw i64 %indvars.iv4252.us, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next43.us, 150
  br i1 %exitcond75, label %.preheader33.loopexit, label %.preheader35.preheader.us

.preheader34.preheader.us.us:                     ; preds = %.preheader34.preheader.us.us.preheader, %.preheader34._crit_edge.us.us
  %indvars.iv4050.us.us = phi i64 [ %indvars.iv.next41.us.us, %.preheader34._crit_edge.us.us ], [ 0, %.preheader34.preheader.us.us.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv4050.us.us, %indvars.iv4252.us
  br i1 true, label %.preheader34.us.us.prol.loopexit, label %.preheader34.us.us.prol

.preheader34.us.us.prol:                          ; preds = %.preheader34.preheader.us.us
  br label %.preheader34.us.us.prol.loopexit

.preheader34.us.us.prol.loopexit:                 ; preds = %.preheader34.us.us.prol, %.preheader34.preheader.us.us
  %indvars.iv3848.us.us.unr.ph = phi i64 [ 1, %.preheader34.us.us.prol ], [ 0, %.preheader34.preheader.us.us ]
  br i1 false, label %.preheader34._crit_edge.us.us, label %.preheader34.us.us.preheader

.preheader34.us.us.preheader:                     ; preds = %.preheader34.us.us.prol.loopexit
  br label %.preheader34.us.us

.preheader34._crit_edge.us.us.loopexit:           ; preds = %.preheader34.us.us
  br label %.preheader34._crit_edge.us.us

.preheader34._crit_edge.us.us:                    ; preds = %.preheader34._crit_edge.us.us.loopexit, %.preheader34.us.us.prol.loopexit
  %indvars.iv.next41.us.us = add nuw nsw i64 %indvars.iv4050.us.us, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next41.us.us, 140
  br i1 %exitcond74, label %.preheader35._crit_edge.us.loopexit, label %.preheader34.preheader.us.us

.preheader34.us.us:                               ; preds = %.preheader34.us.us.preheader, %.preheader34.us.us
  %indvars.iv3848.us.us = phi i64 [ %indvars.iv.next39.us.us.1, %.preheader34.us.us ], [ %indvars.iv3848.us.us.unr.ph, %.preheader34.us.us.preheader ]
  %7 = add nuw nsw i64 %indvars.iv3848.us.us, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv4252.us, i64 %indvars.iv4050.us.us, i64 %indvars.iv3848.us.us
  %indvars.iv.next39.us.us = add nuw nsw i64 %indvars.iv3848.us.us, 1
  %12 = add nuw nsw i64 %indvars.iv.next39.us.us, %6
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next39.us.us.1 = add nsw i64 %indvars.iv3848.us.us, 2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next39.us.us.1, 160
  br i1 %exitcond71.1, label %.preheader34._crit_edge.us.us.loopexit, label %.preheader34.us.us

.preheader33.loopexit:                            ; preds = %.preheader35._crit_edge.us
  br label %.preheader33

.preheader33:                                     ; preds = %.preheader33.loopexit, %.preheader35.preheader.lr.ph, %5
  br i1 true, label %.preheader.preheader.us.preheader, label %._crit_edge

.preheader.preheader.us.preheader:                ; preds = %.preheader33
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv3646.us = phi i64 [ %indvars.iv.next37.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  br i1 true, label %.preheader.us.prol.loopexit, label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.preheader.us
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol, %.preheader.preheader.us
  %indvars.iv45.us.unr.ph = phi i64 [ 1, %.preheader.us.prol ], [ 0, %.preheader.preheader.us ]
  br i1 false, label %.preheader._crit_edge.us, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.prol.loopexit
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %indvars.iv45.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us ], [ %indvars.iv45.us.unr.ph, %.preheader.us.preheader ]
  %20 = mul nuw nsw i64 %indvars.iv45.us, %indvars.iv3646.us
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 160
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv3646.us, i64 %indvars.iv45.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv45.us, 1
  %25 = mul nuw nsw i64 %indvars.iv.next.us, %indvars.iv3646.us
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 160
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, <double 1.600000e+02, double 1.600000e+02>
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv45.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 160
  br i1 %exitcond.us.1, label %.preheader._crit_edge.us.loopexit, label %.preheader.us

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %.preheader.us.prol.loopexit
  %indvars.iv.next37.us = add nuw nsw i64 %indvars.iv3646.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next37.us, 160
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader.us

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader33
  ret void
}

declare void @polybench_timer_start(...) #2

declare void @polybench_timer_stop(...) #2

declare void @polybench_timer_print(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) #1 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.preheader20.preheader.lr.ph, label %._crit_edge

.preheader20.preheader.lr.ph:                     ; preds = %4
  br i1 true, label %.preheader20.preheader.us.preheader, label %._crit_edge

.preheader20.preheader.us.preheader:              ; preds = %.preheader20.preheader.lr.ph
  br label %.preheader20.preheader.us

.preheader20.preheader.us:                        ; preds = %.preheader20.preheader.us.preheader, %.preheader20._crit_edge.us
  %indvars.iv2328.us = phi i64 [ %indvars.iv.next24.us, %.preheader20._crit_edge.us ], [ 0, %.preheader20.preheader.us.preheader ]
  %9 = mul nsw i64 %indvars.iv2328.us, 140
  br i1 true, label %.preheader.preheader.us.us.preheader, label %.preheader20._crit_edge.us

.preheader.preheader.us.us.preheader:             ; preds = %.preheader20.preheader.us
  br label %.preheader.preheader.us.us

.preheader20._crit_edge.us.loopexit:              ; preds = %.preheader._crit_edge.us.us
  br label %.preheader20._crit_edge.us

.preheader20._crit_edge.us:                       ; preds = %.preheader20._crit_edge.us.loopexit, %.preheader20.preheader.us
  %indvars.iv.next24.us = add nuw nsw i64 %indvars.iv2328.us, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next24.us, 150
  br i1 %exitcond47, label %._crit_edge.loopexit, label %.preheader20.preheader.us

.preheader.preheader.us.us:                       ; preds = %.preheader.preheader.us.us.preheader, %.preheader._crit_edge.us.us
  %indvars.iv2126.us.us = phi i64 [ %indvars.iv.next22.us.us, %.preheader._crit_edge.us.us ], [ 0, %.preheader.preheader.us.us.preheader ]
  %10 = add i64 %indvars.iv2126.us.us, %9
  %11 = mul i64 %10, 160
  br label %12

.preheader._crit_edge.us.us:                      ; preds = %.preheader.us.us
  %indvars.iv.next22.us.us = add nuw nsw i64 %indvars.iv2126.us.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next22.us.us, 140
  br i1 %exitcond46, label %.preheader20._crit_edge.us.loopexit, label %.preheader.preheader.us.us

; <label>:12:                                     ; preds = %.preheader.us.us, %.preheader.preheader.us.us
  %indvars.iv25.us.us = phi i64 [ 0, %.preheader.preheader.us.us ], [ %indvars.iv.next.us.us, %.preheader.us.us ]
  %13 = add i64 %indvars.iv25.us.us, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %.preheader.us.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %17, %12
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv2328.us, i64 %indvars.iv2126.us.us, i64 %indvars.iv25.us.us
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #7
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv25.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us.us, 160
  br i1 %exitcond, label %.preheader._crit_edge.us.us, label %12

._crit_edge.loopexit:                             ; preds = %.preheader20._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader20.preheader.lr.ph, %4
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}

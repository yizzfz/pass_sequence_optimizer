; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) #0 {
  %7 = bitcast double* %5 to i8*
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader29.preheader.lr.ph, label %._crit_edge63

.preheader29.preheader.lr.ph:                     ; preds = %6
  %12 = icmp sgt i32 %1, 0
  %13 = icmp sgt i32 %2, 0
  %wide.trip.count = zext i32 %2 to i64
  %exitcond38 = icmp eq i32 %2, 0
  %14 = icmp sgt i32 %2, 0
  %15 = add nsw i64 %8, -1
  %16 = shl nsw i64 %8, 3
  %xtraiter73 = and i64 %8, 3
  %lcmp.mod74 = icmp eq i64 %xtraiter73, 0
  %17 = icmp ult i64 %15, 3
  %xtraiter67 = and i64 %wide.trip.count, 1
  %lcmp.mod68 = icmp eq i64 %xtraiter67, 0
  %18 = icmp eq i32 %2, 1
  %xtraiter = and i64 %8, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %19 = icmp ult i64 %15, 3
  br label %.preheader29.preheader

.preheader29.preheader:                           ; preds = %.preheader29._crit_edge, %.preheader29.preheader.lr.ph
  %indvars.iv3660 = phi i64 [ 0, %.preheader29.preheader.lr.ph ], [ %indvars.iv.next37, %.preheader29._crit_edge ]
  br i1 %12, label %.preheader28.preheader.lr.ph, label %.preheader29._crit_edge

.preheader28.preheader.lr.ph:                     ; preds = %.preheader29.preheader
  br i1 %13, label %.preheader28.preheader.us.preheader, label %.preheader28.preheader.preheader

.preheader28.preheader.preheader:                 ; preds = %.preheader28.preheader.lr.ph
  br label %.preheader28.preheader

.preheader28.preheader.us.preheader:              ; preds = %.preheader28.preheader.lr.ph
  br label %.preheader28.preheader.us

.preheader28.preheader.us:                        ; preds = %.preheader28.preheader.us.preheader, %.preheader29.us
  %indvars.iv3445.us = phi i64 [ %indvars.iv.next35.us, %.preheader29.us ], [ 0, %.preheader28.preheader.us.preheader ]
  br i1 %exitcond38, label %.preheader28..preheader.preheader_crit_edge.us.loopexit, label %.lr.ph.us56.preheader

.lr.ph.us56.preheader:                            ; preds = %.preheader28.preheader.us
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3660, i64 %indvars.iv3445.us, i64 0
  br label %.lr.ph.us56

.preheader29.us.loopexit:                         ; preds = %.preheader.us
  br label %.preheader29.us

.preheader29.us:                                  ; preds = %.preheader29.us.loopexit, %.preheader.us.prol.loopexit, %.preheader28..preheader.preheader_crit_edge.us
  %indvars.iv.next35.us = add nuw nsw i64 %indvars.iv3445.us, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next35.us, %9
  br i1 %exitcond76, label %.preheader29._crit_edge.loopexit, label %.preheader28.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader86, %.preheader.us
  %indvars.iv3243.us = phi i64 [ %indvars.iv.next33.us.3, %.preheader.us ], [ %indvars.iv3243.us.unr, %.preheader.us.preheader86 ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv3243.us
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3660, i64 %indvars.iv3445.us, i64 %indvars.iv3243.us
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next33.us = add nuw nsw i64 %indvars.iv3243.us, 1
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next33.us
  %27 = bitcast double* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3660, i64 %indvars.iv3445.us, i64 %indvars.iv.next33.us
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next33.us.1 = add nsw i64 %indvars.iv3243.us, 2
  %31 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next33.us.1
  %32 = bitcast double* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3660, i64 %indvars.iv3445.us, i64 %indvars.iv.next33.us.1
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next33.us.2 = add nsw i64 %indvars.iv3243.us, 3
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next33.us.2
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3660, i64 %indvars.iv3445.us, i64 %indvars.iv.next33.us.2
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next33.us.3 = add nsw i64 %indvars.iv3243.us, 4
  %exitcond71.3 = icmp eq i64 %indvars.iv.next33.us.3, %8
  br i1 %exitcond71.3, label %.preheader29.us.loopexit, label %.preheader.us

.lr.ph.us56:                                      ; preds = %.lr.ph.us56.preheader, %._crit_edge.us57
  %indvars.iv3040.us49 = phi i64 [ %indvars.iv.next31.us55, %._crit_edge.us57 ], [ 0, %.lr.ph.us56.preheader ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv3040.us49
  store double 0.000000e+00, double* %41, align 8
  br i1 %lcmp.mod68, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us56
  %42 = load double, double* %20, align 8
  %43 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv3040.us49
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = load double, double* %41, align 8
  %47 = fadd double %46, %45
  store double %47, double* %41, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us56
  %indvars.iv39.us50.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us56 ]
  br i1 %18, label %._crit_edge.us57, label %.lr.ph.us56.new.preheader

.lr.ph.us56.new.preheader:                        ; preds = %.prol.loopexit
  br label %.lr.ph.us56.new

.lr.ph.us56.new:                                  ; preds = %.lr.ph.us56.new.preheader, %.lr.ph.us56.new
  %indvars.iv39.us50 = phi i64 [ %indvars.iv.next.us51.1, %.lr.ph.us56.new ], [ %indvars.iv39.us50.unr.ph, %.lr.ph.us56.new.preheader ]
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3660, i64 %indvars.iv3445.us, i64 %indvars.iv39.us50
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv39.us50, i64 %indvars.iv3040.us49
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = load double, double* %41, align 8
  %54 = fadd double %53, %52
  store double %54, double* %41, align 8
  %indvars.iv.next.us51 = add nuw nsw i64 %indvars.iv39.us50, 1
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3660, i64 %indvars.iv3445.us, i64 %indvars.iv.next.us51
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next.us51, i64 %indvars.iv3040.us49
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = load double, double* %41, align 8
  %61 = fadd double %60, %59
  store double %61, double* %41, align 8
  %indvars.iv.next.us51.1 = add nsw i64 %indvars.iv39.us50, 2
  %exitcond.us52.1 = icmp eq i64 %indvars.iv.next.us51.1, %wide.trip.count
  br i1 %exitcond.us52.1, label %._crit_edge.us57.loopexit, label %.lr.ph.us56.new

._crit_edge.us57.loopexit:                        ; preds = %.lr.ph.us56.new
  br label %._crit_edge.us57

._crit_edge.us57:                                 ; preds = %._crit_edge.us57.loopexit, %.prol.loopexit
  %indvars.iv.next31.us55 = add nuw nsw i64 %indvars.iv3040.us49, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next31.us55, %8
  br i1 %exitcond69, label %.preheader28..preheader.preheader_crit_edge.us.loopexit87, label %.lr.ph.us56

.preheader28..preheader.preheader_crit_edge.us.loopexit: ; preds = %.preheader28.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %16, i32 8, i1 false)
  br label %.preheader28..preheader.preheader_crit_edge.us

.preheader28..preheader.preheader_crit_edge.us.loopexit87: ; preds = %._crit_edge.us57
  br label %.preheader28..preheader.preheader_crit_edge.us

.preheader28..preheader.preheader_crit_edge.us:   ; preds = %.preheader28..preheader.preheader_crit_edge.us.loopexit87, %.preheader28..preheader.preheader_crit_edge.us.loopexit
  br i1 %14, label %.preheader.us.preheader, label %.preheader29.us

.preheader.us.preheader:                          ; preds = %.preheader28..preheader.preheader_crit_edge.us
  br i1 %lcmp.mod74, label %.preheader.us.prol.loopexit, label %.preheader.us.prol.preheader

.preheader.us.prol.preheader:                     ; preds = %.preheader.us.preheader
  br label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.prol.preheader, %.preheader.us.prol
  %indvars.iv3243.us.prol = phi i64 [ %indvars.iv.next33.us.prol, %.preheader.us.prol ], [ 0, %.preheader.us.prol.preheader ]
  %prol.iter75 = phi i64 [ %prol.iter75.sub, %.preheader.us.prol ], [ %xtraiter73, %.preheader.us.prol.preheader ]
  %62 = getelementptr inbounds double, double* %5, i64 %indvars.iv3243.us.prol
  %63 = bitcast double* %62 to i64*
  %64 = load i64, i64* %63, align 8
  %65 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3660, i64 %indvars.iv3445.us, i64 %indvars.iv3243.us.prol
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next33.us.prol = add nuw nsw i64 %indvars.iv3243.us.prol, 1
  %prol.iter75.sub = add i64 %prol.iter75, -1
  %prol.iter75.cmp = icmp eq i64 %prol.iter75.sub, 0
  br i1 %prol.iter75.cmp, label %.preheader.us.prol.loopexit.loopexit, label %.preheader.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %.preheader.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv3243.us.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next33.us.prol, %.preheader.us.prol.loopexit.loopexit ]
  br i1 %17, label %.preheader29.us, label %.preheader.us.preheader86

.preheader.us.preheader86:                        ; preds = %.preheader.us.prol.loopexit
  br label %.preheader.us

.preheader28.preheader:                           ; preds = %.preheader28.preheader.preheader, %.preheader29
  %indvars.iv3445 = phi i64 [ %indvars.iv.next35, %.preheader29 ], [ 0, %.preheader28.preheader.preheader ]
  br i1 %14, label %.preheader.preheader, label %.preheader29

.preheader.preheader:                             ; preds = %.preheader28.preheader
  br i1 %lcmp.mod, label %.preheader.prol.loopexit, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader, %.preheader.prol
  %indvars.iv3243.prol = phi i64 [ %indvars.iv.next33.prol, %.preheader.prol ], [ 0, %.preheader.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader.prol ], [ %xtraiter, %.preheader.prol.preheader ]
  %67 = getelementptr inbounds double, double* %5, i64 %indvars.iv3243.prol
  %68 = bitcast double* %67 to i64*
  %69 = load i64, i64* %68, align 8
  %70 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3660, i64 %indvars.iv3445, i64 %indvars.iv3243.prol
  %71 = bitcast double* %70 to i64*
  store i64 %69, i64* %71, align 8
  %indvars.iv.next33.prol = add nuw nsw i64 %indvars.iv3243.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.prol.loopexit.loopexit, label %.preheader.prol, !llvm.loop !3

.preheader.prol.loopexit.loopexit:                ; preds = %.preheader.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.loopexit, %.preheader.preheader
  %indvars.iv3243.unr = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next33.prol, %.preheader.prol.loopexit.loopexit ]
  br i1 %19, label %.preheader29, label %.preheader.preheader88

.preheader.preheader88:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader88, %.preheader
  %indvars.iv3243 = phi i64 [ %indvars.iv.next33.3, %.preheader ], [ %indvars.iv3243.unr, %.preheader.preheader88 ]
  %72 = getelementptr inbounds double, double* %5, i64 %indvars.iv3243
  %73 = bitcast double* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3660, i64 %indvars.iv3445, i64 %indvars.iv3243
  %76 = bitcast double* %75 to i64*
  store i64 %74, i64* %76, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv3243, 1
  %77 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next33
  %78 = bitcast double* %77 to i64*
  %79 = load i64, i64* %78, align 8
  %80 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3660, i64 %indvars.iv3445, i64 %indvars.iv.next33
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv3243, 2
  %82 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next33.1
  %83 = bitcast double* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3660, i64 %indvars.iv3445, i64 %indvars.iv.next33.1
  %86 = bitcast double* %85 to i64*
  store i64 %84, i64* %86, align 8
  %indvars.iv.next33.2 = add nsw i64 %indvars.iv3243, 3
  %87 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next33.2
  %88 = bitcast double* %87 to i64*
  %89 = load i64, i64* %88, align 8
  %90 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3660, i64 %indvars.iv3445, i64 %indvars.iv.next33.2
  %91 = bitcast double* %90 to i64*
  store i64 %89, i64* %91, align 8
  %indvars.iv.next33.3 = add nsw i64 %indvars.iv3243, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next33.3, %8
  br i1 %exitcond.3, label %.preheader29.loopexit, label %.preheader

.preheader29.loopexit:                            ; preds = %.preheader
  br label %.preheader29

.preheader29:                                     ; preds = %.preheader29.loopexit, %.preheader.prol.loopexit, %.preheader28.preheader
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv3445, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, %9
  br i1 %exitcond, label %.preheader29._crit_edge.loopexit89, label %.preheader28.preheader

.preheader29._crit_edge.loopexit:                 ; preds = %.preheader29.us
  br label %.preheader29._crit_edge

.preheader29._crit_edge.loopexit89:               ; preds = %.preheader29
  br label %.preheader29._crit_edge

.preheader29._crit_edge:                          ; preds = %.preheader29._crit_edge.loopexit89, %.preheader29._crit_edge.loopexit, %.preheader29.preheader
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv3660, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next37, %10
  br i1 %exitcond77, label %._crit_edge63.loopexit, label %.preheader29.preheader

._crit_edge63.loopexit:                           ; preds = %.preheader29._crit_edge
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge63.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %15

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %11
  tail call void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %15

; <label>:15:                                     ; preds = %11, %14, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) #0 {
  %6 = sext i32 %2 to i64
  %7 = sext i32 %1 to i64
  %8 = sext i32 %0 to i64
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader28.preheader.lr.ph, label %.preheader26

.preheader28.preheader.lr.ph:                     ; preds = %5
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  %12 = sitofp i32 %2 to double
  br i1 %10, label %.preheader28.preheader.us.preheader, label %.preheader26

.preheader28.preheader.us.preheader:              ; preds = %.preheader28.preheader.lr.ph
  %xtraiter65 = and i64 %6, 1
  %lcmp.mod66 = icmp eq i64 %xtraiter65, 0
  %13 = icmp eq i32 %2, 1
  br label %.preheader28.preheader.us

.preheader28.preheader.us:                        ; preds = %.preheader28.preheader.us.preheader, %.preheader28._crit_edge.us
  %indvars.iv3545.us = phi i64 [ %indvars.iv.next36.us, %.preheader28._crit_edge.us ], [ 0, %.preheader28.preheader.us.preheader ]
  br i1 %11, label %.preheader27.preheader.us.us.preheader, label %.preheader28._crit_edge.us

.preheader27.preheader.us.us.preheader:           ; preds = %.preheader28.preheader.us
  br label %.preheader27.preheader.us.us

.preheader28._crit_edge.us.loopexit:              ; preds = %.preheader27._crit_edge.us.us
  br label %.preheader28._crit_edge.us

.preheader28._crit_edge.us:                       ; preds = %.preheader28._crit_edge.us.loopexit, %.preheader28.preheader.us
  %indvars.iv.next36.us = add nuw nsw i64 %indvars.iv3545.us, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next36.us, %8
  br i1 %exitcond68, label %.preheader26.loopexit, label %.preheader28.preheader.us

.preheader27.preheader.us.us:                     ; preds = %.preheader27.preheader.us.us.preheader, %.preheader27._crit_edge.us.us
  %indvars.iv3343.us.us = phi i64 [ %indvars.iv.next34.us.us, %.preheader27._crit_edge.us.us ], [ 0, %.preheader27.preheader.us.us.preheader ]
  %14 = mul nuw nsw i64 %indvars.iv3343.us.us, %indvars.iv3545.us
  br i1 %lcmp.mod66, label %.preheader27.us.us.prol.loopexit, label %.preheader27.us.us.prol

.preheader27.us.us.prol:                          ; preds = %.preheader27.preheader.us.us
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %2
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %12
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3545.us, i64 %indvars.iv3343.us.us, i64 0
  store double %18, double* %19, align 8
  br label %.preheader27.us.us.prol.loopexit

.preheader27.us.us.prol.loopexit:                 ; preds = %.preheader27.us.us.prol, %.preheader27.preheader.us.us
  %indvars.iv3141.us.us.unr.ph = phi i64 [ 1, %.preheader27.us.us.prol ], [ 0, %.preheader27.preheader.us.us ]
  br i1 %13, label %.preheader27._crit_edge.us.us, label %.preheader27.us.us.preheader

.preheader27.us.us.preheader:                     ; preds = %.preheader27.us.us.prol.loopexit
  br label %.preheader27.us.us

.preheader27._crit_edge.us.us.loopexit:           ; preds = %.preheader27.us.us
  br label %.preheader27._crit_edge.us.us

.preheader27._crit_edge.us.us:                    ; preds = %.preheader27._crit_edge.us.us.loopexit, %.preheader27.us.us.prol.loopexit
  %indvars.iv.next34.us.us = add nuw nsw i64 %indvars.iv3343.us.us, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next34.us.us, %7
  br i1 %exitcond67, label %.preheader28._crit_edge.us.loopexit, label %.preheader27.preheader.us.us

.preheader27.us.us:                               ; preds = %.preheader27.us.us.preheader, %.preheader27.us.us
  %indvars.iv3141.us.us = phi i64 [ %indvars.iv.next32.us.us.1, %.preheader27.us.us ], [ %indvars.iv3141.us.us.unr.ph, %.preheader27.us.us.preheader ]
  %20 = add nuw nsw i64 %indvars.iv3141.us.us, %14
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %2
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %12
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3545.us, i64 %indvars.iv3343.us.us, i64 %indvars.iv3141.us.us
  store double %24, double* %25, align 8
  %indvars.iv.next32.us.us = add nuw nsw i64 %indvars.iv3141.us.us, 1
  %26 = add nuw nsw i64 %indvars.iv.next32.us.us, %14
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %2
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %12
  %31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv3545.us, i64 %indvars.iv3343.us.us, i64 %indvars.iv.next32.us.us
  store double %30, double* %31, align 8
  %indvars.iv.next32.us.us.1 = add nsw i64 %indvars.iv3141.us.us, 2
  %exitcond64.1 = icmp eq i64 %indvars.iv.next32.us.us.1, %6
  br i1 %exitcond64.1, label %.preheader27._crit_edge.us.us.loopexit, label %.preheader27.us.us

.preheader26.loopexit:                            ; preds = %.preheader28._crit_edge.us
  br label %.preheader26

.preheader26:                                     ; preds = %.preheader26.loopexit, %.preheader28.preheader.lr.ph, %5
  %32 = sext i32 %2 to i64
  %33 = icmp sgt i32 %2, 0
  br i1 %33, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %.preheader26
  %wide.trip.count = zext i32 %2 to i64
  %34 = sitofp i32 %2 to double
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %35 = icmp eq i32 %2, 1
  %36 = fdiv double 0.000000e+00, %34
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv2939 = phi i64 [ %indvars.iv.next30, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  br i1 %lcmp.mod, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader
  %37 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv2939, i64 0
  store double %36, double* %37, align 8
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol, %.preheader.preheader
  %indvars.iv38.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader ]
  br i1 %35, label %.preheader._crit_edge, label %.preheader.preheader72

.preheader.preheader72:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader72, %.preheader
  %indvars.iv38 = phi i64 [ %indvars.iv.next.1, %.preheader ], [ %indvars.iv38.unr.ph, %.preheader.preheader72 ]
  %38 = mul nuw nsw i64 %indvars.iv38, %indvars.iv2939
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, %2
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %34
  %43 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv2939, i64 %indvars.iv38
  store double %42, double* %43, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv38, 1
  %44 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv2939
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %2
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, %34
  %49 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv2939, i64 %indvars.iv.next
  store double %48, double* %49, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv38, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %.preheader._crit_edge.loopexit, label %.preheader

.preheader._crit_edge.loopexit:                   ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv2939, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, %32
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader26
  ret void
}

declare void @polybench_timer_start(...) #2

declare void @polybench_timer_stop(...) #2

declare void @polybench_timer_print(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, i32, [140 x [160 x double]]*) #1 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %9 = sext i32 %2 to i64
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  %12 = sext i32 %1 to i64
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader16.preheader.lr.ph, label %._crit_edge

.preheader16.preheader.lr.ph:                     ; preds = %4
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  br i1 %14, label %.preheader16.preheader.us.preheader, label %._crit_edge

.preheader16.preheader.us.preheader:              ; preds = %.preheader16.preheader.lr.ph
  br label %.preheader16.preheader.us

.preheader16.preheader.us:                        ; preds = %.preheader16.preheader.us.preheader, %.preheader16._crit_edge.us
  %indvars.iv1924.us = phi i64 [ %indvars.iv.next20.us, %.preheader16._crit_edge.us ], [ 0, %.preheader16.preheader.us.preheader ]
  %16 = mul nsw i64 %indvars.iv1924.us, %12
  %17 = trunc i64 %16 to i32
  br i1 %15, label %.preheader.preheader.us.us.preheader, label %.preheader16._crit_edge.us

.preheader.preheader.us.us.preheader:             ; preds = %.preheader16.preheader.us
  br label %.preheader.preheader.us.us

.preheader16._crit_edge.us.loopexit:              ; preds = %.preheader._crit_edge.us.us
  br label %.preheader16._crit_edge.us

.preheader16._crit_edge.us:                       ; preds = %.preheader16._crit_edge.us.loopexit, %.preheader16.preheader.us
  %indvars.iv.next20.us = add nuw nsw i64 %indvars.iv1924.us, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next20.us, %11
  br i1 %exitcond43, label %._crit_edge.loopexit, label %.preheader16.preheader.us

.preheader.preheader.us.us:                       ; preds = %.preheader.preheader.us.us.preheader, %.preheader._crit_edge.us.us
  %indvars.iv1722.us.us = phi i64 [ %indvars.iv.next18.us.us, %.preheader._crit_edge.us.us ], [ 0, %.preheader.preheader.us.us.preheader ]
  %18 = trunc i64 %indvars.iv1722.us.us to i32
  %19 = add i32 %18, %17
  %20 = mul i32 %19, %2
  %21 = zext i32 %20 to i64
  br label %22

.preheader._crit_edge.us.us:                      ; preds = %.preheader.us.us
  %indvars.iv.next18.us.us = add nuw nsw i64 %indvars.iv1722.us.us, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next18.us.us, %10
  br i1 %exitcond42, label %.preheader16._crit_edge.us.loopexit, label %.preheader.preheader.us.us

; <label>:22:                                     ; preds = %.preheader.us.us, %.preheader.preheader.us.us
  %indvars.iv21.us.us = phi i64 [ 0, %.preheader.preheader.us.us ], [ %indvars.iv.next.us.us, %.preheader.us.us ]
  %23 = add nuw nsw i64 %indvars.iv21.us.us, %21
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 20
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %.preheader.us.us

; <label>:27:                                     ; preds = %22
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %28) #6
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %27, %22
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1924.us, i64 %indvars.iv1722.us.us, i64 %indvars.iv21.us.us
  %31 = load double, double* %30, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %31) #7
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv21.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us.us, %9
  br i1 %exitcond, label %.preheader._crit_edge.us.us, label %22

._crit_edge.loopexit:                             ; preds = %.preheader16._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader16.preheader.lr.ph, %4
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %35) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}

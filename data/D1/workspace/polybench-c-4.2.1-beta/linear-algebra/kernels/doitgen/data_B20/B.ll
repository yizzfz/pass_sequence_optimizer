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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader35.lr.ph, label %._crit_edge51

.preheader35.lr.ph:                               ; preds = %6
  %8 = add i32 %2, -1
  %xtraiter85 = and i32 %2, 3
  %wide.trip.count78.3 = zext i32 %2 to i64
  %wide.trip.count90 = zext i32 %1 to i64
  %xtraiter70 = and i32 %2, 1
  %wide.trip.count94 = zext i32 %0 to i64
  %9 = add nsw i32 %xtraiter85, -1
  %10 = zext i32 %9 to i64
  %11 = add nuw nsw i64 %10, 1
  %12 = add nsw i64 %wide.trip.count90, -1
  %13 = icmp sgt i32 %1, 0
  %14 = icmp sgt i32 %2, 0
  %15 = icmp eq i32 %xtraiter70, 0
  %16 = icmp eq i32 %8, 0
  %sunkaddr102 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %17 = icmp eq i32 %xtraiter85, 0
  %18 = icmp ult i32 %8, 3
  %xtraiter = and i64 %wide.trip.count90, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %19 = icmp ult i64 %12, 7
  br label %.preheader35

.preheader35:                                     ; preds = %._crit_edge43, %.preheader35.lr.ph
  %indvars.iv92 = phi i64 [ 0, %.preheader35.lr.ph ], [ %indvars.iv.next93, %._crit_edge43 ]
  br i1 %13, label %.preheader34.lr.ph, label %._crit_edge43

.preheader34.lr.ph:                               ; preds = %.preheader35
  br i1 %14, label %.preheader34.us.preheader, label %.preheader34.preheader

.preheader34.preheader:                           ; preds = %.preheader34.lr.ph
  br i1 %lcmp.mod, label %.preheader34.prol.loopexit, label %.preheader34.prol.preheader

.preheader34.prol.preheader:                      ; preds = %.preheader34.preheader
  br label %.preheader34.prol

.preheader34.prol:                                ; preds = %.preheader34.prol, %.preheader34.prol.preheader
  %indvars.iv57.prol = phi i64 [ %indvars.iv.next58.prol, %.preheader34.prol ], [ 0, %.preheader34.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader34.prol ], [ %xtraiter, %.preheader34.prol.preheader ]
  %indvars.iv.next58.prol = add nuw nsw i64 %indvars.iv57.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader34.prol.loopexit.unr-lcssa, label %.preheader34.prol, !llvm.loop !1

.preheader34.prol.loopexit.unr-lcssa:             ; preds = %.preheader34.prol
  br label %.preheader34.prol.loopexit

.preheader34.prol.loopexit:                       ; preds = %.preheader34.preheader, %.preheader34.prol.loopexit.unr-lcssa
  %indvars.iv57.unr = phi i64 [ 0, %.preheader34.preheader ], [ %indvars.iv.next58.prol, %.preheader34.prol.loopexit.unr-lcssa ]
  br i1 %19, label %._crit_edge43.loopexit106, label %.preheader34.preheader.new

.preheader34.preheader.new:                       ; preds = %.preheader34.prol.loopexit
  br label %.preheader34

.preheader34.us.preheader:                        ; preds = %.preheader34.lr.ph
  br label %.preheader34.us

.preheader34.us:                                  ; preds = %.preheader34.us.preheader, %._crit_edge41.us
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %._crit_edge41.us ], [ 0, %.preheader34.us.preheader ]
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 0
  br label %.lr.ph.us.us

._crit_edge41.us.loopexit:                        ; preds = %.lr.ph40.us.new
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %._crit_edge41.us.loopexit, %.prol.loopexit84
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next89, %wide.trip.count90
  br i1 %exitcond91, label %._crit_edge43.loopexit, label %.preheader34.us

.lr.ph40.us.new:                                  ; preds = %.lr.ph40.us.new.preheader, %.lr.ph40.us.new
  %indvars.iv76 = phi i64 [ %indvars.iv.next77.3, %.lr.ph40.us.new ], [ %indvars.iv76.unr, %.lr.ph40.us.new.preheader ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv76
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv76
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next77
  %27 = bitcast double* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv.next77
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next77.1 = add nsw i64 %indvars.iv76, 2
  %31 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next77.1
  %32 = bitcast double* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv.next77.1
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next77.2 = add nsw i64 %indvars.iv76, 3
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next77.2
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv.next77.2
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next77.3 = add nsw i64 %indvars.iv76, 4
  %exitcond79.3 = icmp eq i64 %indvars.iv.next77.3, %wide.trip.count78.3
  br i1 %exitcond79.3, label %._crit_edge41.us.loopexit, label %.lr.ph40.us.new

.lr.ph.us.us:                                     ; preds = %.preheader34.us, %._crit_edge.us.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge.us.us ], [ 0, %.preheader34.us ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv72
  store double 0.000000e+00, double* %41, align 8
  br i1 %15, label %.prol.loopexit69, label %.prol.preheader68

.prol.preheader68:                                ; preds = %.lr.ph.us.us
  %42 = load double, double* %20, align 8
  %43 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv72
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %45, 0.000000e+00
  %sunkaddr99 = shl i64 %indvars.iv72, 3
  %sunkaddr100 = add i64 %sunkaddr, %sunkaddr99
  %sunkaddr101 = inttoptr i64 %sunkaddr100 to double*
  store double %46, double* %sunkaddr101, align 8
  br label %.prol.loopexit69

.prol.loopexit69:                                 ; preds = %.prol.preheader68, %.lr.ph.us.us
  %47 = phi double [ %46, %.prol.preheader68 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv64.unr.ph = phi i64 [ 1, %.prol.preheader68 ], [ 0, %.lr.ph.us.us ]
  br i1 %16, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit69
  %sunkaddr103 = shl i64 %indvars.iv72, 3
  %sunkaddr104 = add i64 %sunkaddr102, %sunkaddr103
  %sunkaddr105 = inttoptr i64 %sunkaddr104 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit69
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, %wide.trip.count78.3
  br i1 %exitcond75, label %.lr.ph40.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %48 = phi double [ %60, %.lr.ph.us.us.new ], [ %47, %.lr.ph.us.us.new.preheader ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65.1, %.lr.ph.us.us.new ], [ %indvars.iv64.unr.ph, %.lr.ph.us.us.new.preheader ]
  %49 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv64
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv72
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %48, %53
  store double %54, double* %sunkaddr105, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv.next65
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next65, i64 %indvars.iv72
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fadd double %54, %59
  store double %60, double* %sunkaddr105, align 8
  %indvars.iv.next65.1 = add nuw nsw i64 %indvars.iv64, 2
  %exitcond67.1 = icmp eq i64 %indvars.iv.next65.1, %wide.trip.count78.3
  br i1 %exitcond67.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph40.us:                                      ; preds = %._crit_edge.us.us
  br i1 %17, label %.prol.loopexit84, label %.prol.preheader83.preheader

.prol.preheader83.preheader:                      ; preds = %.lr.ph40.us
  br label %.prol.preheader83

.prol.preheader83:                                ; preds = %.prol.preheader83.preheader, %.prol.preheader83
  %indvars.iv76.prol = phi i64 [ %indvars.iv.next77.prol, %.prol.preheader83 ], [ 0, %.prol.preheader83.preheader ]
  %prol.iter87 = phi i32 [ %prol.iter87.sub, %.prol.preheader83 ], [ %xtraiter85, %.prol.preheader83.preheader ]
  %61 = getelementptr inbounds double, double* %5, i64 %indvars.iv76.prol
  %62 = bitcast double* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv76.prol
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next77.prol = add nuw nsw i64 %indvars.iv76.prol, 1
  %prol.iter87.sub = add nsw i32 %prol.iter87, -1
  %prol.iter87.cmp = icmp eq i32 %prol.iter87.sub, 0
  br i1 %prol.iter87.cmp, label %.prol.loopexit84.loopexit, label %.prol.preheader83, !llvm.loop !3

.prol.loopexit84.loopexit:                        ; preds = %.prol.preheader83
  br label %.prol.loopexit84

.prol.loopexit84:                                 ; preds = %.prol.loopexit84.loopexit, %.lr.ph40.us
  %indvars.iv76.unr = phi i64 [ 0, %.lr.ph40.us ], [ %11, %.prol.loopexit84.loopexit ]
  br i1 %18, label %._crit_edge41.us, label %.lr.ph40.us.new.preheader

.lr.ph40.us.new.preheader:                        ; preds = %.prol.loopexit84
  br label %.lr.ph40.us.new

.preheader34:                                     ; preds = %.preheader34, %.preheader34.preheader.new
  %indvars.iv57 = phi i64 [ %indvars.iv57.unr, %.preheader34.preheader.new ], [ %indvars.iv.next58.7, %.preheader34 ]
  %indvars.iv.next58.7 = add nsw i64 %indvars.iv57, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next58.7, %wide.trip.count90
  br i1 %exitcond.7, label %._crit_edge43.loopexit106.unr-lcssa, label %.preheader34

._crit_edge43.loopexit:                           ; preds = %._crit_edge41.us
  br label %._crit_edge43

._crit_edge43.loopexit106.unr-lcssa:              ; preds = %.preheader34
  br label %._crit_edge43.loopexit106

._crit_edge43.loopexit106:                        ; preds = %.preheader34.prol.loopexit, %._crit_edge43.loopexit106.unr-lcssa
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge43.loopexit106, %._crit_edge43.loopexit, %.preheader35
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next93, %wide.trip.count94
  br i1 %exitcond95, label %._crit_edge51.loopexit, label %.preheader35

._crit_edge51.loopexit:                           ; preds = %._crit_edge43
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [140 x [160 x double]]*
  tail call void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) #0 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader35.lr.ph, label %.preheader33

.preheader35.lr.ph:                               ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %2 to double
  br i1 %7, label %.preheader35.us.preheader, label %.preheader33

.preheader35.us.preheader:                        ; preds = %.preheader35.lr.ph
  %wide.trip.count75 = zext i32 %0 to i64
  %xtraiter67 = and i32 %2, 1
  %wide.trip.count71 = zext i32 %1 to i64
  %wide.trip.count63.1 = zext i32 %2 to i64
  %9 = icmp sgt i32 %2, 0
  %10 = icmp eq i32 %xtraiter67, 0
  %11 = icmp eq i32 %2, 1
  %12 = insertelement <2 x double> undef, double %8, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader35.us

.preheader35.us:                                  ; preds = %.preheader35.us.preheader, %._crit_edge44.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge44.us ], [ 0, %.preheader35.us.preheader ]
  br i1 %9, label %.preheader34.us.us.preheader, label %._crit_edge44.us

.preheader34.us.us.preheader:                     ; preds = %.preheader35.us
  br label %.preheader34.us.us

._crit_edge44.us.loopexit:                        ; preds = %._crit_edge42.us.us
  br label %._crit_edge44.us

._crit_edge44.us:                                 ; preds = %._crit_edge44.us.loopexit, %.preheader35.us
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, %wide.trip.count75
  br i1 %exitcond76, label %.preheader33.loopexit, label %.preheader35.us

.preheader34.us.us:                               ; preds = %.preheader34.us.us.preheader, %._crit_edge42.us.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %._crit_edge42.us.us ], [ 0, %.preheader34.us.us.preheader ]
  %14 = mul nuw nsw i64 %indvars.iv69, %indvars.iv73
  br i1 %10, label %.prol.loopexit66, label %.prol.preheader65

.prol.preheader65:                                ; preds = %.preheader34.us.us
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %2
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %8
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 0
  store double %18, double* %19, align 8
  br label %.prol.loopexit66

.prol.loopexit66:                                 ; preds = %.prol.preheader65, %.preheader34.us.us
  %indvars.iv61.unr.ph = phi i64 [ 1, %.prol.preheader65 ], [ 0, %.preheader34.us.us ]
  br i1 %11, label %._crit_edge42.us.us, label %.preheader34.us.us.new.preheader

.preheader34.us.us.new.preheader:                 ; preds = %.prol.loopexit66
  br label %.preheader34.us.us.new

._crit_edge42.us.us.loopexit:                     ; preds = %.preheader34.us.us.new
  br label %._crit_edge42.us.us

._crit_edge42.us.us:                              ; preds = %._crit_edge42.us.us.loopexit, %.prol.loopexit66
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %._crit_edge44.us.loopexit, label %.preheader34.us.us

.preheader34.us.us.new:                           ; preds = %.preheader34.us.us.new.preheader, %.preheader34.us.us.new
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.1, %.preheader34.us.us.new ], [ %indvars.iv61.unr.ph, %.preheader34.us.us.new.preheader ]
  %20 = add nsw i64 %indvars.iv61, %14
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %2
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv73, i64 %indvars.iv69, i64 %indvars.iv61
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %25 = add nsw i64 %indvars.iv.next62, %14
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, %2
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, %13
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %indvars.iv.next62.1 = add nuw nsw i64 %indvars.iv61, 2
  %exitcond64.1 = icmp eq i64 %indvars.iv.next62.1, %wide.trip.count63.1
  br i1 %exitcond64.1, label %._crit_edge42.us.us.loopexit, label %.preheader34.us.us.new

.preheader33.loopexit:                            ; preds = %._crit_edge44.us
  br label %.preheader33

.preheader33:                                     ; preds = %.preheader33.loopexit, %.preheader35.lr.ph, %5
  %33 = icmp sgt i32 %2, 0
  br i1 %33, label %.preheader.lr.ph, label %._crit_edge39

.preheader.lr.ph:                                 ; preds = %.preheader33
  %34 = sitofp i32 %2 to double
  %xtraiter = and i32 %2, 1
  %wide.trip.count59 = zext i32 %2 to i64
  %35 = fdiv double 0.000000e+00, %34
  %36 = icmp eq i32 %xtraiter, 0
  %37 = icmp eq i32 %2, 1
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br i1 %36, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %40 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv57, i64 0
  store double %35, double* %40, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %37, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %41 = mul nuw nsw i64 %indvars.iv, %indvars.iv57
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, %2
  %44 = sitofp i32 %43 to double
  %45 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %46 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv57
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %2
  %49 = sitofp i32 %48 to double
  %50 = insertelement <2 x double> undef, double %44, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fdiv <2 x double> %51, %39
  %53 = bitcast double* %45 to <2 x double>*
  store <2 x double> %52, <2 x double>* %53, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count59
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond, label %._crit_edge39.loopexit, label %.preheader.us

._crit_edge39.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %.preheader33
  ret void
}

declare void @polybench_timer_start(...) #2

declare void @polybench_timer_stop(...) #2

declare void @polybench_timer_print(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) #1 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader20.lr.ph, label %._crit_edge25

.preheader20.lr.ph:                               ; preds = %4
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.preheader20.us.preheader, label %._crit_edge25

.preheader20.us.preheader:                        ; preds = %.preheader20.lr.ph
  %11 = sext i32 %1 to i64
  %wide.trip.count42 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count38 = zext i32 %1 to i64
  %12 = icmp sgt i32 %2, 0
  br label %.preheader20.us

.preheader20.us:                                  ; preds = %._crit_edge23.us, %.preheader20.us.preheader
  %indvars.iv40 = phi i64 [ 0, %.preheader20.us.preheader ], [ %indvars.iv.next41, %._crit_edge23.us ]
  br i1 %12, label %.preheader.us.us.preheader, label %._crit_edge23.us

.preheader.us.us.preheader:                       ; preds = %.preheader20.us
  %13 = mul nsw i64 %indvars.iv40, %11
  %14 = trunc i64 %13 to i32
  br label %.preheader.us.us

._crit_edge23.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge23.us

._crit_edge23.us:                                 ; preds = %._crit_edge23.us.loopexit, %.preheader20.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %._crit_edge25.loopexit, label %.preheader20.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %15 = trunc i64 %indvars.iv36 to i32
  %16 = add i32 %15, %14
  %17 = mul i32 %16, %2
  %18 = zext i32 %17 to i64
  br label %19

._crit_edge.us.us:                                ; preds = %26
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond39, label %._crit_edge23.us.loopexit, label %.preheader.us.us

; <label>:19:                                     ; preds = %26, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %26 ], [ 0, %.preheader.us.us ]
  %20 = add i64 %indvars.iv, %18
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 20
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %19
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %25) #5
  br label %26

; <label>:26:                                     ; preds = %24, %19
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv40, i64 %indvars.iv36, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %19

._crit_edge25.loopexit:                           ; preds = %._crit_edge23.us
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %.preheader20.lr.ph, %4
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %33) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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

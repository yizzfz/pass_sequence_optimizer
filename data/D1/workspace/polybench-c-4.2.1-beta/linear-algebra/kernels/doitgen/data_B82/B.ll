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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader35.lr.ph, label %._crit_edge45

.preheader35.lr.ph:                               ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count56 = zext i32 %1 to i64
  %wide.trip.count60 = zext i32 %0 to i64
  br i1 %8, label %.preheader35.us.preheader, label %._crit_edge45

.preheader35.us.preheader:                        ; preds = %.preheader35.lr.ph
  %9 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 1
  %xtraiter89 = and i64 %wide.trip.count, 3
  %10 = icmp sgt i32 %2, 0
  %11 = icmp eq i64 %xtraiter, 0
  %12 = icmp eq i64 %9, 0
  %sunkaddr97 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %13 = icmp eq i64 %xtraiter89, 0
  %14 = icmp ult i64 %9, 3
  br label %.preheader35.us

.preheader35.us:                                  ; preds = %.preheader35.us.preheader, %._crit_edge43.us
  %indvars.iv58.us = phi i64 [ %indvars.iv.next59.us, %._crit_edge43.us ], [ 0, %.preheader35.us.preheader ]
  br i1 %10, label %.preheader34.us.us.preheader, label %._crit_edge43.us

.preheader34.us.us.preheader:                     ; preds = %.preheader35.us
  br label %.preheader34.us.us

._crit_edge43.us.loopexit:                        ; preds = %._crit_edge41.us.us
  br label %._crit_edge43.us

._crit_edge43.us:                                 ; preds = %._crit_edge43.us.loopexit, %.preheader35.us
  %indvars.iv.next59.us = add nuw nsw i64 %indvars.iv58.us, 1
  %exitcond61.us = icmp eq i64 %indvars.iv.next59.us, %wide.trip.count60
  br i1 %exitcond61.us, label %._crit_edge45.loopexit, label %.preheader35.us

.preheader34.us.us:                               ; preds = %.preheader34.us.us.preheader, %._crit_edge41.us.us
  %indvars.iv54.us.us = phi i64 [ %indvars.iv.next55.us.us, %._crit_edge41.us.us ], [ 0, %.preheader34.us.us.preheader ]
  %15 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv58.us, i64 %indvars.iv54.us.us, i64 0
  br label %.lr.ph.us.us

._crit_edge41.us.us.loopexit:                     ; preds = %.lr.ph40.us.us
  br label %._crit_edge41.us.us

._crit_edge41.us.us:                              ; preds = %._crit_edge41.us.us.loopexit, %.lr.ph40.us.us.prol.loopexit
  %indvars.iv.next55.us.us = add nuw nsw i64 %indvars.iv54.us.us, 1
  %exitcond57.us.us = icmp eq i64 %indvars.iv.next55.us.us, %wide.trip.count56
  br i1 %exitcond57.us.us, label %._crit_edge43.us.loopexit, label %.preheader34.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.preheader34.us.us
  %indvars.iv46.us.us = phi i64 [ 0, %.preheader34.us.us ], [ %indvars.iv.next47.us.us, %._crit_edge.us.us ]
  %16 = getelementptr inbounds double, double* %5, i64 %indvars.iv46.us.us
  store double 0.000000e+00, double* %16, align 8
  br i1 %11, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %17 = load double, double* %15, align 8
  %18 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv46.us.us
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %20, 0.000000e+00
  %sunkaddr94 = shl i64 %indvars.iv46.us.us, 3
  %sunkaddr95 = add i64 %sunkaddr, %sunkaddr94
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to double*
  store double %21, double* %sunkaddr96, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %.unr.ph = phi double [ %21, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.us.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %12, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %sunkaddr98 = shl i64 %indvars.iv46.us.us, 3
  %sunkaddr99 = add i64 %sunkaddr97, %sunkaddr98
  %sunkaddr100 = inttoptr i64 %sunkaddr99 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next47.us.us = add nuw nsw i64 %indvars.iv46.us.us, 1
  %exitcond49.us.us = icmp eq i64 %indvars.iv.next47.us.us, %wide.trip.count
  br i1 %exitcond49.us.us, label %.lr.ph40.us.us.preheader, label %.lr.ph.us.us

.lr.ph40.us.us.preheader:                         ; preds = %._crit_edge.us.us
  br i1 %13, label %.lr.ph40.us.us.prol.loopexit, label %.lr.ph40.us.us.prol.preheader

.lr.ph40.us.us.prol.preheader:                    ; preds = %.lr.ph40.us.us.preheader
  br label %.lr.ph40.us.us.prol

.lr.ph40.us.us.prol:                              ; preds = %.lr.ph40.us.us.prol.preheader, %.lr.ph40.us.us.prol
  %indvars.iv50.us.us.prol = phi i64 [ %indvars.iv.next51.us.us.prol, %.lr.ph40.us.us.prol ], [ 0, %.lr.ph40.us.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph40.us.us.prol ], [ %xtraiter89, %.lr.ph40.us.us.prol.preheader ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv50.us.us.prol
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv58.us, i64 %indvars.iv54.us.us, i64 %indvars.iv50.us.us.prol
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next51.us.us.prol = add nuw nsw i64 %indvars.iv50.us.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph40.us.us.prol.loopexit.loopexit, label %.lr.ph40.us.us.prol, !llvm.loop !1

.lr.ph40.us.us.prol.loopexit.loopexit:            ; preds = %.lr.ph40.us.us.prol
  br label %.lr.ph40.us.us.prol.loopexit

.lr.ph40.us.us.prol.loopexit:                     ; preds = %.lr.ph40.us.us.prol.loopexit.loopexit, %.lr.ph40.us.us.preheader
  %indvars.iv50.us.us.unr = phi i64 [ 0, %.lr.ph40.us.us.preheader ], [ %xtraiter89, %.lr.ph40.us.us.prol.loopexit.loopexit ]
  br i1 %14, label %._crit_edge41.us.us, label %.lr.ph40.us.us.preheader93

.lr.ph40.us.us.preheader93:                       ; preds = %.lr.ph40.us.us.prol.loopexit
  br label %.lr.ph40.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %27 = phi double [ %39, %.lr.ph.us.us.new ], [ %.unr.ph, %.lr.ph.us.us.new.preheader ]
  %indvars.iv.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.lr.ph.us.us.new ], [ %indvars.iv.us.us.unr.ph, %.lr.ph.us.us.new.preheader ]
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv58.us, i64 %indvars.iv54.us.us, i64 %indvars.iv.us.us
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.us.us, i64 %indvars.iv46.us.us
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %27, %32
  store double %33, double* %sunkaddr100, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv58.us, i64 %indvars.iv54.us.us, i64 %indvars.iv.next.us.us
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next.us.us, i64 %indvars.iv46.us.us
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fadd double %33, %38
  store double %39, double* %sunkaddr100, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv.us.us, 2
  %exitcond.us.us.1 = icmp eq i64 %indvars.iv.next.us.us.1, %wide.trip.count
  br i1 %exitcond.us.us.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph40.us.us:                                   ; preds = %.lr.ph40.us.us.preheader93, %.lr.ph40.us.us
  %indvars.iv50.us.us = phi i64 [ %indvars.iv.next51.us.us.3, %.lr.ph40.us.us ], [ %indvars.iv50.us.us.unr, %.lr.ph40.us.us.preheader93 ]
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv50.us.us
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv58.us, i64 %indvars.iv54.us.us, i64 %indvars.iv50.us.us
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next51.us.us = add nuw nsw i64 %indvars.iv50.us.us, 1
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next51.us.us
  %46 = bitcast double* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv58.us, i64 %indvars.iv54.us.us, i64 %indvars.iv.next51.us.us
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next51.us.us.1 = add nsw i64 %indvars.iv50.us.us, 2
  %50 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next51.us.us.1
  %51 = bitcast double* %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv58.us, i64 %indvars.iv54.us.us, i64 %indvars.iv.next51.us.us.1
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next51.us.us.2 = add nsw i64 %indvars.iv50.us.us, 3
  %55 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next51.us.us.2
  %56 = bitcast double* %55 to i64*
  %57 = load i64, i64* %56, align 8
  %58 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv58.us, i64 %indvars.iv54.us.us, i64 %indvars.iv.next51.us.us.2
  %59 = bitcast double* %58 to i64*
  store i64 %57, i64* %59, align 8
  %indvars.iv.next51.us.us.3 = add nuw nsw i64 %indvars.iv50.us.us, 4
  %exitcond53.us.us.3 = icmp eq i64 %indvars.iv.next51.us.us.3, %wide.trip.count
  br i1 %exitcond53.us.us.3, label %._crit_edge41.us.us.loopexit, label %.lr.ph40.us.us

._crit_edge45.loopexit:                           ; preds = %._crit_edge43.us
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge45.loopexit, %.preheader35.lr.ph, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
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
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
  br i1 true, label %.preheader35.lr.ph, label %.preheader33

.preheader35.lr.ph:                               ; preds = %5
  br i1 true, label %.preheader35.us.preheader, label %.preheader33

.preheader35.us.preheader:                        ; preds = %.preheader35.lr.ph
  br label %.preheader35.us

.preheader35.us:                                  ; preds = %.preheader35.us.preheader, %._crit_edge45.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %._crit_edge45.us ], [ 0, %.preheader35.us.preheader ]
  br i1 true, label %.preheader34.us.us.preheader, label %._crit_edge45.us

.preheader34.us.us.preheader:                     ; preds = %.preheader35.us
  br label %.preheader34.us.us

._crit_edge45.us.loopexit:                        ; preds = %._crit_edge42.us.us
  br label %._crit_edge45.us

._crit_edge45.us:                                 ; preds = %._crit_edge45.us.loopexit, %.preheader35.us
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, 150
  br i1 %exitcond78, label %.preheader33.loopexit, label %.preheader35.us

.preheader34.us.us:                               ; preds = %.preheader34.us.us.preheader, %._crit_edge42.us.us
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge42.us.us ], [ 0, %.preheader34.us.us.preheader ]
  %6 = mul i64 %indvars.iv71, %indvars.iv75
  br i1 true, label %.prol.loopexit68, label %.prol.preheader67

.prol.preheader67:                                ; preds = %.preheader34.us.us
  br label %.prol.loopexit68

.prol.loopexit68:                                 ; preds = %.prol.preheader67, %.preheader34.us.us
  %indvars.iv48.us.us.unr.ph = phi i64 [ 1, %.prol.preheader67 ], [ 0, %.preheader34.us.us ]
  br i1 false, label %._crit_edge42.us.us, label %.preheader34.us.us.new.preheader

.preheader34.us.us.new.preheader:                 ; preds = %.prol.loopexit68
  br label %.preheader34.us.us.new

._crit_edge42.us.us.loopexit:                     ; preds = %.preheader34.us.us.new
  br label %._crit_edge42.us.us

._crit_edge42.us.us:                              ; preds = %._crit_edge42.us.us.loopexit, %.prol.loopexit68
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, 140
  br i1 %exitcond74, label %._crit_edge45.us.loopexit, label %.preheader34.us.us

.preheader34.us.us.new:                           ; preds = %.preheader34.us.us.new.preheader, %.preheader34.us.us.new
  %indvars.iv48.us.us = phi i64 [ %indvars.iv.next49.us.us.1, %.preheader34.us.us.new ], [ %indvars.iv48.us.us.unr.ph, %.preheader34.us.us.new.preheader ]
  %7 = add i64 %indvars.iv48.us.us, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv75, i64 %indvars.iv71, i64 %indvars.iv48.us.us
  %indvars.iv.next49.us.us = add nuw nsw i64 %indvars.iv48.us.us, 1
  %12 = add i64 %indvars.iv.next49.us.us, %6
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next49.us.us.1 = add nuw nsw i64 %indvars.iv48.us.us, 2
  %exitcond51.us.us.1 = icmp eq i64 %indvars.iv.next49.us.us.1, 160
  br i1 %exitcond51.us.us.1, label %._crit_edge42.us.us.loopexit, label %.preheader34.us.us.new

.preheader33.loopexit:                            ; preds = %._crit_edge45.us
  br label %.preheader33

.preheader33:                                     ; preds = %.preheader33.loopexit, %.preheader35.lr.ph, %5
  br i1 true, label %.preheader.lr.ph, label %._crit_edge39

.preheader.lr.ph:                                 ; preds = %.preheader33
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv63 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next64, %._crit_edge ]
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader ]
  br i1 false, label %._crit_edge, label %.preheader.new.preheader

.preheader.new.preheader:                         ; preds = %.prol.loopexit
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new.preheader, %.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.new ], [ %indvars.iv.unr.ph, %.preheader.new.preheader ]
  %20 = mul nsw i64 %indvars.iv, %indvars.iv63
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 160
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv63, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = mul nsw i64 %indvars.iv.next, %indvars.iv63
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 160
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, <double 1.600000e+02, double 1.600000e+02>
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.preheader.new

._crit_edge.loopexit:                             ; preds = %.preheader.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond = icmp eq i64 %indvars.iv.next64, 160
  br i1 %exitcond, label %._crit_edge39.loopexit, label %.preheader

._crit_edge39.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %.preheader33
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader20.lr.ph, label %._crit_edge27

.preheader20.lr.ph:                               ; preds = %4
  br i1 true, label %.preheader20.us.preheader, label %._crit_edge27

.preheader20.us.preheader:                        ; preds = %.preheader20.lr.ph
  br label %.preheader20.us

.preheader20.us:                                  ; preds = %._crit_edge24.us, %.preheader20.us.preheader
  %indvars.iv41 = phi i64 [ 0, %.preheader20.us.preheader ], [ %indvars.iv.next42, %._crit_edge24.us ]
  br i1 true, label %.preheader.us.us.preheader, label %._crit_edge24.us

.preheader.us.us.preheader:                       ; preds = %.preheader20.us
  %9 = mul nsw i64 %indvars.iv41, 140
  br label %.preheader.us.us

._crit_edge24.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge24.us

._crit_edge24.us:                                 ; preds = %._crit_edge24.us.loopexit, %.preheader20.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 150
  br i1 %exitcond44, label %._crit_edge27.loopexit, label %.preheader20.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %10 = add i64 %indvars.iv, %9
  %11 = mul i64 %10, 160
  br label %12

._crit_edge.us.us:                                ; preds = %19
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 140
  br i1 %exitcond, label %._crit_edge24.us.loopexit, label %.preheader.us.us

; <label>:12:                                     ; preds = %19, %.preheader.us.us
  %indvars.iv.us.us = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next.us.us, %19 ]
  %13 = add i64 %indvars.iv.us.us, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv41, i64 %indvars.iv, i64 %indvars.iv.us.us
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %exitcond.us.us = icmp eq i64 %indvars.iv.next.us.us, 160
  br i1 %exitcond.us.us, label %._crit_edge.us.us, label %12

._crit_edge27.loopexit:                           ; preds = %._crit_edge24.us
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27.loopexit, %.preheader20.lr.ph, %4
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

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

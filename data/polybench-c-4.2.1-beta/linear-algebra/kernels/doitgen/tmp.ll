; ModuleID = 'B.ll'
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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader35.lr.ph, label %.._crit_edge51_crit_edge

.._crit_edge51_crit_edge:                         ; preds = %6
  br label %._crit_edge51

.preheader35.lr.ph:                               ; preds = %6
  %8 = add i32 %2, -1
  %9 = zext i32 %8 to i64
  %10 = shl nuw nsw i64 %9, 3
  %11 = add nuw nsw i64 %10, 8
  %12 = icmp sgt i32 %1, 0
  %13 = icmp sgt i32 %2, 0
  %14 = icmp sgt i32 %2, 0
  %wide.trip.count90 = zext i32 %1 to i64
  %15 = bitcast double* %5 to i8*
  %xtraiter70 = and i32 %2, 1
  %lcmp.mod71 = icmp eq i32 %xtraiter70, 0
  %16 = icmp eq i32 %8, 0
  %wide.trip.count74 = zext i32 %2 to i64
  %sunkaddr99 = ptrtoint double* %5 to i64
  %wide.trip.count66.1 = zext i32 %2 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %17 = icmp sgt i32 %2, 0
  %xtraiter85 = and i32 %2, 3
  %lcmp.mod86 = icmp eq i32 %xtraiter85, 0
  %18 = icmp ult i32 %8, 3
  %wide.trip.count78.3 = zext i32 %2 to i64
  %19 = icmp sgt i32 %2, 0
  %xtraiter = and i32 %2, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %20 = icmp ult i32 %8, 3
  %wide.trip.count.3 = zext i32 %2 to i64
  %wide.trip.count59 = zext i32 %1 to i64
  %wide.trip.count94 = zext i32 %0 to i64
  br label %.preheader35

.preheader35:                                     ; preds = %._crit_edge43..preheader35_crit_edge, %.preheader35.lr.ph
  %indvars.iv92 = phi i64 [ 0, %.preheader35.lr.ph ], [ %indvars.iv.next93, %._crit_edge43..preheader35_crit_edge ]
  br i1 %12, label %.preheader34.lr.ph, label %.preheader35.._crit_edge43_crit_edge

.preheader35.._crit_edge43_crit_edge:             ; preds = %.preheader35
  br label %._crit_edge43

.preheader34.lr.ph:                               ; preds = %.preheader35
  br i1 %13, label %.preheader34.lr.ph..preheader34.us_crit_edge, label %.preheader34.lr.ph..preheader34_crit_edge

.preheader34.lr.ph..preheader34_crit_edge:        ; preds = %.preheader34.lr.ph
  br label %.preheader34

.preheader34.lr.ph..preheader34.us_crit_edge:     ; preds = %.preheader34.lr.ph
  br label %.preheader34.us

.preheader34.us:                                  ; preds = %._crit_edge41.us..preheader34.us_crit_edge, %.preheader34.lr.ph..preheader34.us_crit_edge
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %._crit_edge41.us..preheader34.us_crit_edge ], [ 0, %.preheader34.lr.ph..preheader34.us_crit_edge ]
  br i1 %14, label %.lr.ph.us.us.preheader, label %..preheader_crit_edge.us.thread

.lr.ph.us.us.preheader:                           ; preds = %.preheader34.us
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 0
  br label %.lr.ph.us.us

..preheader_crit_edge.us.thread:                  ; preds = %.preheader34.us
  call void @llvm.memset.p0i8.i64(i8* %15, i8 0, i64 %11, i32 8, i1 false)
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %.prol.loopexit84.._crit_edge41.us_crit_edge, %..preheader_crit_edge.us.._crit_edge41.us_crit_edge, %.lr.ph40.us.new.._crit_edge41.us_crit_edge, %..preheader_crit_edge.us.thread
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next89, %wide.trip.count90
  br i1 %exitcond91, label %._crit_edge41.us.._crit_edge43_crit_edge, label %._crit_edge41.us..preheader34.us_crit_edge

._crit_edge41.us..preheader34.us_crit_edge:       ; preds = %._crit_edge41.us
  br label %.preheader34.us

._crit_edge41.us.._crit_edge43_crit_edge:         ; preds = %._crit_edge41.us
  br label %._crit_edge43

.lr.ph40.us.new:                                  ; preds = %.prol.loopexit84..lr.ph40.us.new_crit_edge, %.lr.ph40.us.new..lr.ph40.us.new_crit_edge
  %indvars.iv76 = phi i64 [ %indvars.iv.next77.3, %.lr.ph40.us.new..lr.ph40.us.new_crit_edge ], [ %indvars.iv76.unr, %.prol.loopexit84..lr.ph40.us.new_crit_edge ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv76
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv76
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next77
  %28 = bitcast double* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv.next77
  %31 = bitcast double* %30 to i64*
  store i64 %29, i64* %31, align 8
  %indvars.iv.next77.1 = add nsw i64 %indvars.iv76, 2
  %32 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next77.1
  %33 = bitcast double* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv.next77.1
  %36 = bitcast double* %35 to i64*
  store i64 %34, i64* %36, align 8
  %indvars.iv.next77.2 = add nsw i64 %indvars.iv76, 3
  %37 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next77.2
  %38 = bitcast double* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv.next77.2
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %indvars.iv.next77.3 = add nsw i64 %indvars.iv76, 4
  %exitcond79.3 = icmp eq i64 %indvars.iv.next77.3, %wide.trip.count78.3
  br i1 %exitcond79.3, label %.lr.ph40.us.new.._crit_edge41.us_crit_edge, label %.lr.ph40.us.new..lr.ph40.us.new_crit_edge

.lr.ph40.us.new..lr.ph40.us.new_crit_edge:        ; preds = %.lr.ph40.us.new
  br label %.lr.ph40.us.new

.lr.ph40.us.new.._crit_edge41.us_crit_edge:       ; preds = %.lr.ph40.us.new
  br label %._crit_edge41.us

..preheader_crit_edge.us:                         ; preds = %._crit_edge.us.us
  br i1 %17, label %.lr.ph40.us, label %..preheader_crit_edge.us.._crit_edge41.us_crit_edge

..preheader_crit_edge.us.._crit_edge41.us_crit_edge: ; preds = %..preheader_crit_edge.us
  br label %._crit_edge41.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.lr.ph.us.us.preheader
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge.us.us..lr.ph.us.us_crit_edge ], [ 0, %.lr.ph.us.us.preheader ]
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv72
  store double 0.000000e+00, double* %42, align 8
  br i1 %lcmp.mod71, label %.lr.ph.us.us..prol.loopexit69_crit_edge, label %43

.lr.ph.us.us..prol.loopexit69_crit_edge:          ; preds = %.lr.ph.us.us
  br label %.prol.loopexit69

; <label>:43:                                     ; preds = %.lr.ph.us.us
  %44 = load double, double* %21, align 8
  %45 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv72
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %sunkaddr96 = shl i64 %indvars.iv72, 3
  %sunkaddr97 = add i64 %sunkaddr, %sunkaddr96
  %sunkaddr98 = inttoptr i64 %sunkaddr97 to double*
  %48 = load double, double* %sunkaddr98, align 8
  %49 = fadd double %48, %47
  store double %49, double* %sunkaddr98, align 8
  br label %.prol.loopexit69

.prol.loopexit69:                                 ; preds = %43, %.lr.ph.us.us..prol.loopexit69_crit_edge
  %indvars.iv64.unr.ph = phi i64 [ 1, %43 ], [ 0, %.lr.ph.us.us..prol.loopexit69_crit_edge ]
  br i1 %16, label %.prol.loopexit69.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit69.._crit_edge.us.us_crit_edge:     ; preds = %.prol.loopexit69
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit69
  %sunkaddr100 = shl i64 %indvars.iv72, 3
  %sunkaddr101 = add i64 %sunkaddr99, %sunkaddr100
  %sunkaddr102 = inttoptr i64 %sunkaddr101 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us:                                ; preds = %.lr.ph.us.us.new.._crit_edge.us.us_crit_edge, %.prol.loopexit69.._crit_edge.us.us_crit_edge
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, %wide.trip.count74
  br i1 %exitcond75, label %..preheader_crit_edge.us, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %indvars.iv64 = phi i64 [ %indvars.iv.next65.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv64.unr.ph, %.lr.ph.us.us.new.preheader ]
  %50 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv64
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv72
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %sunkaddr102, align 8
  %56 = fadd double %55, %54
  store double %56, double* %sunkaddr102, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %57 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv.next65
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next65, i64 %indvars.iv72
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = load double, double* %sunkaddr102, align 8
  %63 = fadd double %62, %61
  store double %63, double* %sunkaddr102, align 8
  %indvars.iv.next65.1 = add nsw i64 %indvars.iv64, 2
  %exitcond67.1 = icmp eq i64 %indvars.iv.next65.1, %wide.trip.count66.1
  br i1 %exitcond67.1, label %.lr.ph.us.us.new.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.lr.ph.us.us.new.._crit_edge.us.us_crit_edge:     ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

.lr.ph40.us:                                      ; preds = %..preheader_crit_edge.us
  br i1 %lcmp.mod86, label %.lr.ph40.us..prol.loopexit84_crit_edge, label %.lr.ph40.us..prol.preheader83_crit_edge

.lr.ph40.us..prol.preheader83_crit_edge:          ; preds = %.lr.ph40.us
  br label %.prol.preheader83

.lr.ph40.us..prol.loopexit84_crit_edge:           ; preds = %.lr.ph40.us
  br label %.prol.loopexit84

.prol.preheader83:                                ; preds = %.prol.preheader83..prol.preheader83_crit_edge, %.lr.ph40.us..prol.preheader83_crit_edge
  %indvars.iv76.prol = phi i64 [ %indvars.iv.next77.prol, %.prol.preheader83..prol.preheader83_crit_edge ], [ 0, %.lr.ph40.us..prol.preheader83_crit_edge ]
  %prol.iter87 = phi i32 [ %prol.iter87.sub, %.prol.preheader83..prol.preheader83_crit_edge ], [ %xtraiter85, %.lr.ph40.us..prol.preheader83_crit_edge ]
  %64 = getelementptr inbounds double, double* %5, i64 %indvars.iv76.prol
  %65 = bitcast double* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv88, i64 %indvars.iv76.prol
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %indvars.iv.next77.prol = add nuw nsw i64 %indvars.iv76.prol, 1
  %prol.iter87.sub = add i32 %prol.iter87, -1
  %prol.iter87.cmp = icmp eq i32 %prol.iter87.sub, 0
  br i1 %prol.iter87.cmp, label %.prol.preheader83..prol.loopexit84_crit_edge, label %.prol.preheader83..prol.preheader83_crit_edge, !llvm.loop !1

.prol.preheader83..prol.preheader83_crit_edge:    ; preds = %.prol.preheader83
  br label %.prol.preheader83

.prol.preheader83..prol.loopexit84_crit_edge:     ; preds = %.prol.preheader83
  br label %.prol.loopexit84

.prol.loopexit84:                                 ; preds = %.prol.preheader83..prol.loopexit84_crit_edge, %.lr.ph40.us..prol.loopexit84_crit_edge
  %indvars.iv76.unr = phi i64 [ 0, %.lr.ph40.us..prol.loopexit84_crit_edge ], [ %indvars.iv.next77.prol, %.prol.preheader83..prol.loopexit84_crit_edge ]
  br i1 %18, label %.prol.loopexit84.._crit_edge41.us_crit_edge, label %.prol.loopexit84..lr.ph40.us.new_crit_edge

.prol.loopexit84..lr.ph40.us.new_crit_edge:       ; preds = %.prol.loopexit84
  br label %.lr.ph40.us.new

.prol.loopexit84.._crit_edge41.us_crit_edge:      ; preds = %.prol.loopexit84
  br label %._crit_edge41.us

.preheader34:                                     ; preds = %._crit_edge41..preheader34_crit_edge, %.preheader34.lr.ph..preheader34_crit_edge
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge41..preheader34_crit_edge ], [ 0, %.preheader34.lr.ph..preheader34_crit_edge ]
  br i1 %19, label %.lr.ph40, label %.preheader34.._crit_edge41_crit_edge

.preheader34.._crit_edge41_crit_edge:             ; preds = %.preheader34
  br label %._crit_edge41

.lr.ph40:                                         ; preds = %.preheader34
  br i1 %lcmp.mod, label %.lr.ph40..prol.loopexit_crit_edge, label %.lr.ph40..prol.preheader_crit_edge

.lr.ph40..prol.preheader_crit_edge:               ; preds = %.lr.ph40
  br label %.prol.preheader

.lr.ph40..prol.loopexit_crit_edge:                ; preds = %.lr.ph40
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.lr.ph40..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.lr.ph40..prol.preheader_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.lr.ph40..prol.preheader_crit_edge ]
  %69 = getelementptr inbounds double, double* %5, i64 %indvars.iv.prol
  %70 = bitcast double* %69 to i64*
  %71 = load i64, i64* %70, align 8
  %72 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv57, i64 %indvars.iv.prol
  %73 = bitcast double* %72 to i64*
  store i64 %71, i64* %73, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.preheader..prol.loopexit_crit_edge, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.preheader..prol.loopexit_crit_edge:         ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader..prol.loopexit_crit_edge, %.lr.ph40..prol.loopexit_crit_edge
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph40..prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.prol.preheader..prol.loopexit_crit_edge ]
  br i1 %20, label %.prol.loopexit.._crit_edge41_crit_edge, label %.prol.loopexit..lr.ph40.new_crit_edge

.prol.loopexit..lr.ph40.new_crit_edge:            ; preds = %.prol.loopexit
  br label %.lr.ph40.new

.prol.loopexit.._crit_edge41_crit_edge:           ; preds = %.prol.loopexit
  br label %._crit_edge41

.lr.ph40.new:                                     ; preds = %.lr.ph40.new..lr.ph40.new_crit_edge, %.prol.loopexit..lr.ph40.new_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph40.new..lr.ph40.new_crit_edge ], [ %indvars.iv.unr, %.prol.loopexit..lr.ph40.new_crit_edge ]
  %74 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %75 = bitcast double* %74 to i64*
  %76 = load i64, i64* %75, align 8
  %77 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv57, i64 %indvars.iv
  %78 = bitcast double* %77 to i64*
  store i64 %76, i64* %78, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %79 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next
  %80 = bitcast double* %79 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv57, i64 %indvars.iv.next
  %83 = bitcast double* %82 to i64*
  store i64 %81, i64* %83, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %84 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next.1
  %85 = bitcast double* %84 to i64*
  %86 = load i64, i64* %85, align 8
  %87 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv57, i64 %indvars.iv.next.1
  %88 = bitcast double* %87 to i64*
  store i64 %86, i64* %88, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %89 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next.2
  %90 = bitcast double* %89 to i64*
  %91 = load i64, i64* %90, align 8
  %92 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv92, i64 %indvars.iv57, i64 %indvars.iv.next.2
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %.lr.ph40.new.._crit_edge41_crit_edge, label %.lr.ph40.new..lr.ph40.new_crit_edge

.lr.ph40.new..lr.ph40.new_crit_edge:              ; preds = %.lr.ph40.new
  br label %.lr.ph40.new

.lr.ph40.new.._crit_edge41_crit_edge:             ; preds = %.lr.ph40.new
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %.lr.ph40.new.._crit_edge41_crit_edge, %.prol.loopexit.._crit_edge41_crit_edge, %.preheader34.._crit_edge41_crit_edge
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond, label %._crit_edge41.._crit_edge43_crit_edge, label %._crit_edge41..preheader34_crit_edge

._crit_edge41..preheader34_crit_edge:             ; preds = %._crit_edge41
  br label %.preheader34

._crit_edge41.._crit_edge43_crit_edge:            ; preds = %._crit_edge41
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge41.._crit_edge43_crit_edge, %._crit_edge41.us.._crit_edge43_crit_edge, %.preheader35.._crit_edge43_crit_edge
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next93, %wide.trip.count94
  br i1 %exitcond95, label %._crit_edge43.._crit_edge51_crit_edge, label %._crit_edge43..preheader35_crit_edge

._crit_edge43..preheader35_crit_edge:             ; preds = %._crit_edge43
  br label %.preheader35

._crit_edge43.._crit_edge51_crit_edge:            ; preds = %._crit_edge43
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge43.._crit_edge51_crit_edge, %.._crit_edge51_crit_edge
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
  br i1 %9, label %10, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %.._crit_edge_crit_edge20

.._crit_edge_crit_edge20:                         ; preds = %10
  br label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [140 x [160 x double]]*
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %13, %.._crit_edge_crit_edge20, %.._crit_edge_crit_edge
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
.preheader34.lr.ph:
  br label %.preheader34.us

.preheader34.us:                                  ; preds = %._crit_edge43.us..preheader34.us_crit_edge, %.preheader34.lr.ph
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge43.us..preheader34.us_crit_edge ], [ 0, %.preheader34.lr.ph ]
  br label %.preheader33.us.us

._crit_edge43.us:                                 ; preds = %._crit_edge41.us.us
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, 150
  br i1 %exitcond75, label %._crit_edge43.us..preheader.us_crit_edge, label %._crit_edge43.us..preheader34.us_crit_edge

._crit_edge43.us..preheader34.us_crit_edge:       ; preds = %._crit_edge43.us
  br label %.preheader34.us

._crit_edge43.us..preheader.us_crit_edge:         ; preds = %._crit_edge43.us
  br label %.preheader.us

.preheader33.us.us:                               ; preds = %._crit_edge41.us.us..preheader33.us.us_crit_edge, %.preheader34.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge41.us.us..preheader33.us.us_crit_edge ], [ 0, %.preheader34.us ]
  %5 = mul nuw nsw i64 %indvars.iv68, %indvars.iv72
  br label %.preheader33.us.us.new

._crit_edge41.us.us:                              ; preds = %.preheader33.us.us.new
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, 140
  br i1 %exitcond71, label %._crit_edge43.us, label %._crit_edge41.us.us..preheader33.us.us_crit_edge

._crit_edge41.us.us..preheader33.us.us_crit_edge: ; preds = %._crit_edge41.us.us
  br label %.preheader33.us.us

.preheader33.us.us.new:                           ; preds = %.preheader33.us.us.new..preheader33.us.us.new_crit_edge, %.preheader33.us.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.1, %.preheader33.us.us.new..preheader33.us.us.new_crit_edge ], [ 0, %.preheader33.us.us ]
  %6 = add nsw i64 %indvars.iv60, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 160
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv68, i64 %indvars.iv60
  %indvars.iv.next61 = or i64 %indvars.iv60, 1
  %11 = add nsw i64 %indvars.iv.next61, %5
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 160
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.600000e+02, double 1.600000e+02>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %exitcond63.1 = icmp eq i64 %indvars.iv.next61.1, 160
  br i1 %exitcond63.1, label %._crit_edge41.us.us, label %.preheader33.us.us.new..preheader33.us.us.new_crit_edge

.preheader33.us.us.new..preheader33.us.us.new_crit_edge: ; preds = %.preheader33.us.us.new
  br label %.preheader33.us.us.new

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %._crit_edge43.us..preheader.us_crit_edge
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %._crit_edge43.us..preheader.us_crit_edge ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ 0, %.preheader.us ]
  %19 = mul nuw nsw i64 %indvars.iv, %indvars.iv56
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 160
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv56, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %24 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv56
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 160
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 1.600000e+02, double 1.600000e+02>
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, 160
  br i1 %exitcond, label %._crit_edge38, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge38:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
.preheader20.us.preheader:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader20.us

.preheader20.us:                                  ; preds = %._crit_edge24.us..preheader20.us_crit_edge, %.preheader20.us.preheader
  %indvars.iv42 = phi i64 [ 0, %.preheader20.us.preheader ], [ %indvars.iv.next43, %._crit_edge24.us..preheader20.us_crit_edge ]
  %8 = mul nsw i64 %indvars.iv42, 140
  br label %.preheader.us.us

._crit_edge24.us:                                 ; preds = %._crit_edge22.us.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, 150
  br i1 %exitcond45, label %._crit_edge26, label %._crit_edge24.us..preheader20.us_crit_edge

._crit_edge24.us..preheader20.us_crit_edge:       ; preds = %._crit_edge24.us
  br label %.preheader20.us

.preheader.us.us:                                 ; preds = %._crit_edge22.us.us..preheader.us.us_crit_edge, %.preheader20.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge22.us.us..preheader.us.us_crit_edge ], [ 0, %.preheader20.us ]
  %9 = add i64 %indvars.iv38, %8
  %10 = mul i64 %9, 160
  br label %11

._crit_edge22.us.us:                              ; preds = %._crit_edge.us.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, 140
  br i1 %exitcond41, label %._crit_edge24.us, label %._crit_edge22.us.us..preheader.us.us_crit_edge

._crit_edge22.us.us..preheader.us.us_crit_edge:   ; preds = %._crit_edge22.us.us
  br label %.preheader.us.us

; <label>:11:                                     ; preds = %._crit_edge.us.us._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us._crit_edge ], [ 0, %.preheader.us.us ]
  %12 = add i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %.._crit_edge.us.us_crit_edge

.._crit_edge.us.us_crit_edge:                     ; preds = %11
  br label %._crit_edge.us.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %16, %.._crit_edge.us.us_crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv42, i64 %indvars.iv38, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %._crit_edge22.us.us, label %._crit_edge.us.us._crit_edge

._crit_edge.us.us._crit_edge:                     ; preds = %._crit_edge.us.us
  br label %11

._crit_edge26:                                    ; preds = %._crit_edge24.us
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

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}

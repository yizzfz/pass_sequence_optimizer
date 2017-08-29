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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) #0 {
  %7 = bitcast double* %5 to i8*
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader5.preheader.lr.ph, label %._crit_edge39

.preheader5.preheader.lr.ph:                      ; preds = %6
  %12 = icmp sgt i32 %1, 0
  %13 = icmp sgt i32 %2, 0
  %wide.trip.count = zext i32 %2 to i64
  %exitcond14 = icmp eq i32 %2, 0
  %14 = add nsw i64 %8, -1
  %15 = shl nsw i64 %8, 3
  %xtraiter49 = and i64 %8, 3
  %lcmp.mod50 = icmp eq i64 %xtraiter49, 0
  %16 = icmp ult i64 %14, 3
  %xtraiter43 = and i64 %wide.trip.count, 1
  %lcmp.mod44 = icmp eq i64 %xtraiter43, 0
  %17 = icmp eq i32 %2, 1
  %18 = add nsw i64 %9, -1
  %xtraiter = and i64 %9, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %19 = icmp ult i64 %18, 7
  br label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5._crit_edge, %.preheader5.preheader.lr.ph
  %indvars.iv1236 = phi i64 [ 0, %.preheader5.preheader.lr.ph ], [ %indvars.iv.next13, %.preheader5._crit_edge ]
  br i1 %12, label %.preheader4.preheader.lr.ph, label %.preheader5._crit_edge

.preheader4.preheader.lr.ph:                      ; preds = %.preheader5.preheader
  br i1 %13, label %.preheader4.preheader.us.preheader, label %.preheader4.preheader.preheader

.preheader4.preheader.preheader:                  ; preds = %.preheader4.preheader.lr.ph
  br i1 %lcmp.mod, label %.preheader4.preheader.prol.loopexit, label %.preheader4.preheader.prol.preheader

.preheader4.preheader.prol.preheader:             ; preds = %.preheader4.preheader.preheader
  br label %.preheader4.preheader.prol

.preheader4.preheader.prol:                       ; preds = %.preheader4.preheader.prol, %.preheader4.preheader.prol.preheader
  %indvars.iv1021.prol = phi i64 [ %indvars.iv.next11.prol, %.preheader4.preheader.prol ], [ 0, %.preheader4.preheader.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader4.preheader.prol ], [ %xtraiter, %.preheader4.preheader.prol.preheader ]
  %indvars.iv.next11.prol = add nuw nsw i64 %indvars.iv1021.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader4.preheader.prol.loopexit.unr-lcssa, label %.preheader4.preheader.prol, !llvm.loop !1

.preheader4.preheader.prol.loopexit.unr-lcssa:    ; preds = %.preheader4.preheader.prol
  br label %.preheader4.preheader.prol.loopexit

.preheader4.preheader.prol.loopexit:              ; preds = %.preheader4.preheader.preheader, %.preheader4.preheader.prol.loopexit.unr-lcssa
  %indvars.iv1021.unr = phi i64 [ 0, %.preheader4.preheader.preheader ], [ %indvars.iv.next11.prol, %.preheader4.preheader.prol.loopexit.unr-lcssa ]
  br i1 %19, label %.preheader5._crit_edge.loopexit63, label %.preheader4.preheader.preheader.new

.preheader4.preheader.preheader.new:              ; preds = %.preheader4.preheader.prol.loopexit
  br label %.preheader4.preheader

.preheader4.preheader.us.preheader:               ; preds = %.preheader4.preheader.lr.ph
  br label %.preheader4.preheader.us

.preheader4.preheader.us:                         ; preds = %.preheader4.preheader.us.preheader, %.preheader5.us
  %indvars.iv1021.us = phi i64 [ %indvars.iv.next11.us, %.preheader5.us ], [ 0, %.preheader4.preheader.us.preheader ]
  br i1 %exitcond14, label %.preheader4..preheader.preheader_crit_edge.us.loopexit, label %.lr.ph.us32.preheader

.lr.ph.us32.preheader:                            ; preds = %.preheader4.preheader.us
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 0
  br label %.lr.ph.us32

.preheader5.us.loopexit:                          ; preds = %.preheader.us
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.loopexit, %.preheader.us.prol.loopexit
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv1021.us, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next11.us, %9
  br i1 %exitcond52, label %.preheader5._crit_edge.loopexit, label %.preheader4.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader62, %.preheader.us
  %indvars.iv819.us = phi i64 [ %indvars.iv.next9.us.3, %.preheader.us ], [ %indvars.iv819.us.unr, %.preheader.us.preheader62 ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv819.us
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv819.us
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv819.us, 1
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next9.us
  %27 = bitcast double* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv.next9.us
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next9.us.1 = add nsw i64 %indvars.iv819.us, 2
  %31 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next9.us.1
  %32 = bitcast double* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv.next9.us.1
  %35 = bitcast double* %34 to i64*
  store i64 %33, i64* %35, align 8
  %indvars.iv.next9.us.2 = add nsw i64 %indvars.iv819.us, 3
  %36 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next9.us.2
  %37 = bitcast double* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv.next9.us.2
  %40 = bitcast double* %39 to i64*
  store i64 %38, i64* %40, align 8
  %indvars.iv.next9.us.3 = add nsw i64 %indvars.iv819.us, 4
  %exitcond47.3 = icmp eq i64 %indvars.iv.next9.us.3, %8
  br i1 %exitcond47.3, label %.preheader5.us.loopexit, label %.preheader.us

.lr.ph.us32:                                      ; preds = %._crit_edge.us33, %.lr.ph.us32.preheader
  %indvars.iv616.us25 = phi i64 [ 0, %.lr.ph.us32.preheader ], [ %indvars.iv.next7.us31, %._crit_edge.us33 ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv616.us25
  store double 0.000000e+00, double* %41, align 8
  br i1 %lcmp.mod44, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us32
  %42 = load double, double* %20, align 8
  %43 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv616.us25
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %45, 0.000000e+00
  store double %46, double* %41, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us32, %.prol.preheader
  %47 = phi double [ %46, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us32 ]
  %indvars.iv15.us26.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us32 ]
  br i1 %17, label %._crit_edge.us33, label %.lr.ph.us32.new.preheader

.lr.ph.us32.new.preheader:                        ; preds = %.prol.loopexit
  br label %.lr.ph.us32.new

.lr.ph.us32.new:                                  ; preds = %.lr.ph.us32.new.preheader, %.lr.ph.us32.new
  %48 = phi double [ %60, %.lr.ph.us32.new ], [ %47, %.lr.ph.us32.new.preheader ]
  %indvars.iv15.us26 = phi i64 [ %indvars.iv.next.us27.1, %.lr.ph.us32.new ], [ %indvars.iv15.us26.unr.ph, %.lr.ph.us32.new.preheader ]
  %49 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv15.us26
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv15.us26, i64 %indvars.iv616.us25
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %48, %53
  store double %54, double* %41, align 8
  %indvars.iv.next.us27 = add nuw nsw i64 %indvars.iv15.us26, 1
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv.next.us27
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next.us27, i64 %indvars.iv616.us25
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fadd double %54, %59
  store double %60, double* %41, align 8
  %indvars.iv.next.us27.1 = add nsw i64 %indvars.iv15.us26, 2
  %exitcond.us28.1 = icmp eq i64 %indvars.iv.next.us27.1, %wide.trip.count
  br i1 %exitcond.us28.1, label %._crit_edge.us33.loopexit, label %.lr.ph.us32.new

._crit_edge.us33.loopexit:                        ; preds = %.lr.ph.us32.new
  br label %._crit_edge.us33

._crit_edge.us33:                                 ; preds = %._crit_edge.us33.loopexit, %.prol.loopexit
  %indvars.iv.next7.us31 = add nuw nsw i64 %indvars.iv616.us25, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next7.us31, %8
  br i1 %exitcond45, label %.preheader.us.preheader.loopexit, label %.lr.ph.us32

.preheader4..preheader.preheader_crit_edge.us.loopexit: ; preds = %.preheader4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %15, i32 8, i1 false)
  br label %.preheader.us.preheader

.preheader.us.preheader.loopexit:                 ; preds = %._crit_edge.us33
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %.preheader4..preheader.preheader_crit_edge.us.loopexit
  br i1 %lcmp.mod50, label %.preheader.us.prol.loopexit, label %.preheader.us.prol.preheader

.preheader.us.prol.preheader:                     ; preds = %.preheader.us.preheader
  br label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.prol.preheader, %.preheader.us.prol
  %indvars.iv819.us.prol = phi i64 [ %indvars.iv.next9.us.prol, %.preheader.us.prol ], [ 0, %.preheader.us.prol.preheader ]
  %prol.iter51 = phi i64 [ %prol.iter51.sub, %.preheader.us.prol ], [ %xtraiter49, %.preheader.us.prol.preheader ]
  %61 = getelementptr inbounds double, double* %5, i64 %indvars.iv819.us.prol
  %62 = bitcast double* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv819.us.prol
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next9.us.prol = add nuw nsw i64 %indvars.iv819.us.prol, 1
  %prol.iter51.sub = add i64 %prol.iter51, -1
  %prol.iter51.cmp = icmp eq i64 %prol.iter51.sub, 0
  br i1 %prol.iter51.cmp, label %.preheader.us.prol.loopexit.loopexit, label %.preheader.us.prol, !llvm.loop !3

.preheader.us.prol.loopexit.loopexit:             ; preds = %.preheader.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv819.us.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next9.us.prol, %.preheader.us.prol.loopexit.loopexit ]
  br i1 %16, label %.preheader5.us, label %.preheader.us.preheader62

.preheader.us.preheader62:                        ; preds = %.preheader.us.prol.loopexit
  br label %.preheader.us

.preheader4.preheader:                            ; preds = %.preheader4.preheader, %.preheader4.preheader.preheader.new
  %indvars.iv1021 = phi i64 [ %indvars.iv1021.unr, %.preheader4.preheader.preheader.new ], [ %indvars.iv.next11.7, %.preheader4.preheader ]
  %indvars.iv.next11.7 = add nsw i64 %indvars.iv1021, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next11.7, %9
  br i1 %exitcond.7, label %.preheader5._crit_edge.loopexit63.unr-lcssa, label %.preheader4.preheader

.preheader5._crit_edge.loopexit:                  ; preds = %.preheader5.us
  br label %.preheader5._crit_edge

.preheader5._crit_edge.loopexit63.unr-lcssa:      ; preds = %.preheader4.preheader
  br label %.preheader5._crit_edge.loopexit63

.preheader5._crit_edge.loopexit63:                ; preds = %.preheader4.preheader.prol.loopexit, %.preheader5._crit_edge.loopexit63.unr-lcssa
  br label %.preheader5._crit_edge

.preheader5._crit_edge:                           ; preds = %.preheader5._crit_edge.loopexit63, %.preheader5._crit_edge.loopexit, %.preheader5.preheader
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1236, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next13, %10
  br i1 %exitcond53, label %._crit_edge39.loopexit, label %.preheader5.preheader

._crit_edge39.loopexit:                           ; preds = %.preheader5._crit_edge
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %6
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
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) #0 {
  %6 = sext i32 %2 to i64
  %7 = sext i32 %1 to i64
  %8 = sext i32 %0 to i64
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader6.preheader.lr.ph, label %.preheader4

.preheader6.preheader.lr.ph:                      ; preds = %5
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  %12 = sitofp i32 %2 to double
  br i1 %10, label %.preheader6.preheader.us.preheader, label %.preheader4

.preheader6.preheader.us.preheader:               ; preds = %.preheader6.preheader.lr.ph
  %xtraiter43 = and i64 %6, 1
  %lcmp.mod44 = icmp eq i64 %xtraiter43, 0
  %13 = icmp eq i32 %2, 1
  %14 = insertelement <2 x double> undef, double %12, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader6.preheader.us

.preheader6.preheader.us:                         ; preds = %.preheader6._crit_edge.us, %.preheader6.preheader.us.preheader
  %indvars.iv1323.us = phi i64 [ 0, %.preheader6.preheader.us.preheader ], [ %indvars.iv.next14.us, %.preheader6._crit_edge.us ]
  br i1 %11, label %.preheader5.preheader.us.us.preheader, label %.preheader6._crit_edge.us

.preheader5.preheader.us.us.preheader:            ; preds = %.preheader6.preheader.us
  br label %.preheader5.preheader.us.us

.preheader6._crit_edge.us.loopexit:               ; preds = %.preheader5._crit_edge.us.us
  br label %.preheader6._crit_edge.us

.preheader6._crit_edge.us:                        ; preds = %.preheader6._crit_edge.us.loopexit, %.preheader6.preheader.us
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1323.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next14.us, %8
  br i1 %exitcond46, label %.preheader4.loopexit, label %.preheader6.preheader.us

.preheader5.preheader.us.us:                      ; preds = %.preheader5.preheader.us.us.preheader, %.preheader5._crit_edge.us.us
  %indvars.iv1121.us.us = phi i64 [ %indvars.iv.next12.us.us, %.preheader5._crit_edge.us.us ], [ 0, %.preheader5.preheader.us.us.preheader ]
  %16 = mul nuw nsw i64 %indvars.iv1121.us.us, %indvars.iv1323.us
  br i1 %lcmp.mod44, label %.preheader5.us.us.prol.loopexit, label %.preheader5.us.us.prol

.preheader5.us.us.prol:                           ; preds = %.preheader5.preheader.us.us
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %2
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %12
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1323.us, i64 %indvars.iv1121.us.us, i64 0
  store double %20, double* %21, align 8
  br label %.preheader5.us.us.prol.loopexit

.preheader5.us.us.prol.loopexit:                  ; preds = %.preheader5.preheader.us.us, %.preheader5.us.us.prol
  %indvars.iv919.us.us.unr.ph = phi i64 [ 1, %.preheader5.us.us.prol ], [ 0, %.preheader5.preheader.us.us ]
  br i1 %13, label %.preheader5._crit_edge.us.us, label %.preheader5.us.us.preheader

.preheader5.us.us.preheader:                      ; preds = %.preheader5.us.us.prol.loopexit
  br label %.preheader5.us.us

.preheader5._crit_edge.us.us.loopexit:            ; preds = %.preheader5.us.us
  br label %.preheader5._crit_edge.us.us

.preheader5._crit_edge.us.us:                     ; preds = %.preheader5._crit_edge.us.us.loopexit, %.preheader5.us.us.prol.loopexit
  %indvars.iv.next12.us.us = add nuw nsw i64 %indvars.iv1121.us.us, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next12.us.us, %7
  br i1 %exitcond45, label %.preheader6._crit_edge.us.loopexit, label %.preheader5.preheader.us.us

.preheader5.us.us:                                ; preds = %.preheader5.us.us.preheader, %.preheader5.us.us
  %indvars.iv919.us.us = phi i64 [ %indvars.iv.next10.us.us.1, %.preheader5.us.us ], [ %indvars.iv919.us.us.unr.ph, %.preheader5.us.us.preheader ]
  %22 = add nuw nsw i64 %indvars.iv919.us.us, %16
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, %2
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1323.us, i64 %indvars.iv1121.us.us, i64 %indvars.iv919.us.us
  %indvars.iv.next10.us.us = add nuw nsw i64 %indvars.iv919.us.us, 1
  %27 = add nuw nsw i64 %indvars.iv.next10.us.us, %16
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, %2
  %30 = sitofp i32 %29 to double
  %31 = insertelement <2 x double> undef, double %25, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  %33 = fdiv <2 x double> %32, %15
  %34 = bitcast double* %26 to <2 x double>*
  store <2 x double> %33, <2 x double>* %34, align 8
  %indvars.iv.next10.us.us.1 = add nsw i64 %indvars.iv919.us.us, 2
  %exitcond42.1 = icmp eq i64 %indvars.iv.next10.us.us.1, %6
  br i1 %exitcond42.1, label %.preheader5._crit_edge.us.us.loopexit, label %.preheader5.us.us

.preheader4.loopexit:                             ; preds = %.preheader6._crit_edge.us
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader6.preheader.lr.ph, %5
  %35 = icmp sgt i32 %2, 0
  br i1 %35, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %.preheader4
  %wide.trip.count = zext i32 %2 to i64
  %36 = sitofp i32 %2 to double
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %37 = icmp eq i32 %2, 1
  %38 = fdiv double 0.000000e+00, %36
  %39 = insertelement <2 x double> undef, double %36, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv717 = phi i64 [ 0, %.preheader.preheader.preheader ], [ %indvars.iv.next8, %.preheader._crit_edge ]
  br i1 %lcmp.mod, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader
  %41 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv717, i64 0
  store double %38, double* %41, align 8
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.preheader, %.preheader.prol
  %indvars.iv16.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader ]
  br i1 %37, label %.preheader._crit_edge, label %.preheader.preheader50

.preheader.preheader50:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader50, %.preheader
  %indvars.iv16 = phi i64 [ %indvars.iv.next.1, %.preheader ], [ %indvars.iv16.unr.ph, %.preheader.preheader50 ]
  %42 = mul nuw nsw i64 %indvars.iv16, %indvars.iv717
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %2
  %45 = sitofp i32 %44 to double
  %46 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv717, i64 %indvars.iv16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv16, 1
  %47 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv717
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, %2
  %50 = sitofp i32 %49 to double
  %51 = insertelement <2 x double> undef, double %45, i32 0
  %52 = insertelement <2 x double> %51, double %50, i32 1
  %53 = fdiv <2 x double> %52, %40
  %54 = bitcast double* %46 to <2 x double>*
  store <2 x double> %53, <2 x double>* %54, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv16, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %.preheader._crit_edge.loopexit, label %.preheader

.preheader._crit_edge.loopexit:                   ; preds = %.preheader
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv717, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, %6
  br i1 %exitcond, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader4
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
  %9 = sext i32 %2 to i64
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.preheader3.preheader.lr.ph, label %._crit_edge

.preheader3.preheader.lr.ph:                      ; preds = %4
  %13 = icmp sgt i32 %1, 0
  %14 = icmp sgt i32 %2, 0
  %15 = mul nsw i64 %9, %10
  br i1 %13, label %.preheader3.preheader.us.preheader, label %._crit_edge

.preheader3.preheader.us.preheader:               ; preds = %.preheader3.preheader.lr.ph
  br label %.preheader3.preheader.us

.preheader3.preheader.us:                         ; preds = %.preheader3.preheader.us.preheader, %.preheader3._crit_edge.us
  %indvars.iv611.us = phi i64 [ %indvars.iv.next7.us, %.preheader3._crit_edge.us ], [ 0, %.preheader3.preheader.us.preheader ]
  %16 = mul i64 %15, %indvars.iv611.us
  br i1 %14, label %.preheader.preheader.us.us.preheader, label %.preheader3._crit_edge.us

.preheader.preheader.us.us.preheader:             ; preds = %.preheader3.preheader.us
  br label %.preheader.preheader.us.us

.preheader3._crit_edge.us.loopexit:               ; preds = %.preheader._crit_edge.us.us
  br label %.preheader3._crit_edge.us

.preheader3._crit_edge.us:                        ; preds = %.preheader3._crit_edge.us.loopexit, %.preheader3.preheader.us
  %indvars.iv.next7.us = add nuw nsw i64 %indvars.iv611.us, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next7.us, %11
  br i1 %exitcond30, label %._crit_edge.loopexit, label %.preheader3.preheader.us

.preheader.preheader.us.us:                       ; preds = %.preheader.preheader.us.us.preheader, %.preheader._crit_edge.us.us
  %indvars.iv49.us.us = phi i64 [ %indvars.iv.next5.us.us, %.preheader._crit_edge.us.us ], [ 0, %.preheader.preheader.us.us.preheader ]
  %17 = mul nsw i64 %indvars.iv49.us.us, %9
  %18 = add nsw i64 %17, %16
  br label %.preheader.us.us._crit_edge

.preheader._crit_edge.us.us:                      ; preds = %.preheader.us.us
  %indvars.iv.next5.us.us = add nuw nsw i64 %indvars.iv49.us.us, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next5.us.us, %10
  br i1 %exitcond29, label %.preheader3._crit_edge.us.loopexit, label %.preheader.preheader.us.us

.preheader.us.us._crit_edge:                      ; preds = %.preheader.us.us, %.preheader.preheader.us.us
  %indvars.iv8.us.us = phi i64 [ 0, %.preheader.preheader.us.us ], [ %indvars.iv.next.us.us, %.preheader.us.us ]
  %19 = add nsw i64 %18, %indvars.iv8.us.us
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %.preheader.us.us

; <label>:23:                                     ; preds = %.preheader.us.us._crit_edge
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #6
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.us.us._crit_edge, %23
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv611.us, i64 %indvars.iv49.us.us, i64 %indvars.iv8.us.us
  %27 = load double, double* %26, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %27) #7
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv8.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us.us, %9
  br i1 %exitcond, label %.preheader._crit_edge.us.us, label %.preheader.us.us._crit_edge

._crit_edge.loopexit:                             ; preds = %.preheader3._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader3.preheader.lr.ph, %4
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #6
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

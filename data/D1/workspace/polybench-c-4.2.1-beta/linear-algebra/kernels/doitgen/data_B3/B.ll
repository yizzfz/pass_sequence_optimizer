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
  %7 = sext i32 %2 to i64
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader5.preheader.lr.ph, label %._crit_edge39

.preheader5.preheader.lr.ph:                      ; preds = %6
  %wide.trip.count = zext i32 %2 to i64
  %11 = add nsw i64 %7, -1
  %12 = shl nsw i64 %7, 3
  %13 = icmp sgt i32 %1, 0
  %14 = icmp sgt i32 %2, 0
  %15 = icmp eq i32 %2, 0
  %16 = bitcast double* %5 to i8*
  %xtraiter43 = and i64 %wide.trip.count, 1
  %lcmp.mod44 = icmp eq i64 %xtraiter43, 0
  %17 = icmp eq i32 %2, 1
  %sunkaddr57 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %18 = icmp sgt i32 %2, 0
  %xtraiter49 = and i64 %7, 3
  %lcmp.mod50 = icmp eq i64 %xtraiter49, 0
  %19 = icmp ult i64 %11, 3
  %20 = icmp sgt i32 %2, 0
  %xtraiter = and i64 %7, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %21 = icmp ult i64 %11, 3
  br label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5._crit_edge, %.preheader5.preheader.lr.ph
  %indvars.iv1236 = phi i64 [ 0, %.preheader5.preheader.lr.ph ], [ %indvars.iv.next13, %.preheader5._crit_edge ]
  br i1 %13, label %.preheader4.preheader.lr.ph, label %.preheader5._crit_edge

.preheader4.preheader.lr.ph:                      ; preds = %.preheader5.preheader
  br i1 %14, label %.preheader4.preheader.us.preheader, label %.preheader4.preheader.preheader

.preheader4.preheader.preheader:                  ; preds = %.preheader4.preheader.lr.ph
  br label %.preheader4.preheader

.preheader4.preheader.us.preheader:               ; preds = %.preheader4.preheader.lr.ph
  br label %.preheader4.preheader.us

.preheader4.preheader.us:                         ; preds = %.preheader4.preheader.us.preheader, %.preheader5.us
  %indvars.iv1021.us = phi i64 [ %indvars.iv.next11.us, %.preheader5.us ], [ 0, %.preheader4.preheader.us.preheader ]
  br i1 %15, label %.preheader4..preheader.preheader_crit_edge.us.thread, label %.lr.ph.us32.preheader

.lr.ph.us32.preheader:                            ; preds = %.preheader4.preheader.us
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 0
  br label %.lr.ph.us32

.preheader4..preheader.preheader_crit_edge.us.thread: ; preds = %.preheader4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 %12, i32 8, i1 false)
  br label %.preheader5.us

.preheader5.us.loopexit:                          ; preds = %.preheader.us
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.loopexit, %.preheader.us.prol.loopexit, %.preheader4..preheader.preheader_crit_edge.us, %.preheader4..preheader.preheader_crit_edge.us.thread
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv1021.us, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next11.us, %8
  br i1 %exitcond52, label %.preheader5._crit_edge.loopexit, label %.preheader4.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader67, %.preheader.us
  %indvars.iv819.us = phi i64 [ %indvars.iv.next9.us.3, %.preheader.us ], [ %indvars.iv819.us.unr, %.preheader.us.preheader67 ]
  %23 = getelementptr inbounds double, double* %5, i64 %indvars.iv819.us
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv819.us
  %27 = bitcast double* %26 to i64*
  store i64 %25, i64* %27, align 8
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv819.us, 1
  %28 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next9.us
  %29 = bitcast double* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv.next9.us
  %32 = bitcast double* %31 to i64*
  store i64 %30, i64* %32, align 8
  %indvars.iv.next9.us.1 = add nsw i64 %indvars.iv819.us, 2
  %33 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next9.us.1
  %34 = bitcast double* %33 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv.next9.us.1
  %37 = bitcast double* %36 to i64*
  store i64 %35, i64* %37, align 8
  %indvars.iv.next9.us.2 = add nsw i64 %indvars.iv819.us, 3
  %38 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next9.us.2
  %39 = bitcast double* %38 to i64*
  %40 = load i64, i64* %39, align 8
  %41 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv.next9.us.2
  %42 = bitcast double* %41 to i64*
  store i64 %40, i64* %42, align 8
  %indvars.iv.next9.us.3 = add nsw i64 %indvars.iv819.us, 4
  %exitcond47.3 = icmp eq i64 %indvars.iv.next9.us.3, %7
  br i1 %exitcond47.3, label %.preheader5.us.loopexit, label %.preheader.us

.lr.ph.us32:                                      ; preds = %._crit_edge.us33, %.lr.ph.us32.preheader
  %indvars.iv616.us25 = phi i64 [ 0, %.lr.ph.us32.preheader ], [ %indvars.iv.next7.us31, %._crit_edge.us33 ]
  %43 = getelementptr inbounds double, double* %5, i64 %indvars.iv616.us25
  store double 0.000000e+00, double* %43, align 8
  br i1 %lcmp.mod44, label %.prol.loopexit, label %44

; <label>:44:                                     ; preds = %.lr.ph.us32
  %45 = load double, double* %22, align 8
  %46 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv616.us25
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %sunkaddr54 = shl i64 %indvars.iv616.us25, 3
  %sunkaddr55 = add i64 %sunkaddr, %sunkaddr54
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to double*
  %49 = load double, double* %sunkaddr56, align 8
  %50 = fadd double %49, %48
  store double %50, double* %sunkaddr56, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us32, %44
  %indvars.iv15.us26.unr.ph = phi i64 [ 1, %44 ], [ 0, %.lr.ph.us32 ]
  br i1 %17, label %._crit_edge.us33, label %.lr.ph.us32.new.preheader

.lr.ph.us32.new.preheader:                        ; preds = %.prol.loopexit
  %sunkaddr58 = shl i64 %indvars.iv616.us25, 3
  %sunkaddr59 = add i64 %sunkaddr57, %sunkaddr58
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to double*
  br label %.lr.ph.us32.new

.lr.ph.us32.new:                                  ; preds = %.lr.ph.us32.new, %.lr.ph.us32.new.preheader
  %indvars.iv15.us26 = phi i64 [ %indvars.iv15.us26.unr.ph, %.lr.ph.us32.new.preheader ], [ %indvars.iv.next.us27.1, %.lr.ph.us32.new ]
  %51 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv15.us26
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv15.us26, i64 %indvars.iv616.us25
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = load double, double* %sunkaddr60, align 8
  %57 = fadd double %56, %55
  store double %57, double* %sunkaddr60, align 8
  %indvars.iv.next.us27 = add nuw nsw i64 %indvars.iv15.us26, 1
  %58 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv.next.us27
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next.us27, i64 %indvars.iv616.us25
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = load double, double* %sunkaddr60, align 8
  %64 = fadd double %63, %62
  store double %64, double* %sunkaddr60, align 8
  %indvars.iv.next.us27.1 = add nsw i64 %indvars.iv15.us26, 2
  %exitcond.us28.1 = icmp eq i64 %indvars.iv.next.us27.1, %wide.trip.count
  br i1 %exitcond.us28.1, label %._crit_edge.us33.loopexit, label %.lr.ph.us32.new

._crit_edge.us33.loopexit:                        ; preds = %.lr.ph.us32.new
  br label %._crit_edge.us33

._crit_edge.us33:                                 ; preds = %._crit_edge.us33.loopexit, %.prol.loopexit
  %indvars.iv.next7.us31 = add nuw nsw i64 %indvars.iv616.us25, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next7.us31, %7
  br i1 %exitcond45, label %.preheader4..preheader.preheader_crit_edge.us, label %.lr.ph.us32

.preheader4..preheader.preheader_crit_edge.us:    ; preds = %._crit_edge.us33
  br i1 %18, label %.preheader.us.preheader, label %.preheader5.us

.preheader.us.preheader:                          ; preds = %.preheader4..preheader.preheader_crit_edge.us
  br i1 %lcmp.mod50, label %.preheader.us.prol.loopexit, label %.preheader.us.prol.preheader

.preheader.us.prol.preheader:                     ; preds = %.preheader.us.preheader
  br label %.preheader.us.prol

.preheader.us.prol:                               ; preds = %.preheader.us.prol.preheader, %.preheader.us.prol
  %indvars.iv819.us.prol = phi i64 [ %indvars.iv.next9.us.prol, %.preheader.us.prol ], [ 0, %.preheader.us.prol.preheader ]
  %prol.iter51 = phi i64 [ %prol.iter51.sub, %.preheader.us.prol ], [ %xtraiter49, %.preheader.us.prol.preheader ]
  %65 = getelementptr inbounds double, double* %5, i64 %indvars.iv819.us.prol
  %66 = bitcast double* %65 to i64*
  %67 = load i64, i64* %66, align 8
  %68 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021.us, i64 %indvars.iv819.us.prol
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next9.us.prol = add nuw nsw i64 %indvars.iv819.us.prol, 1
  %prol.iter51.sub = add i64 %prol.iter51, -1
  %prol.iter51.cmp = icmp eq i64 %prol.iter51.sub, 0
  br i1 %prol.iter51.cmp, label %.preheader.us.prol.loopexit.loopexit, label %.preheader.us.prol, !llvm.loop !1

.preheader.us.prol.loopexit.loopexit:             ; preds = %.preheader.us.prol
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv819.us.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next9.us.prol, %.preheader.us.prol.loopexit.loopexit ]
  br i1 %19, label %.preheader5.us, label %.preheader.us.preheader67

.preheader.us.preheader67:                        ; preds = %.preheader.us.prol.loopexit
  br label %.preheader.us

.preheader4.preheader:                            ; preds = %.preheader4.preheader.preheader, %.preheader5
  %indvars.iv1021 = phi i64 [ %indvars.iv.next11, %.preheader5 ], [ 0, %.preheader4.preheader.preheader ]
  br i1 %20, label %.preheader.preheader, label %.preheader5

.preheader.preheader:                             ; preds = %.preheader4.preheader
  br i1 %lcmp.mod, label %.preheader.prol.loopexit, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.preheader.preheader
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader, %.preheader.prol
  %indvars.iv819.prol = phi i64 [ %indvars.iv.next9.prol, %.preheader.prol ], [ 0, %.preheader.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader.prol ], [ %xtraiter, %.preheader.prol.preheader ]
  %70 = getelementptr inbounds double, double* %5, i64 %indvars.iv819.prol
  %71 = bitcast double* %70 to i64*
  %72 = load i64, i64* %71, align 8
  %73 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021, i64 %indvars.iv819.prol
  %74 = bitcast double* %73 to i64*
  store i64 %72, i64* %74, align 8
  %indvars.iv.next9.prol = add nuw nsw i64 %indvars.iv819.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.prol.loopexit.loopexit, label %.preheader.prol, !llvm.loop !3

.preheader.prol.loopexit.loopexit:                ; preds = %.preheader.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.loopexit, %.preheader.preheader
  %indvars.iv819.unr = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next9.prol, %.preheader.prol.loopexit.loopexit ]
  br i1 %21, label %.preheader5, label %.preheader.preheader68

.preheader.preheader68:                           ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader68, %.preheader
  %indvars.iv819 = phi i64 [ %indvars.iv.next9.3, %.preheader ], [ %indvars.iv819.unr, %.preheader.preheader68 ]
  %75 = getelementptr inbounds double, double* %5, i64 %indvars.iv819
  %76 = bitcast double* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021, i64 %indvars.iv819
  %79 = bitcast double* %78 to i64*
  store i64 %77, i64* %79, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv819, 1
  %80 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next9
  %81 = bitcast double* %80 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021, i64 %indvars.iv.next9
  %84 = bitcast double* %83 to i64*
  store i64 %82, i64* %84, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv819, 2
  %85 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next9.1
  %86 = bitcast double* %85 to i64*
  %87 = load i64, i64* %86, align 8
  %88 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021, i64 %indvars.iv.next9.1
  %89 = bitcast double* %88 to i64*
  store i64 %87, i64* %89, align 8
  %indvars.iv.next9.2 = add nsw i64 %indvars.iv819, 3
  %90 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next9.2
  %91 = bitcast double* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv1236, i64 %indvars.iv1021, i64 %indvars.iv.next9.2
  %94 = bitcast double* %93 to i64*
  store i64 %92, i64* %94, align 8
  %indvars.iv.next9.3 = add nsw i64 %indvars.iv819, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next9.3, %7
  br i1 %exitcond.3, label %.preheader5.loopexit, label %.preheader

.preheader5.loopexit:                             ; preds = %.preheader
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader.prol.loopexit, %.preheader4.preheader
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1021, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, %8
  br i1 %exitcond, label %.preheader5._crit_edge.loopexit69, label %.preheader4.preheader

.preheader5._crit_edge.loopexit:                  ; preds = %.preheader5.us
  br label %.preheader5._crit_edge

.preheader5._crit_edge.loopexit69:                ; preds = %.preheader5
  br label %.preheader5._crit_edge

.preheader5._crit_edge:                           ; preds = %.preheader5._crit_edge.loopexit69, %.preheader5._crit_edge.loopexit, %.preheader5.preheader
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1236, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next13, %9
  br i1 %exitcond53, label %._crit_edge39.loopexit, label %.preheader5.preheader

._crit_edge39.loopexit:                           ; preds = %.preheader5._crit_edge
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %6
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
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [140 x [160 x double]]*
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
  %6 = sext i32 %2 to i64
  %7 = sext i32 %1 to i64
  %8 = sext i32 %0 to i64
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader6.preheader.lr.ph, label %.preheader4.preheader

.preheader6.preheader.lr.ph:                      ; preds = %5
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %2 to double
  br i1 %10, label %.preheader6.preheader.us.preheader, label %.preheader4.preheader

.preheader6.preheader.us.preheader:               ; preds = %.preheader6.preheader.lr.ph
  %12 = icmp sgt i32 %2, 0
  %xtraiter43 = and i64 %6, 1
  %lcmp.mod44 = icmp eq i64 %xtraiter43, 0
  %13 = icmp eq i32 %2, 1
  %14 = insertelement <2 x double> undef, double %11, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader6.preheader.us

.preheader6.preheader.us:                         ; preds = %.preheader6._crit_edge.us, %.preheader6.preheader.us.preheader
  %indvars.iv1323.us = phi i64 [ 0, %.preheader6.preheader.us.preheader ], [ %indvars.iv.next14.us, %.preheader6._crit_edge.us ]
  br i1 %12, label %.preheader5.preheader.us.us.preheader, label %.preheader6._crit_edge.us

.preheader5.preheader.us.us.preheader:            ; preds = %.preheader6.preheader.us
  br label %.preheader5.preheader.us.us

.preheader6._crit_edge.us.loopexit:               ; preds = %.preheader5._crit_edge.us.us
  br label %.preheader6._crit_edge.us

.preheader6._crit_edge.us:                        ; preds = %.preheader6._crit_edge.us.loopexit, %.preheader6.preheader.us
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1323.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next14.us, %8
  br i1 %exitcond46, label %.preheader4.preheader.loopexit, label %.preheader6.preheader.us

.preheader5.preheader.us.us:                      ; preds = %.preheader5.preheader.us.us.preheader, %.preheader5._crit_edge.us.us
  %indvars.iv1121.us.us = phi i64 [ %indvars.iv.next12.us.us, %.preheader5._crit_edge.us.us ], [ 0, %.preheader5.preheader.us.us.preheader ]
  %16 = mul nuw nsw i64 %indvars.iv1121.us.us, %indvars.iv1323.us
  br i1 %lcmp.mod44, label %.preheader5.us.us.prol.loopexit, label %.preheader5.us.us.prol

.preheader5.us.us.prol:                           ; preds = %.preheader5.preheader.us.us
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, %2
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %11
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

.preheader4.preheader.loopexit:                   ; preds = %.preheader6._crit_edge.us
  br label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.preheader.loopexit, %.preheader6.preheader.lr.ph, %5
  %35 = icmp sgt i32 %2, 0
  br i1 %35, label %.preheader.preheader.preheader, label %.preheader4._crit_edge

.preheader.preheader.preheader:                   ; preds = %.preheader4.preheader
  %wide.trip.count = zext i32 %2 to i64
  %36 = sitofp i32 %2 to double
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %37 = icmp eq i32 %2, 1
  %38 = insertelement <2 x double> undef, double %36, i32 0
  %39 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  %40 = fdiv double 0.000000e+00, %36
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader4, %.preheader.preheader.preheader
  %indvars.iv717 = phi i64 [ 0, %.preheader.preheader.preheader ], [ %indvars.iv.next8, %.preheader4 ]
  br i1 %lcmp.mod, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader
  %41 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv717, i64 0
  store double %40, double* %41, align 8
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.preheader, %.preheader.prol
  %indvars.iv16.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader ]
  br i1 %37, label %.preheader4, label %.preheader.preheader50

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
  %53 = fdiv <2 x double> %52, %39
  %54 = bitcast double* %46 to <2 x double>*
  store <2 x double> %53, <2 x double>* %54, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv16, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %.preheader4.loopexit, label %.preheader

.preheader4.loopexit:                             ; preds = %.preheader
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader.prol.loopexit
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv717, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, %6
  br i1 %exitcond, label %.preheader4._crit_edge.loopexit, label %.preheader.preheader

.preheader4._crit_edge.loopexit:                  ; preds = %.preheader4
  br label %.preheader4._crit_edge

.preheader4._crit_edge:                           ; preds = %.preheader4._crit_edge.loopexit, %.preheader4.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = sext i32 %2 to i64
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  %12 = icmp sgt i32 %0, 0
  %13 = icmp sgt i32 %1, 0
  %or.cond = and i1 %12, %13
  br i1 %or.cond, label %.preheader3.preheader.us.preheader, label %._crit_edge14

.preheader3.preheader.us.preheader:               ; preds = %4
  %14 = icmp sgt i32 %2, 0
  br label %.preheader3.preheader.us

.preheader3.preheader.us:                         ; preds = %.preheader3._crit_edge.us, %.preheader3.preheader.us.preheader
  %indvars.iv611.us = phi i64 [ 0, %.preheader3.preheader.us.preheader ], [ %indvars.iv.next7.us, %.preheader3._crit_edge.us ]
  %15 = mul nsw i64 %indvars.iv611.us, %10
  %16 = trunc i64 %15 to i32
  br i1 %14, label %.preheader.preheader.us.us.preheader, label %.preheader3._crit_edge.us

.preheader.preheader.us.us.preheader:             ; preds = %.preheader3.preheader.us
  br label %.preheader.preheader.us.us

.preheader3._crit_edge.us.loopexit:               ; preds = %.preheader._crit_edge.us.us
  br label %.preheader3._crit_edge.us

.preheader3._crit_edge.us:                        ; preds = %.preheader3._crit_edge.us.loopexit, %.preheader3.preheader.us
  %indvars.iv.next7.us = add nuw nsw i64 %indvars.iv611.us, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next7.us, %11
  br i1 %exitcond31, label %._crit_edge14.loopexit, label %.preheader3.preheader.us

.preheader.preheader.us.us:                       ; preds = %.preheader.preheader.us.us.preheader, %.preheader._crit_edge.us.us
  %indvars.iv49.us.us = phi i64 [ %indvars.iv.next5.us.us, %.preheader._crit_edge.us.us ], [ 0, %.preheader.preheader.us.us.preheader ]
  %17 = trunc i64 %indvars.iv49.us.us to i32
  %18 = add i32 %17, %16
  %19 = mul i32 %18, %2
  %20 = zext i32 %19 to i64
  br label %._crit_edge.us.us._crit_edge

.preheader._crit_edge.us.us:                      ; preds = %._crit_edge.us.us
  %indvars.iv.next5.us.us = add nuw nsw i64 %indvars.iv49.us.us, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next5.us.us, %10
  br i1 %exitcond30, label %.preheader3._crit_edge.us.loopexit, label %.preheader.preheader.us.us

._crit_edge.us.us._crit_edge:                     ; preds = %._crit_edge.us.us, %.preheader.preheader.us.us
  %indvars.iv8.us.us = phi i64 [ 0, %.preheader.preheader.us.us ], [ %indvars.iv.next.us.us, %._crit_edge.us.us ]
  %21 = add nuw nsw i64 %indvars.iv8.us.us, %20
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 20
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %._crit_edge.us.us

; <label>:25:                                     ; preds = %._crit_edge.us.us._crit_edge
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #6
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us._crit_edge, %25
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv611.us, i64 %indvars.iv49.us.us, i64 %indvars.iv8.us.us
  %29 = load double, double* %28, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #6
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv8.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us.us, %9
  br i1 %exitcond, label %.preheader._crit_edge.us.us, label %._crit_edge.us.us._crit_edge

._crit_edge14.loopexit:                           ; preds = %.preheader3._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %4
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %33) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}

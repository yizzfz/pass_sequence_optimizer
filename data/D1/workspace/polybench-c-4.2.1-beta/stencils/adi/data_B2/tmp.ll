; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge1

._crit_edge1:                                     ; preds = %12
  br label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %16)
  br label %17

; <label>:17:                                     ; preds = %._crit_edge1, %._crit_edge, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader.lr.ph, label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge:                          ; preds = %2
  br label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %2
  %4 = sitofp i32 %0 to double
  %5 = sext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %wide.trip.count7 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %6 = icmp eq i32 %xtraiter, 0
  %7 = icmp eq i32 %0, 1
  %8 = insertelement <2 x double> undef, double %4, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.lr.ph ]
  %10 = add nsw i64 %indvars.iv5, %5
  br i1 %6, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, %4
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 0
  store double %13, double* %14, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us..prol.loopexit_crit_edge ]
  br i1 %7, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %15 = trunc i64 %10 to i32
  %16 = trunc i64 %10 to i32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %17 = trunc i64 %indvars.iv to i32
  %18 = sub i32 %15, %17
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = trunc i64 %indvars.iv.next to i32
  %22 = sub i32 %16, %21
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %19, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fdiv <2 x double> %25, %9
  %27 = bitcast double* %20 to <2 x double>*
  store <2 x double> %26, <2 x double>* %27, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond, label %._crit_edge4.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.._crit_edge4_crit_edge, %._crit_edge4.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  %7 = sitofp i32 %1 to double
  %8 = sitofp i32 %0 to double
  %9 = insertelement <2 x double> undef, double %7, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %10
  %12 = extractelement <2 x double> %11, i32 0
  %13 = insertelement <2 x double> undef, double %12, i32 0
  %14 = insertelement <2 x double> %13, double 2.000000e+00, i32 1
  %15 = fmul <2 x double> %11, %14
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  %17 = shufflevector <2 x double> %15, <2 x double> %11, <2 x i32> <i32 1, i32 3>
  %18 = fdiv <2 x double> %17, %16
  %19 = fmul <2 x double> %18, <double -5.000000e-01, double -5.000000e-01>
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  %22 = fadd <2 x double> %18, <double 1.000000e+00, double 1.000000e+00>
  %23 = icmp slt i32 %0, 1
  br i1 %23, label %.._crit_edge24_crit_edge, label %.preheader4.lr.ph

.._crit_edge24_crit_edge:                         ; preds = %6
  br label %._crit_edge24

.preheader4.lr.ph:                                ; preds = %6
  %24 = add nsw i32 %1, -1
  %25 = sext i32 %24 to i64
  %26 = add nsw i32 %1, -2
  %27 = fsub <2 x double> <double -0.000000e+00, double -0.000000e+00>, %19
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %30 = fmul <2 x double> %19, <double 2.000000e+00, double 2.000000e+00>
  %31 = fadd <2 x double> %30, <double 1.000000e+00, double 1.000000e+00>
  %32 = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %33 = extractelement <2 x double> %31, i32 0
  %34 = sext i32 %26 to i64
  %35 = add i32 %1, -3
  %wide.trip.count = zext i32 %24 to i64
  %xtraiter = and i32 %26, 1
  %36 = add nsw i64 %34, 1
  %indvars.iv.next26.prol = add nsw i64 %34, -1
  %wide.trip.count29 = zext i32 %24 to i64
  %37 = sext i32 %24 to i64
  %wide.trip.count33 = zext i32 %24 to i64
  %xtraiter37 = and i32 %26, 1
  %38 = add nsw i64 %34, 1
  %indvars.iv.next36.prol = add nsw i64 %34, -1
  %wide.trip.count41 = zext i32 %24 to i64
  %39 = icmp sgt i32 %24, 1
  %40 = shufflevector <2 x double> %19, <2 x double> %32, <2 x i32> <i32 1, i32 2>
  %41 = icmp sgt i32 %1, 2
  %42 = icmp eq i32 %xtraiter, 0
  %43 = icmp eq i32 %35, 0
  %44 = shufflevector <2 x double> %19, <2 x double> %32, <2 x i32> <i32 1, i32 2>
  %45 = icmp sgt i32 %24, 1
  %46 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> <i32 1, i32 1>
  %47 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> <i32 1, i32 1>
  %48 = icmp sgt i32 %1, 2
  %49 = icmp eq i32 %xtraiter37, 0
  %50 = icmp eq i32 %35, 0
  %51 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> <i32 1, i32 1>
  %52 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> <i32 1, i32 1>
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22..preheader4_crit_edge, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %229, %._crit_edge22..preheader4_crit_edge ]
  br i1 %39, label %.lver.check.preheader, label %.preheader4.._crit_edge22_crit_edge

.preheader4.._crit_edge22_crit_edge:              ; preds = %.preheader4
  br label %._crit_edge22

.lver.check.preheader:                            ; preds = %.preheader4
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge9.us..lver.check_crit_edge, %.lver.check.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge9.us..lver.check_crit_edge ], [ 0, %.lver.check.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge9.us..lver.check_crit_edge ], [ 1, %.lver.check.preheader ]
  %53 = add i64 %indvar, 1
  %54 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %54, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %4, i64 %54, i64 %wide.trip.count
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %5, i64 %54, i64 0
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %5, i64 %54, i64 %wide.trip.count
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv27
  store double 1.000000e+00, double* %55, align 8
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %56, align 8
  %57 = bitcast double* %55 to i64*
  %58 = load i64, i64* %57, align 8
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27
  %60 = bitcast [1000 x double]* %59 to i64*
  store i64 %58, i64* %60, align 8
  %61 = add nsw i64 %indvars.iv27, -1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %bound0 = icmp ult double* %scevgep, %scevgep53
  %bound1 = icmp ult double* %scevgep51, %scevgep49
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig..ph.lver.orig_crit_edge, %.ph.lver.orig.preheader
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig..ph.lver.orig_crit_edge ], [ 1, %.ph.lver.orig.preheader ]
  %62 = add nsw i64 %indvars.iv.lver.orig, -1
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %62
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %61
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next28
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %62
  %69 = insertelement <2 x double> undef, double %64, i32 0
  %70 = fmul <2 x double> %19, %69
  %71 = fadd <2 x double> %22, %70
  %72 = extractelement <2 x double> %71, i32 0
  %73 = extractelement <2 x double> %71, i32 0
  %74 = fdiv double %28, %72
  store double %74, double* %65, align 8
  %75 = bitcast double* %66 to <2 x double>*
  %76 = load <2 x double>, <2 x double>* %75, align 8
  %77 = fmul <2 x double> %40, %76
  %78 = extractelement <2 x double> %77, i32 0
  %79 = extractelement <2 x double> %77, i32 1
  %80 = fsub double %79, %78
  %81 = load double, double* %67, align 8
  %82 = fmul double %21, %81
  %83 = fsub double %80, %82
  %84 = load double, double* %68, align 8
  %85 = fmul double %20, %84
  %86 = fsub double %83, %85
  %87 = fdiv double %86, %73
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %87, double* %88, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, %wide.trip.count
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig..ph.lver.orig_crit_edge

.ph.lver.orig..ph.lver.orig_crit_edge:            ; preds = %.ph.lver.orig
  br label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %4, i64 %53, i64 0
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %5, i64 %53, i64 0
  %load_initial = load double, double* %scevgep55, align 8
  %load_initial59 = load double, double* %scevgep58, align 8
  br label %107

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.lr.ph8.us.prol.loopexit.._crit_edge9.us_crit_edge, %._crit_edge.us.._crit_edge9.us_crit_edge, %._crit_edge9.us.loopexit
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond30, label %.preheader, label %._crit_edge9.us..lver.check_crit_edge

._crit_edge9.us..lver.check_crit_edge:            ; preds = %._crit_edge9.us
  br label %.lver.check

.lr.ph8.us:                                       ; preds = %.lr.ph8.us..lr.ph8.us_crit_edge, %.lr.ph8.us.preheader87
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %.lr.ph8.us..lr.ph8.us_crit_edge ], [ %indvars.iv25.unr.ph, %.lr.ph8.us.preheader87 ]
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv25
  %90 = load double, double* %89, align 8
  %91 = add nsw i64 %indvars.iv25, 1
  %92 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %91, i64 %indvars.iv27
  %93 = load double, double* %92, align 8
  %94 = fmul double %90, %93
  %95 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv25
  %96 = load double, double* %95, align 8
  %97 = fadd double %94, %96
  %98 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv27
  store double %97, double* %98, align 8
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  %99 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.next26
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, %97
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next26
  %103 = load double, double* %102, align 8
  %104 = fadd double %101, %103
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next26, i64 %indvars.iv27
  store double %104, double* %105, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, -2
  %106 = icmp sgt i64 %indvars.iv.next26, 1
  br i1 %106, label %.lr.ph8.us..lr.ph8.us_crit_edge, label %._crit_edge9.us.loopexit

.lr.ph8.us..lr.ph8.us_crit_edge:                  ; preds = %.lr.ph8.us
  br label %.lr.ph8.us

; <label>:107:                                    ; preds = %._crit_edge, %.ph
  %store_forwarded60 = phi double [ %load_initial59, %.ph ], [ %128, %._crit_edge ]
  %store_forwarded57 = phi double [ %load_initial, %.ph ], [ %116, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %._crit_edge ]
  %108 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %61
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next28
  %111 = insertelement <2 x double> undef, double %store_forwarded57, i32 0
  %112 = fmul <2 x double> %19, %111
  %113 = fadd <2 x double> %22, %112
  %114 = extractelement <2 x double> %113, i32 0
  %115 = extractelement <2 x double> %113, i32 0
  %116 = fdiv double %28, %114
  store double %116, double* %108, align 8
  %117 = bitcast double* %109 to <2 x double>*
  %118 = load <2 x double>, <2 x double>* %117, align 8
  %119 = fmul <2 x double> %44, %118
  %120 = extractelement <2 x double> %119, i32 0
  %121 = extractelement <2 x double> %119, i32 1
  %122 = fsub double %121, %120
  %123 = load double, double* %110, align 8
  %124 = fmul double %21, %123
  %125 = fsub double %122, %124
  %126 = fmul double %20, %store_forwarded60
  %127 = fsub double %125, %126
  %128 = fdiv double %127, %115
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv
  store double %128, double* %129, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit90, label %._crit_edge

._crit_edge:                                      ; preds = %107
  br label %107

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  br label %._crit_edge.us

._crit_edge.us.loopexit90:                        ; preds = %107
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit90, %._crit_edge.us.loopexit
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %25, i64 %indvars.iv27
  store double 1.000000e+00, double* %130, align 8
  br i1 %41, label %.lr.ph8.us.preheader, label %._crit_edge.us.._crit_edge9.us_crit_edge

._crit_edge.us.._crit_edge9.us_crit_edge:         ; preds = %._crit_edge.us
  br label %._crit_edge9.us

.lr.ph8.us.preheader:                             ; preds = %._crit_edge.us
  br i1 %42, label %.lr.ph8.us.preheader..lr.ph8.us.prol.loopexit_crit_edge, label %.lr.ph8.us.prol

.lr.ph8.us.preheader..lr.ph8.us.prol.loopexit_crit_edge: ; preds = %.lr.ph8.us.preheader
  br label %.lr.ph8.us.prol.loopexit

.lr.ph8.us.prol:                                  ; preds = %.lr.ph8.us.preheader
  %131 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %34
  %132 = load double, double* %131, align 8
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %36, i64 %indvars.iv27
  %134 = load double, double* %133, align 8
  %135 = fmul double %132, %134
  %136 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %34
  %137 = load double, double* %136, align 8
  %138 = fadd double %135, %137
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %34, i64 %indvars.iv27
  store double %138, double* %139, align 8
  br label %.lr.ph8.us.prol.loopexit

.lr.ph8.us.prol.loopexit:                         ; preds = %.lr.ph8.us.preheader..lr.ph8.us.prol.loopexit_crit_edge, %.lr.ph8.us.prol
  %indvars.iv25.unr.ph = phi i64 [ %indvars.iv.next26.prol, %.lr.ph8.us.prol ], [ %34, %.lr.ph8.us.preheader..lr.ph8.us.prol.loopexit_crit_edge ]
  br i1 %43, label %.lr.ph8.us.prol.loopexit.._crit_edge9.us_crit_edge, label %.lr.ph8.us.preheader87

.lr.ph8.us.prol.loopexit.._crit_edge9.us_crit_edge: ; preds = %.lr.ph8.us.prol.loopexit
  br label %._crit_edge9.us

.lr.ph8.us.preheader87:                           ; preds = %.lr.ph8.us.prol.loopexit
  br label %.lr.ph8.us

.preheader:                                       ; preds = %._crit_edge9.us
  br i1 %45, label %.lver.check75.preheader, label %.preheader.._crit_edge22_crit_edge

.preheader.._crit_edge22_crit_edge:               ; preds = %.preheader
  br label %._crit_edge22

.lver.check75.preheader:                          ; preds = %.preheader
  br label %.lver.check75

.lver.check75:                                    ; preds = %._crit_edge19.us..lver.check75_crit_edge, %.lver.check75.preheader
  %indvar61 = phi i64 [ %indvar.next62, %._crit_edge19.us..lver.check75_crit_edge ], [ 0, %.lver.check75.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge19.us..lver.check75_crit_edge ], [ 1, %.lver.check75.preheader ]
  %140 = add i64 %indvar61, 1
  %141 = add i64 %indvar61, 1
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %4, i64 %141, i64 0
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %4, i64 %141, i64 %wide.trip.count
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %5, i64 %141, i64 0
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %5, i64 %141, i64 %wide.trip.count
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 0
  store double 1.000000e+00, double* %142, align 8
  %143 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 0
  store double 0.000000e+00, double* %143, align 8
  %144 = bitcast double* %142 to i64*
  %145 = load i64, i64* %144, align 8
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39
  %147 = bitcast [1000 x double]* %146 to i64*
  store i64 %145, i64* %147, align 8
  %148 = add nsw i64 %indvars.iv39, -1
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %bound071 = icmp ult double* %scevgep63, %scevgep69
  %bound172 = icmp ult double* %scevgep67, %scevgep65
  %memcheck.conflict74 = and i1 %bound071, %bound172
  br i1 %memcheck.conflict74, label %.ph76.lver.orig.preheader, label %.ph76

.ph76.lver.orig.preheader:                        ; preds = %.lver.check75
  br label %.ph76.lver.orig

.ph76.lver.orig:                                  ; preds = %.ph76.lver.orig..ph76.lver.orig_crit_edge, %.ph76.lver.orig.preheader
  %indvars.iv31.lver.orig = phi i64 [ %indvars.iv.next32.lver.orig, %.ph76.lver.orig..ph76.lver.orig_crit_edge ], [ 1, %.ph76.lver.orig.preheader ]
  %149 = add nsw i64 %indvars.iv31.lver.orig, -1
  %150 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %149
  %151 = load double, double* %150, align 8
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  %153 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %148, i64 %indvars.iv31.lver.orig
  %154 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv31.lver.orig
  %156 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %149
  %157 = insertelement <2 x double> undef, double %151, i32 0
  %158 = shufflevector <2 x double> %157, <2 x double> undef, <2 x i32> zeroinitializer
  %159 = fmul <2 x double> %46, %158
  %160 = fadd <2 x double> %47, %159
  %161 = extractelement <2 x double> %160, i32 0
  %162 = extractelement <2 x double> %160, i32 1
  %163 = fdiv double %29, %161
  store double %163, double* %152, align 8
  %164 = load double, double* %153, align 8
  %165 = fmul double %20, %164
  %166 = load double, double* %154, align 8
  %167 = fmul double %33, %166
  %168 = fsub double %167, %165
  %169 = load double, double* %155, align 8
  %170 = fmul double %20, %169
  %171 = fsub double %168, %170
  %172 = load double, double* %156, align 8
  %173 = fmul double %21, %172
  %174 = fsub double %171, %173
  %175 = fdiv double %174, %162
  %176 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  store double %175, double* %176, align 8
  %indvars.iv.next32.lver.orig = add nuw nsw i64 %indvars.iv31.lver.orig, 1
  %exitcond34.lver.orig = icmp eq i64 %indvars.iv.next32.lver.orig, %wide.trip.count33
  br i1 %exitcond34.lver.orig, label %._crit_edge15.us.loopexit, label %.ph76.lver.orig..ph76.lver.orig_crit_edge

.ph76.lver.orig..ph76.lver.orig_crit_edge:        ; preds = %.ph76.lver.orig
  br label %.ph76.lver.orig

.ph76:                                            ; preds = %.lver.check75
  %scevgep77 = getelementptr [1000 x double], [1000 x double]* %4, i64 %140, i64 0
  %scevgep82 = getelementptr [1000 x double], [1000 x double]* %5, i64 %140, i64 0
  %load_initial78 = load double, double* %scevgep77, align 8
  %load_initial83 = load double, double* %scevgep82, align 8
  br label %195

._crit_edge19.us.loopexit:                        ; preds = %.lr.ph18.us
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %.lr.ph18.us.prol.loopexit.._crit_edge19.us_crit_edge, %._crit_edge15.us.._crit_edge19.us_crit_edge, %._crit_edge19.us.loopexit
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  %indvar.next62 = add i64 %indvar61, 1
  br i1 %exitcond42, label %._crit_edge22.loopexit, label %._crit_edge19.us..lver.check75_crit_edge

._crit_edge19.us..lver.check75_crit_edge:         ; preds = %._crit_edge19.us
  br label %.lver.check75

.lr.ph18.us:                                      ; preds = %.lr.ph18.us..lr.ph18.us_crit_edge, %.lr.ph18.us.preheader85
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.lr.ph18.us..lr.ph18.us_crit_edge ], [ %indvars.iv35.unr.ph, %.lr.ph18.us.preheader85 ]
  %177 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv35
  %178 = load double, double* %177, align 8
  %179 = add nsw i64 %indvars.iv35, 1
  %180 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %179
  %181 = load double, double* %180, align 8
  %182 = fmul double %178, %181
  %183 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv35
  %184 = load double, double* %183, align 8
  %185 = fadd double %182, %184
  %186 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv35
  store double %185, double* %186, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  %187 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv.next36
  %188 = load double, double* %187, align 8
  %189 = fmul double %188, %185
  %190 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv.next36
  %191 = load double, double* %190, align 8
  %192 = fadd double %189, %191
  %193 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next36
  store double %192, double* %193, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, -2
  %194 = icmp sgt i64 %indvars.iv.next36, 1
  br i1 %194, label %.lr.ph18.us..lr.ph18.us_crit_edge, label %._crit_edge19.us.loopexit

.lr.ph18.us..lr.ph18.us_crit_edge:                ; preds = %.lr.ph18.us
  br label %.lr.ph18.us

; <label>:195:                                    ; preds = %._crit_edge91, %.ph76
  %store_forwarded84 = phi double [ %load_initial83, %.ph76 ], [ %217, %._crit_edge91 ]
  %store_forwarded81 = phi double [ %load_initial78, %.ph76 ], [ %206, %._crit_edge91 ]
  %indvars.iv31 = phi i64 [ 1, %.ph76 ], [ %indvars.iv.next32, %._crit_edge91 ]
  %196 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv31
  %197 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %148, i64 %indvars.iv31
  %198 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv31
  %199 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv31
  %200 = insertelement <2 x double> undef, double %store_forwarded81, i32 0
  %201 = shufflevector <2 x double> %200, <2 x double> undef, <2 x i32> zeroinitializer
  %202 = fmul <2 x double> %51, %201
  %203 = fadd <2 x double> %52, %202
  %204 = extractelement <2 x double> %203, i32 0
  %205 = extractelement <2 x double> %203, i32 1
  %206 = fdiv double %29, %204
  store double %206, double* %196, align 8
  %207 = load double, double* %197, align 8
  %208 = fmul double %20, %207
  %209 = load double, double* %198, align 8
  %210 = fmul double %33, %209
  %211 = fsub double %210, %208
  %212 = load double, double* %199, align 8
  %213 = fmul double %20, %212
  %214 = fsub double %211, %213
  %215 = fmul double %21, %store_forwarded84
  %216 = fsub double %214, %215
  %217 = fdiv double %216, %205
  %218 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv31
  store double %217, double* %218, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge15.us.loopexit89, label %._crit_edge91

._crit_edge91:                                    ; preds = %195
  br label %195

._crit_edge15.us.loopexit:                        ; preds = %.ph76.lver.orig
  br label %._crit_edge15.us

._crit_edge15.us.loopexit89:                      ; preds = %195
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit89, %._crit_edge15.us.loopexit
  %219 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %37
  store double 1.000000e+00, double* %219, align 8
  br i1 %48, label %.lr.ph18.us.preheader, label %._crit_edge15.us.._crit_edge19.us_crit_edge

._crit_edge15.us.._crit_edge19.us_crit_edge:      ; preds = %._crit_edge15.us
  br label %._crit_edge19.us

.lr.ph18.us.preheader:                            ; preds = %._crit_edge15.us
  br i1 %49, label %.lr.ph18.us.preheader..lr.ph18.us.prol.loopexit_crit_edge, label %.lr.ph18.us.prol

.lr.ph18.us.preheader..lr.ph18.us.prol.loopexit_crit_edge: ; preds = %.lr.ph18.us.preheader
  br label %.lr.ph18.us.prol.loopexit

.lr.ph18.us.prol:                                 ; preds = %.lr.ph18.us.preheader
  %220 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %34
  %221 = load double, double* %220, align 8
  %222 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %38
  %223 = load double, double* %222, align 8
  %224 = fmul double %221, %223
  %225 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %34
  %226 = load double, double* %225, align 8
  %227 = fadd double %224, %226
  %228 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %34
  store double %227, double* %228, align 8
  br label %.lr.ph18.us.prol.loopexit

.lr.ph18.us.prol.loopexit:                        ; preds = %.lr.ph18.us.preheader..lr.ph18.us.prol.loopexit_crit_edge, %.lr.ph18.us.prol
  %indvars.iv35.unr.ph = phi i64 [ %indvars.iv.next36.prol, %.lr.ph18.us.prol ], [ %34, %.lr.ph18.us.preheader..lr.ph18.us.prol.loopexit_crit_edge ]
  br i1 %50, label %.lr.ph18.us.prol.loopexit.._crit_edge19.us_crit_edge, label %.lr.ph18.us.preheader85

.lr.ph18.us.prol.loopexit.._crit_edge19.us_crit_edge: ; preds = %.lr.ph18.us.prol.loopexit
  br label %._crit_edge19.us

.lr.ph18.us.preheader85:                          ; preds = %.lr.ph18.us.prol.loopexit
  br label %.lr.ph18.us

._crit_edge22.loopexit:                           ; preds = %._crit_edge19.us
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %.preheader.._crit_edge22_crit_edge, %.preheader4.._crit_edge22_crit_edge, %._crit_edge22.loopexit
  %229 = add nuw nsw i32 %.0323, 1
  %exitcond43 = icmp eq i32 %.0323, %0
  br i1 %exitcond43, label %._crit_edge24.loopexit, label %._crit_edge22..preheader4_crit_edge

._crit_edge22..preheader4_crit_edge:              ; preds = %._crit_edge22
  br label %.preheader4

._crit_edge24.loopexit:                           ; preds = %._crit_edge22
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %.._crit_edge24_crit_edge, %._crit_edge24.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge:                          ; preds = %2
  br label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count7 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us..preheader.us_crit_edge ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge9, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge9 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %10
  br label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %._crit_edge, %15
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge9:                                     ; preds = %17
  br label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %.._crit_edge4_crit_edge, %._crit_edge4.loopexit
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
